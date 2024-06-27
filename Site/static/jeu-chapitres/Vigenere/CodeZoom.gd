extends Sprite2D
signal trouve
signal pastrouve


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_SubmitButton_pressed():
	var entered_word = $Chiffre1.text + $Chiffre2.text + $Chiffre3.text + $Chiffre4.text
	if entered_word.to_upper() == "4123":
		print("Félicitations vous avez retrouvé la clé de chiffrement")
		trouve.emit()
	else:
		print("Veuillez réessayer, la clé trouvée est fausse")
		pastrouve.emit();
