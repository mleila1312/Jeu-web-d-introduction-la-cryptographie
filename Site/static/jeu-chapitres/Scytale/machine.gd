extends Node2D

@onready var image = $machine_fg
@onready var bouton_machine = $bouton_machine
@onready var bouton_porte = $bouton_porte
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func ouvrir() :
	visible = true
	print("machine sortie")
	image.show()
	bouton_machine.show()
	bouton_porte.show()
	image.play("ferme")
	
#@onready var compteur_ouvertures = 0 #pour que la porte ne s'ouvre qu'une fois
func _on_bouton_porte_pressed():
	image.play("ouvert")


func _on_machine_pressed():
	visible = false
