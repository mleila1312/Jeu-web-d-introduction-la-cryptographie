extends Node2D

@export var inventory: Inventory;

var state=0;
var dialogue = 0;

var mapObtained = false;

signal espion_dialogue_on;
signal espion_dialogue_off;
signal turing_dialogue_on;
signal turing_dialogue_off;
signal activate_table;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boite_dialogue.hide();
	$Inv_UI.hide();
	get_node("display/phase1").set_zzz()
	
	$InvBig/PostIt.hide();
	$MotCroise.hide();
	$Batiment.hide();
	$Labyrinthe.hide();
	$InvBig/Map.hide();
	$Turing.hide();


func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		match state:
			0:
				await get_tree().create_timer(0.02).timeout;
				get_node("display/phase1").stop_beginning();
				$Boite_dialogue.show();
				$Inv_UI.show();
				$InvBig/PostIt.show();
				$Boite_dialogue.dialogue(dialogue);
			1:
				await get_tree().create_timer(.5).timeout;
				$Inv_UI.hide();
				$Boite_dialogue.hide();
				$MotCroise.show();
			2:
				$MotCroise.hide();
				$Boite_dialogue.show();
				$Batiment.show();
				state += 1;
			3: 
				await get_tree().create_timer(.2).timeout;
				$Boite_dialogue/text.text = "";
				$Batiment.hide();
				$Inv_UI.show();
				$Labyrinthe.show();
			4:
				emit_signal("espion_dialogue_on");
				$Boite_dialogue.dialogue(dialogue);
				state += 1;
				dialogue += 1;
			5:
				emit_signal("espion_dialogue_off");
				emit_signal("turing_dialogue_on");
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			6:
				emit_signal("turing_dialogue_off");
				$Boite_dialogue.dialogue(dialogue);
				state += 1;
				dialogue += 1;
			7: 
				emit_signal("turing_dialogue_on");
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			8:
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			9:

				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			10:
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			11:
				turing_dialogue_off.emit();
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			12:
				turing_dialogue_on.emit();
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
			13:
				$Boite_dialogue.dialogue(dialogue);
				dialogue += 1;
				state += 1;
				activate_table.emit();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state==0 : 
		get_node("display/phase1").affiche_zzz(delta);


func _on_post_it_pressed():
	$InvBig/PostIt.hide();
	inventory.items[0] = preload("res://inventory/items/post_it.tres");
	print(inventory.items);
	$Inv_UI.update_slots();
	state += 1;
	dialogue += 1;
	if state == 1:
		$Boite_dialogue.dialogue(dialogue);


func _on_inv_post_it_pressed():
	$InvBig/PostIt.show()
	


func _on_mot_croise_mot_croise_fini():
	state += 1;
	dialogue += 1;
	$Boite_dialogue.dialogue(dialogue);



func _on_labyrinthe_map():
	inventory.items[1] = preload("res://inventory/items/map.tres");
	$Inv_UI.update_slots();
	mapObtained = true;
	$Boite_dialogue/text.text = "J'ai trouvé une carte. Elle m'aidera sûrement à trouver la sortie !"

func _on_labyrinthe_tunnel():
	$Boite_dialogue/text.text = "N'est-tu intéressé que par l'argent !?"


func _on_inv_map_pressed():
	if mapObtained:
		$InvBig/Map.show();
	

func _on_map_pressed():
	$InvBig/Map.hide();


func _on_labyrinthe_perdu():
	$Boite_dialogue/text.text = "Mauvais chemin, j'ai été ramené au début. Je devrais peut-être regarder plus attentivement la carte."


func _on_labyrinthe_finished():
	# modifier state et dialogue i guess
	$Labyrinthe.hide();
	$Turing.show();
	state += 1;
	dialogue += 1;
	$Boite_dialogue/text.text = "OK, je suis enfin sorti de ce maudit labyrinthe... Où suis-je ? J'imagine que cet espoin va enfin m'expliquer..."
	

