extends Node2D

@onready var image = $ruban
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func ouvrir() :
	visible = true
	image.show()
	
func fermer():
	visible = false
