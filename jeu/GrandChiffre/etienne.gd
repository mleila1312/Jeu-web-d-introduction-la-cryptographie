extends Node2D

#indique la direction dans laquelle on souhaite aller depuis la scène Etienne
signal droite_etienne;
signal gauche_etienne;

#l'état du jeu dans lequel on est par rapport aux dialogues
var state=0;

#indique si le jeu des fioles est fini ou non
var done=false;

#signale qui "prévient" pieces que le jeu de fioles est fini
signal etienne_done;

#initialise la scène d'étienne une fois que le premier déchiffrement à été fait
func init_post_dechiffr() : 
	$fond.show();
	$fond.texture=load("res://images/etienne_nuit.png");
	$fioles_button.hide();
	$gauche.show();
	$droite.show();
	$fioles.hide();

#si le joueur veut aller à gauche
func _on_gauche_pressed():
	gauche_etienne.emit()

#si le joueur veut aller à droite
func _on_droite_pressed():
	droite_etienne.emit();

#lorsque le joueur veut jouer au jeu des fioles
func _on_fioles_button_pressed():
	$droite.hide();
	$gauche.hide();
	$fioles.show();
	$fioles_button.hide()
	$fioles.check_if_obtained(done)
	get_parent().get_parent().get_parent().get_node("Boite_dialogue").hide();
	
#initialise la scène d'Etienne lorsque le joeur peut fouiller la pièce
func init_phase3():
	$fioles.hide();
	$droite.show();
	$gauche.show();
	$fioles_button.show();
	if not done : 
		$fioles.set_up();

#lorsque le joeur sort du jeu des fioles pour revenir à Etienne
func _on_fioles_retour_etienne():
	$fioles.hide();
	$droite.show();
	$gauche.show();
	$fioles_button.show();
	
#gère les clicks pour afficher des dialogues en fonction de l'état du jeu
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if state==0: 
			get_parent().get_parent().get_parent().get_node("Boite_dialogue").hide()
			state+=1;

#lancé que le jeu des fioles est fini afin de mettre à jour les variables
func _on_fioles_finished_game():
	done=true;
	etienne_done.emit()
