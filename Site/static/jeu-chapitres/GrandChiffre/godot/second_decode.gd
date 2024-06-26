extends Node2D

#état de référencement pour gérer les dialogues
var state_finish_code=-1

#initialise le 2ème phase de decryptage
func init_second_decode() : 
	var dialogues= get_parent().get_parent().get_node("Boite_dialogue");
	$dechiffre.deactivate2()
	$bg.texture = load("res://images/book_masque_fer.png");
	state_finish_code=0
	dialogues.show();
	dialogues.dialogue(-42)

#désactive complètemet le fonctionnement d'un  noeud
func deactivate():
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)

#éactive le noeaus
func activate():
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
	init_second_decode()

#gère les dialogue qui s'affichent à la fin ainsi que les images de fond
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		var dialogues= get_parent().get_parent().get_node("Boite_dialogue");
		if state_finish_code==0 : 
			dialogues.dialogue(-43)
			state_finish_code+=1
		elif state_finish_code==1 :
			dialogues.hide()
			$dechiffre.activate2()
			state_finish_code+=1
		elif state_finish_code==3 : 
			dialogues.show()
			$bg.texture = load("res://images/marche.png");
			dialogues.dialogue(-46)
			state_finish_code+=1
		elif state_finish_code==4 : 
			dialogues.show()
			$bg.texture = load("res://images/forteresse.png");
			dialogues.dialogue(-47)
			state_finish_code+=1
		elif state_finish_code==5 : 
			dialogues.show()
			$bg.texture = load("res://images/marche_foret.png");
			dialogues.dialogue(-48)
			state_finish_code+=1
		elif state_finish_code==6 : 
			dialogues.show()
			$bg.texture = load("res://images/creuse.png");
			dialogues.dialogue(-49)
			state_finish_code+=1
		elif state_finish_code==7 : 
			dialogues.show()
			$bg.texture = load("res://images/trou.png");
			dialogues.dialogue(-50)
			state_finish_code+=1
		elif state_finish_code==8 : 
			dialogues.show()
			$bg.texture = load("res://images/trou_masque.png");
			dialogues.dialogue(-51)
			state_finish_code+=1
		elif state_finish_code==9 : 
			dialogues.show()
			$bg.texture = load("res://images/masque_approche.png");
			dialogues.dialogue(-52)
			state_finish_code+=1
		elif state_finish_code==10 : 
			dialogues.show()
			$bg.texture = load("res://images/masque_zoom.png");
			dialogues.dialogue(-53)
			state_finish_code+=1
		elif state_finish_code==11 : 
			dialogues.show()
			$bg.texture = load("res://images/teleporte.png");
			dialogues.dialogue(-54)
			state_finish_code+=1
		elif state_finish_code==12 : 
			$bg.texture = load("res://images/fin.png");
			dialogues.hide()
			state_finish_code+=1
			
# montre une blle de diaogue avant de les lancer sur les clicks
func _on_dechiffre_fin_jeu():
	get_parent().get_parent().get_node("Boite_dialogue").show();
	$dechiffre.deactivate2()
	state_finish_code=3
	
