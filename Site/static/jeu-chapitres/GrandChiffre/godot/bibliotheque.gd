extends Node2D
#signaux pour indiquer dans quel sens souhaite aller le joueur ensuite
signal droite_bibli;
signal gauche_bibli;

#indique si le jeu de la bibliothèque initial à été fini
var finished_game=false
#signal pour indiquer si le jeu a bien été fini
signal finished_step;

#indique si le poignard à bien été trouvé juste avant la 2nde phase de décryptage et si on est après la 1ère phase de décryptage
var poignard_found=false;
var post_decrypt = false;
#signal indiquant que le mini jeu est fini ie le joueur à ouvert le livre et découvert un message chiffré sur l'homme au masque de fer
signal fin

#initialise la bibliothèque
func init_bibli() :
	$jeu_bibliotheque.hide()

#initialise la salle de la bibliothèque une fois que la première phase de décryptage à été faite
func init_post_dechiffr(poignard) :
	$jeu_bibliotheque.hide()
	$background.texture=load("res://images/bibli_nuit.png")
	poignard_found=poignard
	post_decrypt=true
	$jeu_bibliotheque.hide()

#envoie un signal indiquant qu'on souhaite aller à droite
func _on_button_droite_pressed():
	droite_bibli.emit();

#envoie un signal indiquant qu'on souhaite aller à gauche
func _on_button_gauche_pressed():
	gauche_bibli.emit();

#initialise le jeu de la partie bibliothèque
func init_game_bibli():
	if post_decrypt : 
		#si le premier déchiffrement à été fait
		$jeu_bibliotheque.show();
		$jeu_bibliotheque.post_decrypt_books(poignard_found);
	elif finished_game : 
		#si le mini jeu à déjà été résolu
		$jeu_bibliotheque.show();
		$jeu_bibliotheque.load_finished_game();
	else : 
		#si le mini jeu n'a pas été résolu
		$jeu_bibliotheque.show();
		$jeu_bibliotheque.init_game()


#fonction lancé lorsque le joueur souhaite sortir du jeu de la bibliothèque
func _on_jeu_bibliotheque_goback(finished):
	finished_game=finished;
	$jeu_bibliotheque.hide();
	self.show();
	if finished: 
		#si le jeu est fini, on stock qu'il est fini dans un noeud supérieur
		finished_step.emit();


#function exécutée lorsque le poignard a été obtenu
func _on_jeu_bibliotheque_fin_fouille_2():
	fin.emit()
