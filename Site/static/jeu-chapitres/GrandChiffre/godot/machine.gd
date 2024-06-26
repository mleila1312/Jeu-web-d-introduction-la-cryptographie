extends Node2D

#signal pour revenir en arrière
signal goback(finished);
#indique si le jeu est fini
var finished;
#indique l'état du jeu vis à vis des dialogues
var state_machine = 0;

#si le joueur veut partir
func _on_button_pressed():
	emit_signal("goback", finished);

#initialise la machine, en fonction de quels liquides on a obtenu, on aura plus ou moins de choix
func init_machine(etienne, bibli):
	if etienne: 
		$verser_fiole.show();
	else : 
		$verser_fiole.hide();
	if bibli : 
		$verser_rouge.show();
	else : 
		$verser_rouge.hide();


#si on verse le liquide bleu
func _on_verser_fiole_pressed():
	$verser_fiole.disabled=true;
	if $verser_rouge.disabled : 
		$bg.texture = load("res://images/machine_marche.png");
		state_machine=1;
		$Button.hide();

#si l'on verse le liquide rouge
func _on_verser_rouge_pressed():
	$verser_rouge.disabled=true;
	if $verser_fiole.disabled : 
		$bg.texture = load("res://images/machine_marche.png");
		state_machine=1;
		$Button.hide();

#gère les dialogues et fonds qui vont apparaitre, notamment une fois que les deux liquides sont ajoutés à la machine
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		var boite_dialogue= get_parent().get_parent().get_parent().get_parent().get_node("Boite_dialogue");
		if state_machine==1: 
			boite_dialogue.show();
			boite_dialogue.dialogue(-29-state_machine)
			state_machine+=1;
			$verser_fiole.hide();
			$verser_rouge.hide();
		elif state_machine ==2:
			$bg.texture = load("res://images/code_devant_feu.png");
			boite_dialogue.dialogue(-29-state_machine)
			state_machine+=1;
		elif state_machine ==3:
			$bg.texture = load("res://images/code_revele.png");
			boite_dialogue.dialogue(-29-state_machine)
			state_machine+=1;
		elif state_machine ==4:
			$bg.texture = load("res://images/coffre_ouvert.png");
			boite_dialogue.dialogue(-29-state_machine)
			state_machine+=1;
		elif state_machine ==5:
			$bg.texture = load("res://images/coffre_ouvert.png");
			boite_dialogue.dialogue(-29-state_machine)
			state_machine+=1;
		elif state_machine ==6:
			emit_signal("goback", true);
			state_machine=0;
		
