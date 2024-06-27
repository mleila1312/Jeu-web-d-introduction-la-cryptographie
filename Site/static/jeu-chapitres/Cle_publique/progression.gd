extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("../offbut").hide()
	$Boite_dialogue_ici.hide()
	$Boite_dialogue_ici.dialogue([0, 0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var state = 0
var est_visible = false

func dialogue_hide():
	est_visible = false
	$Boite_dialogue_ici.hide()
	
func dialogue(n):
	$Boite_dialogue_ici.dialogue(n)
	
func dialogue_show():
	est_visible = true
	$Boite_dialogue_ici.show()
	self.show()

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if(0 <= state and state <= 5 and est_visible):
			print(state)
			if($Boite_dialogue_ici.incr_dialogue()):
				state += 1
				dialogue_hide()



func done_code_bob():
	if(state == 3):
		dialogue_show()

func done_non_code_bob():
	if(state == 1):
		dialogue_show()
	
func done_code_eve():
	if(state == 4):
		dialogue_show()
		get_node("../offbut").show()
	
func done_non_code_eve():
	if(state == 2):
		dialogue_show()


func _on_off_button_pressed():
	if(state == 5):
		get_node("../../interaction").hide()
		get_node("../../fin").entrer()
