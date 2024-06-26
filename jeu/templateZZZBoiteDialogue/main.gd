extends Node2D

var state=0;
var dialogue = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$Boite_dialogue.hide();
	get_node("display/phase1").set_zzz()


func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if state ==0:
			state +=1
			get_node("display/phase1").stop_beginning();
			$Boite_dialogue.show();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state==0 : 
		get_node("display/phase1").affiche_zzz(delta);
