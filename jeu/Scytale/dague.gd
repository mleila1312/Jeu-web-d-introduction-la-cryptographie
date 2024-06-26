extends Node2D

@onready var image = $dague

# Called when the node enters the scene tree for the first time.

signal dague_arrived

func _ready():
	image.hide()

func cacher():
	image.hide()

func ouvrir():
	print("dague sortie")
	image.show()
