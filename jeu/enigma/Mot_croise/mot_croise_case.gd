extends Control

@export var correct: String;

signal node_completed;




func _on_label_completed():
	emit_signal("node_completed")
