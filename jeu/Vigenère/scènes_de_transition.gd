extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"ScèneFinale1".show()
	$"ScèneFinale2".hide()
	$"ScèneFinale3".hide()
	$"ScèneFinale4".hide()
	$"ScèneFinale5".hide()
	$"VFlongueurClé".hide()
	$ArrierePlanBureau.hide()
	$"MauvaiseLongueurClé".hide()
	$"LongueurClécorrecte".hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed_sf1():
	$"ScèneFinale1".hide()
	$"ScèneFinale2".show()
	
func _on_texture_button_pressed_sf2():
	$"ScèneFinale2".hide()
	$"ScèneFinale3".show()
	
func _on_texture_button_pressed_sf3():
	$"ScèneFinale3".hide()
	$"ScèneFinale4".show()

func _on_texture_button_pressed_sf4():
	$"ScèneFinale4".hide()
	$"ScèneFinale5".show()
	
func _on_texture_button_pressed_sf5():
	$"ScèneFinale5".hide()
	$"VFlongueurClé".show()


func _on_texture_button_pressed_aide():
	$ArrierePlanBureau.show()
	$"VFlongueurClé".hide()

func _on_texture_button_retour_aide():
	$ArrierePlanBureau.hide()
	$"VFlongueurClé".show()


func _on_texture_button_2_pressed_validation_clé_chiffrement():
	if  $"VFlongueurClé/LineEdit".text == "3":
		print("Félicitations vous avez retrouvé la clé de chiffrement")
		$"VFlongueurClé".hide()
		$"LongueurClécorrecte".show()
		await get_tree().create_timer(5.0).timeout
		$"LongueurClécorrecte".hide()
		$"../Cryptanalyse".show()
	else:
		print("Veuillez réessayer, la clé trouvée est fausse")
		$"VFlongueurClé".hide()
		$"MauvaiseLongueurClé".show()
		await get_tree().create_timer(3.0).timeout
		$"VFlongueurClé".show()
		$"MauvaiseLongueurClé".hide()
