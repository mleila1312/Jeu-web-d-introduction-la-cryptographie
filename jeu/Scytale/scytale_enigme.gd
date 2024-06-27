extends Node2D

@onready var corps = $AnimatedSprite2D
@onready var tente = 0
@onready var corde_coupee = false
@onready var scytaleRose_ramassee = false
@onready var scytaleBleu_ramassee = false

signal scytale_rose_ramassee
signal scytale_bleu_ramassee
signal scytale_rose_zoom_clique
signal scytale_bleu_zoom_clique #a connecter !

func pos_depart_rose():
	#corps.position.x = 97.115
	#corps.position.y = 85.303
	corps.position.x = 0
	corps.position.y = 0
	corps.rotation = 0
	corps.scale.x = 1
	corps.scale.y = 1

func pos_depart_bleu():
	corps.position.x = -428.3
	corps.position.y = -339.482
	corps.rotation = 0
	corps.scale.x = 1
	corps.scale.y = 1

func close_up_rose():
	#corps.position.x = -2710.566
	#corps.position.y = 1249.853
	#corps.rotation = -4.1
	corps.position.x = -2800
	corps.position.y = +1500
	corps.rotation = 0.08
	corps.scale.x = 9
	corps.scale.y = 9

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pos_depart_rose()
	$bouton_sol.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_scytale_rose_sortie():
	print("rose")
	close_up_rose()
	$bouton_close.show()
	corps.play("rose_vide")
	corps.show()
	show()

func _on_scytale_bleu_sortie():
	print("bleu")
	close_up_rose()
	corps.play("bleu_vide")
	$bouton_close.show()
	corps.show()
	show()

func fermerScytale():
	corps.hide()
	$Control.hide()
	$Control.first_time = true
	$bouton_close.show()
	hide()

func _in_tente_0(nb) : tente = 0
func _in_tente_1() : 
	tente = 1
	if not scytaleRose_ramassee :
		pos_depart_rose()
		corps.play("rose_vide")
		corps.show()
		$bouton_close.hide()
		$bouton_sol.show()
		show()

func _in_tente_2() : 
	tente = 2
	if not scytaleBleu_ramassee and not corde_coupee :
		pos_depart_bleu()
		corps.play("bleu_vide")
		$bouton_close.hide()
		corps.show()
		#$bouton_sol.show()
		show()
	elif not scytaleBleu_ramassee and corde_coupee :
		pos_depart_rose()
		corps.play("bleu_vide")
		corps.show()
		$bouton_sol.show()
		show()

func _on_scytale_ramassee():
	$bouton_sol.hide()
	hide()
	match tente :
		1 : 
			scytale_rose_ramassee.emit();
			scytaleRose_ramassee = true;
		2 :
			scytale_bleu_ramassee.emit();
			scytaleBleu_ramassee = true;


func _on_control_mouse_entered():print("mouse in")
func _on_control_mouse_exited():print("mouse out")


func _on_close_scytale_pressed():
	match tente :
		1 : scytale_rose_zoom_clique.emit()
		2 : scytale_bleu_zoom_clique.emit()
			


func _on_tente_2_corde_coupee():
	corde_coupee = true
	_in_tente_2()


func play8():
	match tente :
		1 : corps.play("rose_8")
		2 : corps.play("bleu_8")
