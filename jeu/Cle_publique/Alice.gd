extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$envoyé.hide()
	$msg_crypté.hide()
	$Clés.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var code = false
var msg_crypte = ""

func _on_envoyer_pressed():
	get_node("../../interaction").envoyer_message($TextEdit.text, msg_crypte, code)
	$TextEdit.text = ""
	$msg_crypté.hide()
	$crypt_state.texture = load("res://images/non crypté.png")

var characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789&é(-è_çà)~#{[|@$*ù!:,;.?/§]}="

func generate_random_string(length):
	var result = ""
	for i in range(length):
		var random_index = randi() % characters.length()
		result += characters[random_index]
	return result

func _on_choix_publique_pressed():
	msg_crypte = generate_random_string(40)
	code = true
	get_node("msg_crypté/msgcrypté").text = msg_crypte
	$crypt_state.texture = load("res://images/crypté.png")
	$"msg_crypté".show()
	
func _on_text_edit_text_changed():
	code = false
	$"msg_crypté".hide()
	$Clés.hide()
	$crypt_state.texture = load("res://images/non crypté.png")

func _on_sortie():
	$Clés.hide()

func _on_choix_privée_pressed():
		get_node("../Popups").montrer_alice_privée()


func _on_button_decrypter_pressed():
	$Clés.show()
