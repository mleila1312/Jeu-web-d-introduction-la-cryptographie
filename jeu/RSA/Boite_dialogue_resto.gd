extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var dialogues = {
	[0,0] : [true, "Vous voilà ! Bonjour."],
	[0,1] : [true, "Téma"],
	[0,2] : [false, "finito"],
	[1,0] : [true, "Regarde mon schéma de fou"],
	[1,1] : [true, "Vraiment finito"]
}

func has_tete(numero):
	return dialogues[numero][0]

func dialogue(numero):
	$text.text = (dialogues[numero])[1]

var current_state = 0
var current_text = 0

var renvoi = false

func incr_dialogue():
	if(dialogues.has([current_state, current_text + 1])):
		dialogue([current_state, current_text + 1])
		current_text += 1
		renvoi = false
	else:
		current_state += 1
		current_text = 0
		if(dialogues.has([current_state, 0])):
			dialogue([current_state, 0])
		renvoi = true
	if(dialogues.has([current_state, current_text])):
		if(has_tete([current_state, current_text])):
			print("tete")
			$tete.show()
		else:
			print("pas tete")
			$tete.hide()
	return renvoi
