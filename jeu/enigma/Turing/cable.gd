extends Node2D

var swapped = [0, 0];

signal connect(swap1, swap2);

# Called when the node enters the scene tree for the first time.
func _ready():
	bad();


func string_to_int(char):
	return char.to_ascii_buffer()[0] - 64

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func good():
	$Good.show();
	$Bad.hide();
	
func bad():
	$Bad.show();
	$Good.hide();


func _on_connecter_pressed():
	var yes = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
	var text1 = $LineEdit.text;
	var text2 = $LineEdit2.text;
	var toconnect = true;
	if(text2 not in yes):
		$LineEdit2.text = ""
		bad();
		toconnect = false;
		swapped = [0, 0];
	if(text1 not in yes):
		$LineEdit.text = "";
		toconnect = false;
		swapped = [0, 0];
		bad();
	if toconnect:
		swapped = [string_to_int(text1), string_to_int(text2)];
		good();
	print(swapped);
	connect.emit(string_to_int(text1), string_to_int(text2));
	
	
func reset():
	swapped = [0, 0];
	bad();
	$LineEdit.text = "";
	$LineEdit2.text = "";


func _on_line_edit_text_changed(new_text):
	bad();


func _on_line_edit_2_text_changed(new_text):
	bad();


func _on_cables_reset():
	reset();
