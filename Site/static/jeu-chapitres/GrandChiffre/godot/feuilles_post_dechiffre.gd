extends Node2D

#signal si l'on souhaite s'éloigner des feuilles sur le bureau après le 1er décryptage et si l'on a obtenu le poignard
signal goback_feuilles(found);
#indique si le poignard a déjà été trouvé
var found=false
#indique l'état dans la mini scène feuilles sur le bureau
var state_poign=-1
#permet de compter les feuilles pour savoir lesquelles on a soulevées lorsqu'on les parcourt
var count = 1

#initialise la scène 
func init_phase(poignard):
	#si le poignard a déjà été trouvé : 
	if poignard : 
		$bg.texture = load("res://images/bureau_sans_couteau.png")
		$poignard_button.hide();
		found=true;
		$precedente.hide();
		for i in range(1, 7) : 
			get_node("feuille"+str(i)).show()
		$retour.show();
	else: #sinon
		$bg.texture = load("res://images/bureau_couteau.png")
		$precedente.hide();
		for i in range(1, 7) : 
			get_node("feuille"+str(i)).show()
		$retour.show();
		$poignard_button.show();

#lorsquo'n veut voir la feuille suivante
func _on_suivante_pressed():
	if count == 5 : #on arrive au bout des feuilles
		$suivante.hide();
	elif count ==1 : #on est à la toute première feuille
		$precedente.show()
	get_node("feuille"+str(count)).hide();
	count+=1;

#lorsquo'n veut revoir les feuilles qu'on à soulevé
func _on_precedente_pressed():
	if count == 2 : #on est au début des feuilles
		$precedente.hide();
	elif count ==6 : #on est à la fin des feuilles
		$suivante.show()
	count-=1;
	get_node("feuille"+str(count)).show();

#si on veut sortir de la vue de dessus sur le bureau
func _on_retour_pressed():
	emit_signal("goback_feuilles", found)

#si le joueur récupère le poignard
func _on_poignard_button_pressed():
	$bg.texture = load("res://images/bureau_sans_couteau.png")
	$poignard_button.hide();
	found=true;
	state_poign+=1
	
#gère le dialogue qui s'affiche lorsque le joueur récupère le poignard
func _input(event):
	var dialogues= get_parent().get_parent().get_parent().get_parent().get_node("Boite_dialogue")
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if state_poign ==0 : 
			dialogues.show();
			dialogues.dialogue(-40);
			state_poign+=1
		elif state_poign==1:
			print("feuilles")
			dialogues.hide();
			state_poign+=1
