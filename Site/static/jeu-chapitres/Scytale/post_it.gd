extends Node2D

@onready var image = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	image.hide() # Replace with function body.

func ouvrir():
	image.show()
	#animation_player.play("pop-up")
func fermer():
	image.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
