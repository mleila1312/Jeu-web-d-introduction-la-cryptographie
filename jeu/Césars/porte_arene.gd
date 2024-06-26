extends Control
signal dialogue_entree
signal dialogue_arene
signal sortie_porte

# Called when the node enters the scene tree for the first time.
func _ready():
	$porte_button.hide()
	emit_signal("dialogue_entree")
	$porte_arene_background.show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fleche_button_pressed():
	emit_signal("dialogue_arene")


func _on_main_entree_porte():
	$porte_button.show()


func _on_porte_button_pressed():
	emit_signal("sortie_porte")
