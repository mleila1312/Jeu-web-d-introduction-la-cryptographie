extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	cacher()

func cacher():
	$corps.hide()
	$scytale.hide()
	
func montrer():
	$corps.show()
	$corps.play("idle")

func sortirScytale():
	$corps.play("scytale")
	$corps.position.x += -100.5 #325
	$scytale.ouvrir()

func commence_enrouler():
	$scytale.enroulement()
	
func closeUp_scytale(i):
	$scytale.ouvrir()
	$scytale.closeUp(i)

func scytale_vide():
	$scytale.vide()
func scytale_active_bouton() :
	$scytale.active_bouton()
