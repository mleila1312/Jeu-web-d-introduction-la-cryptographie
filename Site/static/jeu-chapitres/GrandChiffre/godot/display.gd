extends Node2D

#indique l'état du jeu
var state_display = -1;

#cette fonction est lancé dès que le node apparaît dans la scène
func _ready():
	$decryptage.deactivate()

#initialise les pièces après que le premier déchiffrement ait été fait
func set_pieces_second_round():
	$pieces.show();
	$pieces.init_post_dechiffrement();
	$decryptage.deactivate()

#lance phase 3 où le joueur peut fouiller la pièce et à différents visu(voir pieces)
func _on_phase_2_fin_phase_2():
	$phase2.hide();
	$pieces.show();
	$pieces.init_phase3();
	$decryptage.deactivate();

#lorsque le joueur à pu obtenir le code après avoir mis le papier devant le feu, il commence le premierjeu de déchiffrement
func _on_feu_finished_pieces():
	$pieces.hide();
	$decryptage.activate();
	get_parent().get_node("Boite_dialogue").hide();
	$decryptage.init_game();

##lorsque le premier jeu de déchiffrement a été fini
func _on_decryptage_finish_decrypt():
	var dialogues= get_parent().get_node("Boite_dialogue")
	$decryptage.deactivate()
	dialogues.show();
	state_display+=1;
	
	
#gère les click et affiche les dialogues en fonction de cela et de l'état actuel du jeu
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo() :
		var dialogues= get_parent().get_node("Boite_dialogue")
		if state_display==0 or state_display==1: 
			$bg_Image.change_bg("discussion_tardive.png")
			dialogues.dialogue(-37-state_display)
			state_display+=1
		elif state_display==2 : 
			$bg_Image.change_bg("dodo.png")
			dialogues.dialogue(-37-state_display)
			state_display+=1
		elif state_display==3: 
			print("display")
			state_display+=1;
			dialogues.hide();
			set_pieces_second_round()
	

# lorsque le livre a été ouvert ouvert avec le poignard, on lance alors le 2ème déchiffrement
func _on_bibliotheque_fin():
	$pieces.hide()
	$second_decode.activate()
