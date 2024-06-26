extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func ouvrir():
	visible = true
func fermer():
	visible = false

func affiche_bg():
	visible = true
	$machine_bg.visible = true

func papier_crayon_obtained():
	$papier_crayon.visible = false
