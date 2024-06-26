extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var dialogues = {
	[0,0] : "Hop hop hop je décode ton bazar",
	[0, 1] : "Allez casse-toi"
}

func dialogue(numero):
	$text.text = dialogues[numero]

var current_state = 0
var current_text = 0

func incr_dialogue():
	if(dialogues.has([current_state, current_text + 1])):
		dialogue([current_state, current_text + 1])
		current_text += 1
		return false
	else:
		current_state += 1
		current_text = 0
		if(dialogues.has([current_state, 0])):
			dialogue([current_state, 0])
		return true
