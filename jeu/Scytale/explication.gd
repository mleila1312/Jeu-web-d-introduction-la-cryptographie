extends Node2D

@export var inventory: Inventory;

@onready var state = 0
@onready var state_finished = false
@onready var papier_tests_ouvert = false
signal lance_dialogue
signal ruban_in_inventaire
signal papier_crayon_obtained
signal debut_tests

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event):
	if state_finished and event is InputEventMouseButton and event.is_pressed() and not event.is_echo():
		print(state)
		if state == 0 :
			state_finished = false
			state += 1
			lance_dialogue.emit()
			await get_tree().create_timer(1.0).timeout
			$rubanCrypte.fermer()
			$"post-it".fermer()
			$messager.sortirScytale()
			state_finished = true
		elif state == 1 :
			state_finished = false
			state += 1
			$messager.commence_enrouler()
			lance_dialogue.emit() #mais qu'est-ce que vous faites ?!
			await get_tree().create_timer(0.5).timeout #mais qu'est-ce que vous faites ?!
			state_finished = true
		elif state == 2 :
			state_finished = false
			state += 1
			lance_dialogue.emit() #tunnel explicatif scytale
			await get_tree().create_timer(3.0).timeout
			state_finished = true
		elif state == 3 :
			state_finished = false
			state += 1
			$messager.cacher()
			$messager.closeUp_scytale(0)
			lance_dialogue.emit() #Regarde comme c'est du charabia
			#close-up de la scytale
			state_finished = true

func debut_explication() :
	visible = true
	$messager.montrer()
	lance_dialogue.emit()
	$"post-it".ouvrir()
	$rubanCrypte.ouvrir_postIt()
	state_finished = true



func _on_close_ruban_crypte_pressed():
	if state == 4 and state_finished:
		state_finished = false
		state += 1
		$messager.scytale_vide()
		$rubanCrypte.plus_scotch()
		ruban_in_inventaire.emit()
		
		lance_dialogue.emit() #Tu peux essayer si tu trouves du papier !
		state_finished = true
	elif papier_tests_ouvert and state == 7 and state_finished:
		state_finished = false
		print("papier fermé : début tests")
		state += 1
		papier_tests_ouvert = false
		$papier_tests.fermer()
		$messager.closeUp_scytale(1)
		await get_tree().create_timer(1.0).timeout
		debut_tests.emit()
		state_finished = true

@onready var machine_properly_opened = false
func _on_machine_opened():
	if state == 5 and state_finished:
		state_finished = false
		state += 1
		$materiel_ecriture.ouvrir()
		#await get_tree().create_timer(0.5).timeout
		machine_properly_opened = true
		state_finished = true
	elif machine_properly_opened and state == 6 and state_finished:
		state_finished = false
		state += 1
		$materiel_ecriture.papier_crayon_obtained()
		papier_crayon_obtained.emit()
		$messager.scytale_active_bouton()
		state_finished = true
	$materiel_ecriture.affiche_bg()


func _on_machine_closed():
	$materiel_ecriture.fermer()


func _on_inv_papier_crayon_pressed():
	if not papier_tests_ouvert :
		papier_tests_ouvert = true
		$papier_tests.sortir()
