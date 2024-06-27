extends Sprite2D

signal trouve
signal pastrouve

# Fonction appelée lorsque le bouton de soumission est cliqué
func _on_SubmitButton_pressed():
	var entered_word = $Case1/Lettre1.text + $Case2/Lettre2.text + $Case3/Lettre3.text + $Case4/Lettre4.text + $Case5/Lettre5.text
	if entered_word.to_upper() == "COEUR":
		print("Félicitations vous avez retrouvé la clé de chiffrement")
		trouve.emit();
	else:
		print("Veuillez réessayer, la clé trouvée est fausse")
		pastrouve.emit()
		#$ErrorMessage.show()
		#$SuccessMessage.hide()

#func _ready():
	#$SuccessMessage.hide()
	#$ErrorMessage.hide()
