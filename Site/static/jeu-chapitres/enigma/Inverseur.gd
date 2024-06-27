extends Node2D

@export var text1: String

@export var text2: String



# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = text1
	$Label2.text = text2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
