extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	cacher()

@onready var Fondu = get_node("apparition")
func apparait():
	$inner_shape.visible = true
	$outer_shape.visible = true
	$date.visible = true
	$lieu.visible = true
	Fondu.apparition()
	
func disparait():
	Fondu.disparition()
	cacher()

func cacher() :
	$inner_shape.visible = false
	$outer_shape.visible = false
	$date.visible = false
	$lieu.visible = false
	Fondu.cacher()
