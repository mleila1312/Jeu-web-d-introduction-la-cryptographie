extends Node2D

var state = 0; # variable qui garde la trace de l'état actuel du jeu.
var dialogue = 0; # variable qui garde la trace du numéro de dialogue actuel.
var dialogue_arene = 0;  # variable qui garde la trace du numéro de dialogue dans l'arène.

###Signaux
#Signal dans scène porte
signal entree_porte



# Called when the node enters the scene tree for the first time.
func _ready():
	$boite_dialogue.hide();
	$arene_contours.hide();
	$arene.hide();
	$porte_arene.hide();
	$salle_coffres.hide();
	get_node("display/phase1").set_zzz()


func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		match state:
			0:
				await get_tree().create_timer(0.02).timeout;
				get_node("display/phase1").stop_beginning();
				$arene_contours.show();
				$boite_dialogue.show();
				show_dialogue(dialogue)


			1:
				await get_tree().create_timer(0.02).timeout;
				$arene.show();
	
			2:
				await get_tree().create_timer(0.02).timeout;
				$porte_arene.show();
			
				


#Fonction pour l'affichage du dialogue général
func show_dialogue(index):
	$boite_dialogue.dialogue(index)

#Fonction pour l'affichage du dialogue de l'arène
func show_dialogue_arene(index):
	$boite_dialogue.dialogue_arene(index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state==0 : 
		get_node("display/phase1").affiche_zzz(delta);


###----------------------------------------------SCENE ARENE
#Entrée dans la scène (on clique sur l'arène)
func _on_arene_button_pressed():
	state += 1;
	dialogue += 1;
	$boite_dialogue.dialogue(dialogue);
	$arene_contours.hide();

#Affichage du dialogue quand on est dans l'arène
func _on_arene_dialogue_entree():
	$boite_dialogue/text.text = "Ah... je suis dans une arène de Gladiateurs et je dois me combattre à mort... comment faire pour m'en sortir ?"

		
#Anagramme pas complété
func _on_arene_anagramme_faux():
	$boite_dialogue/text.text = "L'anagramme recherché est en deux mots et sans accents car c'est du latin. Fait \"entrer\" quand tu penses avoir la bonne réponse."


#Anagramme avec une erreur
func _on_arene_ave_cesar():
	$boite_dialogue/text.text = "Attention, en latin César ne s'écrit pas comme aujourd'hui, il manque une lettre !"

#Anagramme trop long
func _on_arene_text_long():
	$boite_dialogue/text.text = "Le texte est trop long, le premier mot a trois lettres, le second 6 lettres"
	
#Anagramme bien complété
func _on_arene_bravo():
		$arene/VaeCasera.hide();
		$arene/AveCaesar.show();
		$boite_dialogue/text.text = "Bien joué, tu as trouvé la bonne citation \"Ave Caesar, morituri te salutant\" qui signifie \"Salut César, ceux qui vont mourir te saluent\", 
		\tparoles que prononçaient, devant la loge impériale, les gladiateurs qui défilaient dans le cirque avant le combat.
		\tMaintenant dirige-toi vers la porte pour t'échaper du combat."



#Sortie de la scène
func _on_arene_anagramme_fini():
	state += 1;
	dialogue += 1;
	$arene.hide();
	show_dialogue(dialogue)
	
###----------------------------------------------SCENE PORTE
#Affichage dialogue à l'entrée dans la scène
func _on_porte_arene_dialogue_entree():
	show_dialogue(2)
	$boite_dialogue.hide()

#Bouton flèche droite pour faire défiler le texte de l'espion
func _on_porte_arene_dialogue_arene():
	$boite_dialogue.show()
	if dialogue_arene != 3:
		show_dialogue_arene(dialogue_arene)
		dialogue_arene += 1
	else :
		$boite_dialogue.hide();
		emit_signal("entree_porte")

#Signal de sortie de la scène porte por aller vers salle des coffres
func _on_porte_arene_sortie_porte():
	state += 1
	dialogue += 1
	$porte_arene.hide()
	$salle_coffres.show()

	
###----------------------------------------------SCENE SALLE COFFRES
