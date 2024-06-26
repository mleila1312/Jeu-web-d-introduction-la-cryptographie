extends Node2D

#indique le choix qu'à fait le joueur parmi ceux proposés par Etienne
var choix = 0;
#ser à savoir quels dialogues afficher
var iteration = 0;
#indique que le joueur souhaite fouiller la pièce
signal fouille_piece;
#indique que le joueur à fait le bon choix et a aécouté Etienne jusq'au bout
signal fin_phase2;
# Called when the node enters the scene tree for the first time.

#si on souhaite revenir à la question après avoir fouillé
func retour_question():
	$choix1.show();
	$choix2.show();
	$choix3.show();
	$choix4.show();
	get_parent().get_parent().get_node("Boite_dialogue").show();
	get_parent().get_parent().get_node("Boite_dialogue/text").text="Alors, tu t'es enfin décidé?";
# Called every frame. 'delta' is the elapsed time since the previous frame.

#si on choisit la réponse1
func response1():
	choix = 1;
	get_parent().get_parent().get_node("Boite_dialogue").dialogue(-13);
	iteration = -14;

#si on choisit la réponse2
func response2():
	choix = 2;
	get_parent().get_parent().get_node("Boite_dialogue").dialogue(-23);
	iteration = -23;

#si on choisit la réponse3
func response3():
	choix = 3;
	get_parent().get_parent().get_node("Boite_dialogue").dialogue(-22);
	iteration = 1;

#si on choisit de fouiller
func fouille():
	choix = 4;
	$choix1.hide();
	$choix2.hide();
	$choix3.hide();
	$choix4.hide();
	fouille_piece.emit();
	get_parent().get_parent().get_node("Boite_dialogue/text").text = "\"J'attends une réponse!\" dit l'homme.";
			
#gère les dialogues
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if choix == 3 and iteration <=11:
			get_parent().get_parent().get_node("Boite_dialogue").dialogue(-1-iteration);
			iteration += 1;
		elif choix==3 and iteration == 12 : 
			get_parent().get_parent().get_node("Boite_dialogue/text").text = "Réfléchis bien à ta réponse cette fois.";
			choix =0 ;
			iteration =0 ;
		elif choix == 1 and iteration >=-22:
			get_parent().get_parent().get_node("Boite_dialogue").dialogue(iteration);
			iteration -= 1;
		elif choix == 1 and iteration == -23:
			get_parent().get_parent().get_node("Boite_dialogue/text").text = "Réfléchis bien à ta réponse cette fois.";
			choix =0 ;
			iteration =0;
		elif choix == 2 and iteration >= -27:
			get_parent().get_parent().get_node("Boite_dialogue").dialogue(iteration);
			choix =2 ;
			iteration -=1;
		elif choix == 2 and iteration < -27:
			get_parent().get_parent().get_node("Boite_dialogue/text").text = "Bon, cherchons comment révéler l'écriture sur le papier qu'il m'a donné.";
			choix=5000;
			iteration = -1000
			fin_phase2.emit();

