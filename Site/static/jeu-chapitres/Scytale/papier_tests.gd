extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = ""
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func sortir():
	visible = true
func fermer():
	visible = false

@onready var espaces = [8, 8, 8, 7, 8, 7, 6, 6, 6, 7, 6, 5, 4, 4, 3, 4, 4, 3]
func lettreMessage(message, i) :
	if i < len(message)  : 
		return message[i]
	else :
		return " "

func _on_message_a_afficher(message) :
	var newMessage = ""
	for i in range(0,9) :
		newMessage += lettreMessage(message, i) + lettreMessage(message, i + 9)
		
		
	sortir()
	$Label.text = ""
	for i in range(len(newMessage)) :
		for loop in range(espaces[i]) :
			$Label.text += " "
		$Label.text += newMessage[i]
		if i < len(newMessage)-1 :
			$Label.text += "\n"

