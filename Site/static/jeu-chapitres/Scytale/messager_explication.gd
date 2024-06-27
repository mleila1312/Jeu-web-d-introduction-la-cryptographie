extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	cacher()

func cacher():
	$bouton_deplier.hide()
	$bouton_effacer.hide()
	$corps.hide()
	$scytale.hide()
	
func montrer():
	visible = true
	$corps.show()
	$corps.play("idle")

@onready var nbScytaleSortie = 0
func sortirScytale():
	nbScytaleSortie += 1
	$corps.show()
	$corps.play("scytale")
	if nbScytaleSortie == 1 :
		$corps.position.x += -100.5 #325
	$scytale.ouvrir()

func commence_enrouler():
	$scytale.enroulement()
	
func closeUp_scytale(i):
	$scytale.ouvrir()
	$scytale.closeUp(i)

func scytale_vide():
	$scytale.vide()
	$bouton_deplier.hide()
	$bouton_effacer.hide()
func scytale_active_bouton() :
	$scytale.active_bouton()


func _on_debut_tests():
	$bouton_deplier.show()
	$bouton_effacer.show()
