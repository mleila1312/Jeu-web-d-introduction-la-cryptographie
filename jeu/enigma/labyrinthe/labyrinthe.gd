extends Control

signal map
signal tunnel
signal perdu
signal finished

# Called when the node enters the scene tree for the first time.
func _ready():
	$Round2.hide();
	$Round3.hide();
	$Round4.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_button_pressed():
	emit_signal("tunnel");


func _on_button_2_pressed():
	emit_signal("tunnel");


func _on_button_3_pressed():
	emit_signal("map");
	$Round1.hide();
	$Round2.show();


func _on_button_feu_1_pressed():
	$Round2.hide();
	$Round3.show();


func _on_button_eau_1_pressed():
	emit_signal("perdu");


func _on_button_foudre_1_pressed():
	emit_signal("perdu");



func _on_button_eau_2_pressed():
	$Round3.hide();
	$Round4.show();


func _on_button_feu_2_pressed():
	emit_signal("perdu");
	$Round3.hide();
	$Round2.show();

func _on_button_foudre_2_pressed():
	emit_signal("perdu");
	$Round3.hide();
	$Round2.show();


func _on_button_feu_3_pressed():
	emit_signal("perdu");
	$Round4.hide();
	$Round2.show();


func _on_button_foudre_3_pressed():
	emit_signal("finished");


func _on_button_eau_3_pressed():
	emit_signal("perdu");
	$Round4.hide();
	$Round2.show();
