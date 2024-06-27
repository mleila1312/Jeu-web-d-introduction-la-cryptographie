extends Node2D

@export var inventory: Inventory;

@onready var TransitionSceen = get_node("transition_screen")
@onready var PhaseDodo = get_node("display/dodo_debut")
@onready var PhaseReveil = get_node("display/reveil")
@onready var Messager = get_node("display/reveil/messager")
@onready var PostIt = get_node("display/reveil/post-it")
@onready var Dague = get_node("Objets_inventaire/dague")
@onready var Machine = get_node("Objets_inventaire/machine")

var state=0;
var state_finished = true
var dialogue = 0;

signal machine_closed
signal enlever_crayon_inv
signal enlever_couteau_inv
signal couteau_sorti
signal couteau_rentre
signal ruban_sorti
signal ruban_rentre
signal scytale_rose_sortie
signal scytale_bleu_sortie

#signal debut_dialogues

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boite_dialogue.hide();
	PhaseDodo.set_zzz()
	inventory.items[4] = preload("res://inventory/items/machine.tres");
	print(inventory.items);
	$Inv_UI/invMachine.show()
	$Objets_inventaire/machine/bouton_porte.hide()
	$Inv_UI.update_slots();
	$Inv_UI.close()
	


func _input(event):		
	if event is InputEventMouseButton and event.is_pressed() and not event.is_echo():
		if state ==0 and state_finished :
			state_finished = false
			state += 1
			PhaseDodo.stop_beginning()
			#$Boite_dialogue.show()
			TransitionScreen.transition()
			await TransitionScreen.on_transition_finished
			PhaseReveil.affiche()
			await TransitionScreen.on_transition_finished
			PhaseReveil.banniereAffiche()
			await Messager.on_messager_entrance_finished
			print("messenger entrance finished")
			#debut_dialogues.emit()
			await get_tree().create_timer(0.5).timeout
			$Boite_dialogue.show()
			$Boite_dialogue.dialogue() #0
			state_finished = true
		elif (((state > 0) and (state < 3)) or (state == 4)) and state_finished :
			state_finished = false
			state += 1
			$Boite_dialogue.dialogue() #1, 2, 4
			state_finished = true
		elif state == 3 and state_finished :
			state_finished = false
			state += 1
			$Boite_dialogue.dialogue() #3
			PostIt.ouvrir()
			await PostIt.post_it_arrived
			state_finished = true
		elif state == 5 and state_finished :
			state_finished = false
			state += 1
			$Boite_dialogue.dialogue() #5
			PostIt.cacher()
			await get_tree().create_timer(1.0).timeout
			Dague.ouvrir()
			state_finished = true
		elif state == 7 and state_finished :
			state_finished = false
			state += 1
			#rummaging pocket sound if possible
			$Boite_dialogue.dialogue()
			await get_tree().create_timer(2.0).timeout
			$display.hide()
			$Objets_inventaire/machine/bouton_porte.show()
			$explication.debut_explication()
			state_finished = true
		elif state == 10 :
			state_finished = false
			print("ok")
			$transition_screen.fini = true
			$transition_screen.visible = true
			$transition_screen.transition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state==0 : 
		PhaseDodo.affiche_zzz(delta);
	
	if Input.is_action_pressed("go_to_enigmes") :
		state = 9
		$display.hide()
		$explication.hide()
		$Objets_inventaire/machine/bouton_porte.hide()
		
		$Boite_dialogue.show()
		$Inv_UI.open()
		_on_dague_pressed()
		_on_ruban_in_inventaire()
		
		$Boite_dialogue.ff_dialogue(14)
		$enigmes.debut_enigme()

func _on_explication_finie():
	state += 1 #now state = 9
	$explication.hide()
	$Objets_inventaire/machine/bouton_porte.hide()
	$enigmes.debut_enigme()

func _on_dague_pressed():
	Dague.cacher();
	inventory.items[0] = preload("res://inventory/items/dague.tres");
	print(inventory.items);
	$Inv_UI/invDague.show()
	$Inv_UI.update_slots();
	couteau_rentre.emit()
	if state == 6 :
		state += 1
	
