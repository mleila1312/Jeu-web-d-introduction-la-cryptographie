extends Node2D

@export var inventory: Inventory;

@onready var state = 0
@onready var state_finished = false
@onready var dague_sortie = false

signal lance_dialogue
signal montrer_fleche
signal ajout_scytale_inv
signal corde_coupee

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _input(event):
	if state_finished and event is InputEventMouseButton and event.is_pressed() and not event.is_echo():
		if state == 1 :
			pass
			

func in_tente_2() :
	state_finished = true
	visible = true
	$corde.montrer()
	show()
	montrer_fleche.emit()
		




func _on_scytale_ramassee():
	ajout_scytale_inv.emit()


func _on_corde_pressed():
	if dague_sortie :
		$corde.coupee()
		corde_coupee.emit()


func _on_couteau_rentre(): dague_sortie = false
func _on_couteau_sorti(): dague_sortie = true
