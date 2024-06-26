extends Sprite2D
signal retour_salle


# Called when the node enters the scene tree for the first time.
func _ready():
	feux_fermes()

func feux_fermes():
	$feu_vert_coffre1.hide()
	$feu_vert_coffre2.hide()
	$feu_vert_coffre3.hide()
	$feu_vert_coffre4.hide()
	$feu_vert_coffre5.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_retour_button_pressed():
	emit_signal("retour_salle")
