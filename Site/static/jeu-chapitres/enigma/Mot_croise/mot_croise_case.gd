extends Control

@export var correct: String;

signal node_completed;



# informe le mot croisé que la case a été complétée
func _on_label_completed():
	emit_signal("node_completed")
