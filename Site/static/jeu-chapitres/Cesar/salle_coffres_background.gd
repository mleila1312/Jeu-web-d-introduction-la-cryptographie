extends Sprite2D
signal entree_coffre1
signal entree_coffre2
signal entree_coffre3
signal entree_coffre4
signal entree_coffre5
signal entree_trappe

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_coffre_1_close_pressed():
	emit_signal("entree_coffre1")


func _on_coffre_2_close_pressed():
	emit_signal("entree_coffre2")
	

func _on_coffre_3_close_pressed():
	emit_signal("entree_coffre3")


func _on_coffre_4_close_pressed():
	emit_signal("entree_coffre4")


func _on_coffre_5_close_pressed():
	emit_signal("entree_coffre5")
	
func _on_trappe_button_pressed():
	emit_signal("entree_trappe")
