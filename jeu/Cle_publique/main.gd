extends Node2D

var state=0;
var dialogue = 0;

# En début de jeu on cache tout ce qui n'est pas important
func _ready():
	get_node("display/phase1").show();
	get_node("display/bg_Image").hide();
	get_node("display/bureau").hide();
	get_node("display/feuille").hide();
	get_node("display/dialogue").hide();
	get_node("display/description").hide();
	get_node("display/interaction").hide();

# Fonction qui gère l'avancement du dialogue à chaque clic
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		match state:
			0:
				get_node("display/phase1").stop_beginning();
				$Boite_dialogue.show();
				$Boite_dialogue.dialogue(state);
				state +=1;
			1:
				$Boite_dialogue.dialogue(state);
				state+=1;
			2:
				$Boite_dialogue.hide();
				get_node("display/bg_Image").show()
				get_node("display/bg_Image").change_bg("Bureau couvert.png")
				get_node("display/bureau").show()
				state +=1;
			

# Pour les Zzz au début
func _process(delta):
	if state==0 : 
		get_node("display/phase1").affiche_zzz(delta);
