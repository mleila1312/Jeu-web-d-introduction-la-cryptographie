extends Control

var is_open = true #on verra si ça se trouve il faudra le fermer de temps en temps

@onready var inv: Inventory = preload("res://inventory/playerInv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func deactivate(button):
	button.hide()
	button.set_process(false)
	button.set_physics_process(false)
	button.set_process_unhandled_input(false)
	button.set_process_input(false)

func activate(button):
	button.show()
	button.set_process(true)
	button.set_physics_process(true)
	button.set_process_unhandled_input(true)
	button.set_process_input(true)

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
	$invDague.hide()
	$invRubanCrypte.hide()
	$invPapierCrayon.hide()
	$invScytaleBleu.hide()
	$invScytaleRose.hide()


func _on_enlever_crayon_inv():
	$invPapierCrayon.hide()
	update_slots()

func _on_enlever_couteau_inv():
	$invRubanCrypte.position.x = $invDague.position.x
	$invRubanCrypte.position.y = $invDague.position.y
	$invDague.hide()
	update_slots()
