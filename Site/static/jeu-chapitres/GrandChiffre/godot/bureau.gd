extends Node2D

#signaux indiquant le mouvement du joueur
signal droite_bureau;
signal gauche_bureau;

#si le joueur n'est pas encore dans la phase où il peut aller dans toutes les pièces mais seulement au tout début où il peut regarder ce qu'il y a sur son bureau pour répondre à la question d'Etienne, fouiller=true, sinon false
var fouiller = false;
#lorsque le joueur souhaite retourné à la questiond'Etienne après avoir vu les papiers
signal retour_quest;
#état dans le jeu nous permettant, en fonction de sa valeur de nous situer dans l'avancement et d'afficher les bons dialogues etc
var state=0;
#indique si le 1er déchifrement à été fait
var post_dechiffr=false
#indique si le poignard à déjà été trouvé
var poignard_found=false;
#signal qui est envoyé si le poignard à été trouvé
signal poignard;
# Called when the node enters the scene tree for the first time.

func init_post_dechiffr(poignard_prec) : 
	#initialise le bureau après le premier déchiffrement
	$background.show()
	$background.texture=load("res://images/bureau_nuit.png")
	post_dechiffr=true; 
	poignard_found= poignard_prec
	$button_bureau.show();
	$button_feuilles.hide();
	$droite.show();
	$gauche.show();
	$retour_question.hide();
	$feuilles_post_dechiffre.hide()
	
func _ready():
	#est appellée dès que le noeud entre sur la scène(sorte d'initialisation)
	$button_feuilles.hide();
	$retour_question.hide();
	$feuilles_post_dechiffre.hide()
	
func fouille():
	#est appellée lorsque qu'on est dans la première phase de fouille pour répondre à la question d'Etienne, initialise la scène
	$droite.hide();
	$gauche.hide();
	$background.texture = load("res://images/bureau.png");
	$background.show();
	$button_bureau.show();
	$button_feuilles.hide();
	fouiller = true;
	$retour_question.show();
	
func _on_texture_button_pressed():
	#est appellée si le joueur clique sur le bureau
	if not post_dechiffr : 
		#si on est avant le déchiffrement
		$background.texture = load("res://images/feuilles.png");
		$button_bureau.hide();
		$button_feuilles.show();
		$droite.hide();
		$gauche.hide();
		if fouiller : 
			get_parent().get_parent().get_parent().get_node("Boite_dialogue").hide()
			$retour_question.hide();
	else : 
		#si on a déjà fait le 1er déchiffrement
		$feuilles_post_dechiffre.show()
		$feuilles_post_dechiffre.init_phase(poignard_found)
		$button_bureau.hide();
		$droite.hide();
		$gauche.hide();

func _on_button_feuilles_pressed():
	#lorsque le joueur veut partir de la vision des feuilles sur le bureau
	if not post_dechiffr : 
		#si on est avant le premier déchiffrement
		$background.texture = load("res://images/bureau.png");
		$button_bureau.show();
		$button_feuilles.hide();
		if not fouiller : 
			#si on n'est pas dans la phase de question d'Etienne
			$droite.show();
			$gauche.show();
		else : 
			$retour_question.show();
	else : 
		#si on a déjà fait le premier déchiffrement
		$feuilles_post_dechiffre.hide()
		$droite.show();
		$gauche.show();
		$button_bureau.show();

func init_fouille_bureau():
	#fonction appellée lors de l'initialisation de la scène après les questions d'Etienne
	$button_bureau.show();
	$button_feuilles.show();
	$droite.show();
	$gauche.show();
	$retour_question.hide();
	fouiller=false;

func _on_gauche_pressed():
	#si le joueur veut aller à gauche
	droite_bureau.emit()

func _on_droite_pressed():
	#si le joueur veut aller à droite
	gauche_bureau.emit();

func _input(event):
	#si il y a un click et que l'on est dans un état particulier, on peut afficher un certan diolague/texte
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if fouiller and state==0: 
			get_parent().get_parent().get_parent().get_node("Boite_dialogue").hide()
			state+=1;


func _on_retour_question_pressed():
	#lancé lorsque le joueur souhaite revenir à la question d'Etienne
	retour_quest.emit();
	get_parent().get_parent().get_parent().get_node("Boite_dialogue").show()


func _on_feuilles_post_dechiffre_goback_feuilles(found):
	$feuilles_post_dechiffre.hide()
	$droite.show();
	$gauche.show();
	$button_bureau.show();
	poignard_found=found
	poignard.emit();