func _on_inv_dague_pressed():
	Dague.ouvrir()
	couteau_sorti.emit()

func _on_inv_machine_pressed():
	Machine.ouvrir()

func _on_ruban_in_inventaire():
	inventory.items[1] = preload("res://inventory/items/rubanCrypte.tres");
	print(inventory.items);
	$Inv_UI.update_slots();
	$Inv_UI/invRubanCrypte.show()


func _on_papier_crayon_obtained():
	inventory.items[2] = preload("res://inventory/items/papier_crayon.tres");
	print(inventory.items);
	$Inv_UI.update_slots();
	$Inv_UI/invPapierCrayon.show()


func _on_machine_pressed():
	machine_closed.emit()


func _on_inv_ruban_crypte_pressed():
	ruban_sorti.emit()
	$Objets_inventaire/rubanCrypte.ouvrir()


func _on_ruban_pressed():
	ruban_rentre.emit()
	$Objets_inventaire/rubanCrypte.fermer()


func _on_enlever_crayon_inventaire():
	inventory.items[2] = null;
	print(inventory.items);
	enlever_crayon_inv.emit()


func _on_enlever_couteau_inventaire():
	inventory.items[1] = null;
	inventory.items[0] = preload("res://inventory/items/rubanCrypte.tres");
	print(inventory.items);
	Dague.hide()
	enlever_couteau_inv.emit()

func _on_affiche_message(texte):
	$Boite_dialogue.message(texte)


func _on_ranger_couteau():
	Dague.cacher()


func _on_ajout_scytale_rose_inv(nb):
	inventory.items[1+nb] = preload("res://inventory/items/scytale_rose.tres");
	print(inventory.items);
	$Inv_UI.update_slots();
	$Inv_UI/invScytaleRose.show()
	var pos = [0, 228.5, 331.5, 436.5]
	$Inv_UI/invScytaleRose.position.y = pos[nb]
	print("pos bouton rose : ", $Inv_UI/invScytaleRose.position.y)

func _on_ajout_scytale_bleu_inv(nb):
	inventory.items[1+nb] = preload("res://inventory/items/scytale_bleu.tres");
	print(inventory.items);
	$Inv_UI.update_slots();
	$Inv_UI/invScytaleBleu.show()
	var pos = [0, 228.5, 331.5, 436.5]
	$Inv_UI/invScytaleBleu.position.y = pos[nb]
	print("pos bouton bleu : ", $Inv_UI/invScytaleBleu.position.y)

func _on_enlever_scytale_rose_inventaire(rg_scyt):
	print("scytale_rose_enlevee")
	$Inv_UI/invScytaleRose.hide()
	inventory.items[1+rg_scyt] = null
	if 1+rg_scyt+1 ==3 :
		inventory.items[1+rg_scyt] = inventory.items[1+rg_scyt+1]
		inventory.items[1+rg_scyt+1] = null;
	print(inventory.items);
	$Inv_UI.update_slots();

func _on_enlever_scytale_bleu_inventaire(rg_scyt):
	$Inv_UI/invScytaleBleu.hide()
	inventory.items[1+rg_scyt] = null;
	if 1+rg_scyt+1 ==3 :
		inventory.items[1+rg_scyt] = inventory.items[1+rg_scyt+1]
		inventory.items[1+rg_scyt+1] = null;
	print(inventory.items)
	$Inv_UI.update_slots()
	

func _on_inv_scytale_rose_pressed(): 
	print("rooose")
	scytale_rose_sortie.emit()
func _on_inv_scytale_bleu_pressed(): 
	print("bleeeeu")
	scytale_bleu_sortie.emit()


func _on_finiii():
	state += 1
	print("state = ", state)


func _on_enigmes_attend_code_final():
	print("Main : DRANAC")
	$Objets_inventaire/machine/Control._on_your_time_to_shine()


