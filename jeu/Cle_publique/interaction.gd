extends Node2D

var messages_list = []
var code_list = []

# Alerte tout le monde d'un nouveau message
func envoyer_message(message, message_crypte, code):
	messages_list.append(message)
	code_list.append(code)
	$Bob.update_message_code(message, message_crypte, code)
	$Eve.update_message_code(message, message_crypte, code)
	get_node("Alice/envoyé").montrer()
	$Bob.next_jaune()
	$Eve.next_jaune()

func entrer():
	self.show()
	$progression.dialogue_show()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Bob.hide()
	$Eve.hide()
	$Alice.show()
	$Selecteur.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_select_alice_pressed():
	$Bob.hide()
	$Eve.hide()
	$Alice.show()

func _on_select_bob_pressed():
	$Bob.show()
	$Eve.hide()
	$Alice.hide()
	

func _on_select_eve_pressed():
	$Bob.hide()
	$Eve.show()
	$Alice.hide()

func _on_envoyer_pressed():
	pass # Replace with function body.
