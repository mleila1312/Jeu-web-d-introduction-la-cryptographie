extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	$Boite_dialogue_fin.hide()
	$Boite_dialogue_fin.dialogue([0, 0])

func entrer():
	self.show()
	$Boite_dialogue_fin.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var state = 0

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if(state == 0 and self.is_visible_in_tree()):
			if($Boite_dialogue_fin.incr_dialogue()):
				state += 1
		elif(state == 1):
			get_tree().quit()
#Fini
