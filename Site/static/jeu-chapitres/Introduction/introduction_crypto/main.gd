extends Node2D
var state=0;

func _ready():
	$Boite_Dialogue.hide()
	$Label.text= "INTRODUCTION"
var d={
	0 : "Il est 7h30. Je dois me rendre à mon stage.", 
	1 : "Je suis vraiment pas réveillé. Dire que je suis déjà à l'entré, bon, on va voir comment ça va se passer.",
	2 : "Je passe la porte, devant les vigiles et valide mon badge à l'entrée. C'est embêtant, mais c'est ça de faire un stage dans un laboratoire de l'armée.",
	3 : "Je fais un stage sur une machine à voyager dans le temps. Son existence est encore tenue secrète. J'espère décrocher un CDI après en recherche dans la cryptographie. J'espère que je l'aurai!",
	4 : "Enfin dans mon bureau! Voyons voir les papiers du jour.",
	5 : "Oh, on dirait que mon boss m'a laissé un message... Ce qu'il peut être aggressif des fois...",
	6 : "Bon, envoyons leur un message, je pense que ça ne prendra pas beaucoup de temps avant qu'ils répondent.", 
	7 : "Ce serait tellement plus efficace si on avait pas besoin de connecter la machine à internet... Mais bon, ils sont à l'autre bout du monde, et sinon, je n'aurais pas eu de stage vu que je suis chargé de sécuriser ces échanges.", 
	8 : "Ils ont déjà répondu, plus qu'à attendre!",
	9 : "Mettons la machine en marche.", 
	10 : "Voyons voir où en est le transfert de données à présent!", 
	11 : "Le transfert a commencé, ouf!",
	12 : "Transfert fini! Allons voir si la machine a bien reçu.",
	13 : "Une minute, comment ça nouvelle destination?",
	14 : "-405??? Mais que s'est-il passé? La machine a-t-elle été hackée?!",
	15 : "Un énorme vrombissement monte, je suis ébloui et perd connaissance."
};
# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if state==0 : 
			$Boite_Dialogue.show()
			$Label.text = "FIN INTRODUCTION"
			$background.texture=load("res://images/1.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
			$Label.hide()
		elif state==1 : 
			$background.texture=load("res://images/2.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==2 : 
			$background.texture=load("res://images/3.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==3 : 
			$background.texture=load("res://images/4.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==4 : 
			$background.texture=load("res://images/5.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==5 : 
			$background.texture=load("res://images/6.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==6 : 
			$background.texture=load("res://images/7.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==7 : 
			$background.texture=load("res://images/8.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==8 : 
			$background.texture=load("res://images/10.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==9 : 
			$background.texture=load("res://images/12.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==10 : 
			$background.texture=load("res://images/9.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==11 : 
			$background.texture=load("res://images/13.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==12 : 
			$background.texture=load("res://images/14.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==13 : 
			$background.texture=load("res://images/15.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==14 : 
			$background.texture=load("res://images/16.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==15: 
			$background.texture=load("res://images/17.png");
			get_node("Boite_Dialogue/Label").text=d[state]
			state+=1
		elif state==16 : 
			$background.texture=load("res://images/noir.png");
			$Boite_Dialogue.hide()
			$Label.show()
			state+=1
