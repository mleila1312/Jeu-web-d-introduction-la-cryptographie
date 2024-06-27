extends Control
signal dialogue_entree
signal dialogue_arene
signal dialogue_close
signal sortie_porte
signal dialogue_fin_porte


# Called when the node enters the scene tree for the first time.
func _ready():
	$porte_button.hide()
	emit_signal("dialogue_entree")
	$porte_arene_background.show()
	$message_button.hide()


func message_close():
	$message_button/message_chiffre.hide()
	$message_button/message_dechiffre.hide()
	
func mots_close():
	$message_button/message_chiffre/l4_mot1.hide()
	$message_button/message_chiffre/l4_mot2.hide()
	$message_button/message_chiffre/l4_mot3.hide()
	$message_button/message_chiffre/l8_mot1.hide()
	$message_button/message_chiffre/l8_mot2.hide()
	$message_button/message_chiffre/l8_mot3.hide()
	$message_button/message_chiffre/l8_mot4.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fleche_button_pressed():
	emit_signal("dialogue_arene")


#Apparition du parchemin
func _on_main_message_chiffre():
	$message_button.show()
	message_close()

#Apparition du message quand on clique sur le parchemin
func _on_message_button_pressed():
	$message_button/message_chiffre.show()
	emit_signal("dialogue_close")
	
###--------------------------------------------------------CASES MOTS
func _on_message_chiffre_all_mots_faits():
	$message_button/message_chiffre.hide()
	$message_button/message_dechiffre.show()


func _on_message_chiffre_sortie_message():
	$message_button.hide()
	$porte_button.show()
	$fleche_button.hide()
	emit_signal("dialogue_fin_porte")
	
###--------------------------------------------------------Fin de la scène
#Pour afficher le bouton sur la porte
func _on_main_entree_porte():
	$porte_button.show()

#Quand on clique sur le bouton sur la porte on arrive dans la salle des coffres
func _on_porte_button_pressed():
	emit_signal("sortie_porte")

