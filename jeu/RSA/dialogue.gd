extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$schéma.hide()
	$Boite_dialogue_resto.hide()
	
var state = 0

func entrer():
	self.show()
	$Boite_dialogue_resto.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo() and self.is_visible_in_tree():
		if($Boite_dialogue_resto.incr_dialogue()):
			state += 1
		if(state == 1):
			$schéma.show()
		elif(state == 2):
			hide()
			$Boite_dialogue_resto.hide()
			get_node("../interaction").entrer();
