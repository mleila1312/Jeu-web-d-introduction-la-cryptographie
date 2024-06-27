extends Node2D

@export var inventory: Inventory;

@onready var state = 0
@onready var state_finished = false
@onready var couteau_sorti = false

signal lance_dialogue
signal enlever_couteau_inventaire
signal ranger_couteau
signal montrer_fleche
signal affiche_message

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	$corde.hide()

func _input(event):
	if state_finished and event is InputEventMouseButton and event.is_pressed() and not event.is_echo():
		if state == 1 :
			state_finished = false
			state += 1
			$messager.hide()
			lance_dialogue.emit() #je vous souhaite bonne chance !...
			$corde.show()
			montrer_fleche.emit()
			

func in_tente_0(nb) :
	state_finished = true
	visible = true
	show()
	if nb==1:
		$messager.show()
		$messager/AnimatedSprite2D.play("attache")
	else :
		montrer_fleche.emit()
		affiche_message.emit("Il n'y a rien ici.")


func _on_couteau_rentre():
	couteau_sorti = false
func _on_couteau_sorti():
	couteau_sorti = true

func _on_corde_pressed():
	if couteau_sorti :
		print("corde coupée")
		state += 1
		#enlever_couteau_inventaire.emit()
		ranger_couteau.emit()
		$messager/AnimatedSprite2D.play("libre")
		$messager/bouton_corde.hide()
		lance_dialogue.emit()
		state_finished = true


func _on_enigmes_couteau_rentre():
	pass # Replace with function body.
