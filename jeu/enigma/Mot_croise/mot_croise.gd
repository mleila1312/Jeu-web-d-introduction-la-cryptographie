extends Control

var compteur = 0;

signal motCroiseFini;

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/bravo.hide()

func bravo():
	$ColorRect/Explications.hide();
	$ColorRect/bravo.show();
	emit_signal("motCroiseFini");




func _on_case_1_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_2_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_3_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_4_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_5_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_6_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_7_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_8_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_9_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_10_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_11_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_12_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_13_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_14_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_15_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_16_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_17_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_18_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_19_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_20_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_21_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_22_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_23_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_24_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_25_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_26_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();


func _on_case_27_node_completed():
	compteur += 1;
	if compteur == 27:
		bravo();
