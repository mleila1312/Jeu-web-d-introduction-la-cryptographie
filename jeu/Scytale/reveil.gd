extends Node2D

@onready var Banniere = get_node("drapeau_date")

# Called when the node enters the scene tree for the first time.
func _ready():
	$fond.hide() 
	$fond_colline.hide()
	Banniere.cacher()
	$messager.cacher()
	

func affiche():
	$fond.show()
	$fond_colline.show()
	get_node("drapeau_date/apparition/ColorRect").visible = true
	
func banniereAffiche():
	Banniere.apparait()
	$messager.arrive()

func end():
	$fond.hide()
	$fond_colline.hide()
	Banniere.cacher()
