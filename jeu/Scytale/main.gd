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

#signal debut_dialogues

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boite_dialogue.hide();
	PhaseDodo.set_zzz()
	inventory.items[4] = preload("res://inventory/items/machine.tres");
	print(inventory.items);
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
			if state != 1 :
				pass
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
			$explication.debut_explication()
			state_finished = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state==0 : 
		PhaseDodo.affiche_zzz(delta);
	
	if Input.is_action_pressed("go_to_explication") :
		state = 8
		$display.hide()
		PhaseDodo.stop_beginning()
		_on_dague_pressed()
		$Boite_dialogue.show()
		$Boite_dialogue.ff_dialogue(6)
		$explication.debut_explication()

func _on_dague_pressed():
	Dague.cacher();
	inventory.items[0] = preload("res://inventory/items/dague.tres");
	print(inventory.items);
	$Inv_UI.update_slots();
	
	if state == 6 :
		state += 1
	
func _on_inv_dague_pressed():
	print("dague inv pressed")
	Dague.ouvrir()

func _on_inv_machine_pressed():
	print("machine inv pressed")
	Machine.ouvrir()

func _on_ruban_in_inventaire():
	inventory.items[1] = preload("res://inventory/items/rubanCrypte.tres");
	print(inventory.items);
	$Inv_UI.update_slots();


func _on_papier_crayon_obtained():
	inventory.items[2] = preload("res://inventory/items/papier_crayon.tres");
	print(inventory.items);
	$Inv_UI.update_slots();


func _on_machine_pressed():
	machine_closed.emit()
