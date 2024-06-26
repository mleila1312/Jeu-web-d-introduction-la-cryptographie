extends Node2D

#signaux pour indiquer la direction dans laquelle souhaite aller le joueur ensuite
signal droite_feu;
signal gauche_feu;

#signal indiquant si le mini jeu dans la scène Etienne est fini
var etienne= false;

#signal indiquant si le mini jeu de la bibliothèque est fini
var bibli=false;

#indique si l'ensemble des énigmes de la phase 3 sont finies(ie si on a réussi à allumer la machine etc)
signal finished_pieces;

#initialise la scène feu lorsque le premier déchiffrement à déjà été fait
func init_post_dechiffr() : 
	$affiche.hide();
	$machine.hide();
	$button_gauche.show();
	$button_right.show();
	$TextureRect.show();
	$TextureRect.texture=load("res://images/feu_nuit.png")
	$affiche_button.hide();
	$machine_button.hide();
	
#initialise la scène feu et stock si les mini jeux ont été finis
func init_feu(a, b):
	etienne=a;
	bibli=b;
	$affiche.hide();
	$machine.hide();
# Called when the node enters the scene tree for the first time.

#si le joueur souhaite ensuite aller à gauche
func _on_button_gauche_pressed():
	gauche_feu.emit();

#si le joueur souhaite ensuite aller à droite
func _on_button_right_pressed():
	droite_feu.emit();

#si le joueur click sur la machine
func _on_machine_button_pressed():
	$machine.show();
	$machine.init_machine(etienne, bibli)

#si le joueur clique sur l'affiche
func _on_affiche_button_pressed():
	$affiche.show()

#si le joueur s'éloigne de l'affiche pour regarder l'ensemble de la pièce
func _on_affiche_retour():
	$affiche.hide()

#si le joueur s'éloigne de l'affiche pour regarder l'ensemble de la pièce
func _on_machine_goback(finished):
	#si la machine a été allumée, on le signal au noeud display
	if finished : 
		finished_pieces.emit();
	else : 
		$machine.hide();
