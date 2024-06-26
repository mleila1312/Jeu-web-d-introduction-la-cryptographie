extends Node2D
#indique si le mini jeu etienne est fait et si le verre a été obtenu dans la biliothèque
var etienne_is_finished= false;
var drink_is_finished=false;
#indique si l'on est après le premier déchiffrement et si le poignard a été trouvé
var post_dechiffrement= false;
var poignard_found=false;

#iitiaisation après le premier déchiffrement
func init_post_dechiffrement():
	post_dechiffrement=true; 
	$feu.hide();
	$Etienne.hide();
	$Bibliotheque.hide();
	$bureau.show();
	$bureau.init_post_dechiffr(poignard_found);
	
#si on veut aller à droite du bureau
func _on_bureau_droite_bureau():
	$bureau.hide();
	$feu.show();
	if not post_dechiffrement:
		$feu.init_feu(etienne_is_finished, drink_is_finished);
	else : 
		$feu.init_post_dechiffr();

#si on veut aller à gauche du bureau
func _on_bureau_gauche_bureau():
	$bureau.hide();
	$Etienne.show();
	if post_dechiffrement : 
		$Etienne.init_post_dechiffr()

#initialise la phase 3 ie pieces
func init_phase3() : 
	$Bibliotheque.hide();
	$feu.hide();
	$bureau.hide();
	$Etienne.show();
	$Etienne.init_phase3();

#si on veut fouiller la pièce durant les questions d'Etienne
func _on_phase_2_fouille_piece():
	$bureau.show();
	$bureau.fouille();
	get_parent().get_node("phase2").hide();
	get_parent().get_node("phase1").hide();
	get_parent().get_node("bg_Image").hide();

#si on revient à la question d'etinne
func _on_bureau_retour_quest():
	$bureau.hide();
	get_parent().get_node("phase2").show();
	get_parent().get_node("phase2").retour_question();
	get_parent().get_node("bg_Image").show();

#si on veut aller à gauche d'étienne
func _on_etienne_gauche_etienne():
	$bureau.show();
	if post_dechiffrement : 
		$bureau.init_post_dechiffr(poignard_found);
	$Etienne.hide();
	get_parent().get_parent().get_node("Boite_dialogue").hide();

#si on veut aller à droite d'étienne
func _on_etienne_droite_etienne():
	$Bibliotheque.show();
	if not post_dechiffrement :
		$Bibliotheque.init_bibli();
	else : 
		$Bibliotheque.init_post_dechiffr(poignard_found);
	$Etienne.hide();
	get_parent().get_parent().get_node("Boite_dialogue").hide();

#si on veut aller à gauche de la bibliotheque
func _on_bibliotheque_gauche_bibli():
	$Etienne.show();
	$Bibliotheque.hide();
	if post_dechiffrement : 
		$Etienne.init_post_dechiffr()

#si on veut aller à droite de la bibli
func _on_bibliotheque_droite_bibli():
	$feu.show();
	if not post_dechiffrement:
		$feu.init_feu(etienne_is_finished, drink_is_finished);
	else : 
		$feu.init_post_dechiffr();
	$Bibliotheque.hide();

#si on veut aller à droite du feu
func _on_feu_droite_feu():
	$bureau.show();
	$feu.hide();
	if post_dechiffrement : 
		$bureau.init_post_dechiffr(poignard_found);

#si on veut aller à gauche du feu
func _on_feu_gauche_feu():
	$feu.hide();
	$Bibliotheque.show();
	if not post_dechiffrement :
		$Bibliotheque.init_bibli();
	else : 
		$Bibliotheque.init_post_dechiffr(poignard_found);
	

#si le jeu d'étienne est fini
func _on_etienne_etienne_done():
	etienne_is_finished=true;#si le jeu de la bibli est fini
func _on_bibliotheque_finished_step():
	drink_is_finished=true;

#si le poignard est trouvé
func _on_bureau_poignard():
	poignard_found=true;
