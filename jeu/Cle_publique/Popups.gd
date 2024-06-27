extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"alice_privée".hide()
	$eve_publique.hide()
	$"eve_privée".hide()
	$bob_privée.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func montrer_alice_privée():
	$"alice_privée".montrer()
	
func montrer_eve_privée():
	$"eve_privée".montrer()
	
func montrer_eve_publique():
	$"eve_publique".montrer()

func montrer_bob_publique():
	$"eve_publique".montrer()

func montrer_bob_privée():
	$"bob_privée".montrer()

func cacher_tout():
	$alice_privée.force_finish()
	$bob_privée.force_finish()
	$eve_privée.force_finish()
	$eve_publique.force_finish()

