extends Control

var is_open = true #on verra si ça se trouve il faudra le fermer de temps en temps

@onready var inv: Inventory = preload("res://inventory/playerInv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


func update_slots():
	open()
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false

func _ready():
	update_slots()
	close()
