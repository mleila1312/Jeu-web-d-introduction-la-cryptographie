extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$schéma.hide()
	$Boite_dialogue_resto.hide()
	$TransitionScreen2.hide()
	
var state = 0

func entrer():
	self.show()
	$Boite_dialogue_resto.show()

func _process(_delta):
	pass
	
# Pour faire avancer le dialogue, fonction plus pratique pour incrémenter les dialogues expliquée dans boite_dialogue_resto.gd
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo() and self.is_visible_in_tree():
		if($Boite_dialogue_resto.incr_dialogue()):
			state += 1
		if(state == 1):
			$schéma.show()
		elif(state == 2):
			$TransitionScreen2.show()
			$TransitionScreen2.transition()

func _on_transition_screen_transitioned():
	$Boite_dialogue_resto.hide()
	hide()
	get_node("../interaction").entrer()


func _on_transition_screen_finished():
	$TransitionScreen2.hide()
