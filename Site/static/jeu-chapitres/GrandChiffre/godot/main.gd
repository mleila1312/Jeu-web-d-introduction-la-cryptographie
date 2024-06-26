extends Node2D

#indique l'état du jeu vis à vis des dialogues
var state=0;
var dialogue = 0;

# appelée dès que le noeud entre dans la scène
func _ready():
	$Boite_dialogue.hide();
	get_node("display/phase1").set_zzz();
	get_node("display/bg_Image").hide();
	get_node("display/phase2").hide();
	get_node("display/pieces/bureau").hide();
	get_node("display/pieces/Etienne").hide();
	get_node("display/pieces/feu").hide();
	get_node("display/pieces/Bibliotheque").hide();
	get_node("display/decryptage").deactivate();
	get_node("display/second_decode").deactivate();

#gère différents dialogues
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if state ==0 :
			get_node("display/phase1").stop_beginning();
			$Boite_dialogue.show();
			$Boite_dialogue.dialogue(state);
			state +=1;
		elif state <=2 : 
			$Boite_dialogue.dialogue(state);
			state+=1;
		elif state == 3 : 
			$Boite_dialogue.dialogue(state);
			get_node("display/bg_Image").show();
			get_node("display/bg_Image").change_bg("étape1.png");
			state+=1;
		elif state <= 7 : 
			$Boite_dialogue.dialogue(state);
			state+=1
		elif state==8 : 
			get_node("display/phase2").show();
			get_node("display/phase2/choix1/Label").text = "Sur la calligraphie des lettres, peut être qu'en retrouvant un descendant nous pourrions déterminer le contenu des lettres.";
			state+=1;

# appellée à chaque image affiché espacée de delta, permet de faire bouger dynamiquement les zzz
func _process(delta):
	if state==0 : 
		get_node("display/phase1").affiche_zzz(delta);
