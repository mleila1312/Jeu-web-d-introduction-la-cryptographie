extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Scène2".hide()
	$"Scène3".hide()
	$"Scène4".hide()
	$"Scène5".hide()
	$"Scène6".hide()
	$"Scène7".hide()
	$"Scène8".hide()
	$"Scène9".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed1():
	$"Scène1".hide()
	$"Scène2".show()


func _on_texture_button_pressed2():
	$"Scène2".hide()
	$"Scène3".show()


func _on_texture_button_pressed3():
	$"Scène3".hide()
	$"Scène4".show()


func _on_texture_button_pressed4():
	$"Scène4".hide()
	$"Scène5".show()


func _on_texture_button_pressed5():
	$"Scène5".hide()
	$"Scène6".show()


func _on_texture_button_pressed6():
	$"Scène6".hide()
	$"Scène7".show()


func _on_texture_button_pressed7():
	$"Scène7".hide()
	$"Scène8".show()


func _on_texture_button_pressed_placard():
	$"Scène8".hide()
	$"Scène9".show()
	
func _on_texture_button_pressed_placard_retour():
	$"Scène8".show()
	$"Scène9".hide()


func _on_texture_button_pressed_passage_au_main():
	$"../ArrierePlan".show()
	$"../Bureau".show()
	$"../4Saisons".show()
	$"../Area2D".show()
	$"../Area2D/TextureButton".hide()
	$"../VieuxCoffre".show()
	$"../VieuxCoffre/TextureButton".hide()
	$"../LivreOuvertPoesie".hide()
	$"Scène8".hide()
