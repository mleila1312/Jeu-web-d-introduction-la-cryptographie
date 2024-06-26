extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	espion_dialogue_off();
	$BgInside.hide();
	$Face.hide();
	turing_dialogue_off();
	$BgInside/Table/EnigmaTable.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func espion_dialogue_on():
	$BgFront/EspionDialogue.show();
	
func espion_dialogue_off():
	$BgFront.hide();
	$BgInside.show();
	$Face.show();


func _on_main_espion_dialogue_on():
	espion_dialogue_on();


func _on_main_espion_dialogue_off():
	espion_dialogue_off();
	
func turing_dialogue_on():
	$Face/TuringDialogue.show();

func turing_dialogue_off():
	$Face/TuringDialogue.hide();


func _on_main_turing_dialogue_off():
	turing_dialogue_off();

func _on_main_turing_dialogue_on():
	turing_dialogue_on();


func _on_main_activate_table():
	$BgInside/Table/EnigmaTable.show();
	

func _on_enigma_table_pressed():
	$BgInside.hide();
