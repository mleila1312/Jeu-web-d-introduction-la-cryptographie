extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$TableChiffrement.hide()
	$"LigneMalChiffrée".hide()
	$"LigneBienChiffrée".hide()
	$"LettreChiffréeComplétée".hide()
	$ZoomTabChiffrementExplication.hide()
	$"ZoomExplicationPpeChiffrementVigenère".hide()
	$"ScèneTransition2".hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	$LettreChiffrementVf.hide()
	$TableChiffrement.show()
	$ZoomExplicationPpeChiffrementVigenère.hide()
	$ZoomTabChiffrementExplication.hide()
	$L1.hide()
	$L3.hide()
	$L4.hide()
	$L5.hide()
	$L6.hide()
	$L7.hide()
	$L8.hide()
	$L9.hide()
	$L10.hide()
	$L11.hide()
	$L12.hide()
	$L13.hide()
	$L14.hide()
	$L15.hide()
	$L16.hide()
	$Button.hide()

func _on_texture_button_pressed_retour():
	$LettreChiffrementVf.show()
	$TableChiffrement.hide()
	$L1.show()
	$L3.show()
	$L4.show()
	$L5.show()
	$L6.show()
	$L7.show()
	$L8.show()
	$L9.show()
	$L10.show()
	$L11.show()
	$L12.show()
	$L13.show()
	$L14.show()
	$L15.show()
	$L16.show()
	$Button.show()
	
	
signal trouve
signal pastrouve

# Fonction appelée lorsque le bouton de soumission est cliqué
func _on_SubmitButton_pressed():
	var entered_word = $L1.text + $L2.text + $L3.text + $L4.text + $L5.text + $L6.text + $L7.text + $L8.text + $L9.text + $L10.text + $L11.text + $L12.text + $L13.text + $L14.text + $L15.text + $L16.text
	if entered_word.to_upper() == "OOGBVTSKUSTWIFCG":
		print("Félicitations vous avez retrouvé la clé de chiffrement")
		trouve.emit();
	else:
		print("Veuillez réessayer, la clé trouvée est fausse")
		pastrouve.emit()

func _on_pastrouve():
	$LettreChiffrementVf.hide()
	$FondBois.hide()
	$"LigneMalChiffrée".show()
	await get_tree().create_timer(3.0).timeout
	$LettreChiffrementVf.show()
	$FondBois.show()
	$"LigneMalChiffrée".hide()

func _on_trouve():
	$LettreChiffrementVf.hide()
	$FondBois.hide()
	$L1.hide()
	$L3.hide()
	$L4.hide()
	$L5.hide()
	$L6.hide()
	$L7.hide()
	$L8.hide()
	$L9.hide()
	$L10.hide()
	$L11.hide()
	$L12.hide()
	$L13.hide()
	$L14.hide()
	$L15.hide()
	$L16.hide()
	$Button.hide()
	$"LettreChiffréeComplétée".show()
	$FondBois.show()
	await get_tree().create_timer(4.0).timeout
	$"LettreChiffréeComplétée".hide()
	$FondBois.hide()
	$"ScèneTransition2".show()
	await get_tree().create_timer(5.0).timeout
	$"ScèneTransition2".hide()
	$"../scènes_de_transition".show()


func _on_texture_button_pressed_acces_table():
	$TableChiffrement.hide()
	$FondBois.hide()
	$ZoomTabChiffrementExplication.show()

func _on_texture_button_pressed_acces_ppe_chiffr():
	$TableChiffrement.hide()
	$ZoomExplicationPpeChiffrementVigenère.show()
	$FondBois.hide()


func _on_texture_button_pressed_tab_chiffr_retour():
	$TableChiffrement.show()
	$FondBois.show()
	$ZoomTabChiffrementExplication.hide()


func _on_texture_button_pressed_ppe_chiffr_retour():
	$TableChiffrement.show()
	$ZoomExplicationPpeChiffrementVigenère.hide()
	$FondBois.show()
