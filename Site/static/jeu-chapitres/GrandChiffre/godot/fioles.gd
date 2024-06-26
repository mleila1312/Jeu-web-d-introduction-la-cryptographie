extends Node2D

#indique quelle fiolet à été cliquée en première
var clicked_first = 0;

#les quantités de liquide présentent dans chque fioles
var quantities = [0,8,0];

#indique si le mini jeu a été résolu
var obtained = false;
#signal pour revenir à etienne
signal retour_etienne;
#indiquesi le mini jeu est fini
signal finished_game;

#si on met du liquide, on baisse la fiole pour la remettre à sa place initiale
func find_quantity(): 
	if clicked_first==1 :
		$fiole.position.y+=200;
	elif clicked_first==3 : 
		$tube.position.y+=200;
	elif clicked_first==2:
		$rond.position.y+=200;

#initialise le jeu en fonction de s'il a déjà été fini ou non
func set_up():
	if obtained ==true : 
		$finished.show();
		$fiole.texture_normal = load("res://images/fiole0.png");
		$tube.texture_normal = load("res://images/tube0.png");
		$rond.texture_normal = load("res://images/rond0.png");
	else : 
		$finished.hide();
		

#vérifie si le jeu est fini
func check_if_obtained(game_done):
	if quantities[0]==4 or quantities[1]==4 or quantities[2]==4 or game_done: 
		quantities=[0,0,0]
		obtained=true;
		finished_game.emit();
		set_up()

#change les images des fioles en fonction de leur contenu
func change_picture():
	if clicked_first==1 :
		$fiole.texture_normal = load("res://images/fiole"+str(quantities[0])+".png")
	elif clicked_first==3 : 
		$tube.texture_normal = load("res://images/tube"+str(quantities[2])+".png")
	elif clicked_first==2:
		$rond.texture_normal = load("res://images/rond"+str(quantities[1])+".png")

#si le rond est pressé
func _on_rond_pressed():
	if clicked_first==0 : 
		#si  il est cliqué en premier, on l'identifie par 2 et on le fait voler pour montrer qu'il est sélectionné
		clicked_first = 2;
		$rond.position.y-=200;
	elif clicked_first==2:
		#on remet la fiole à son état initial
		find_quantity();
		clicked_first=0;
	else  : 
		#sinon, on transvase le maximum de liquide de la fiole cliquée en 2nde
		find_quantity();
		if (quantities[clicked_first-1]>8-quantities[1]) : 
			quantities[clicked_first-1] +=  - 8 +quantities[1] ;
			quantities[1]=8;
		else :
			quantities[1]+= quantities[clicked_first-1];
			quantities[clicked_first-1]=0;
		change_picture();
		clicked_first=0;
		$rond.texture_normal= load("res://images/rond"+str(quantities[1])+".png");
		check_if_obtained(false);

func _on_tube_pressed():
	if clicked_first==0 : 
		#si  il est cliqué en premier, on l'identifie par 3 et on le fait voler pour montrer qu'il est sélectionné
		clicked_first = 3;
		$tube.position.y-=200;
	elif clicked_first==3:
		#on remet la fiole à son état initial
		find_quantity();
		clicked_first=0;
	else : 
		#sinon, on transvase le maximum de liquide de la fiole cliquée en 2nde
		find_quantity();
		if (quantities[clicked_first-1]>5-quantities[2]) : 
			quantities[clicked_first-1] +=  - 5 +quantities[2] ;
			quantities[2]=5;
		else :
			quantities[2]+= quantities[clicked_first-1];
			quantities[clicked_first-1]=0;
		change_picture();
		clicked_first=0;
		$tube.texture_normal = load("res://images/tube"+str(quantities[2])+".png");
		check_if_obtained(false);


func _on_fiole_pressed():
	if clicked_first==0 : 
		#si  il est cliqué en premier, on l'identifie par 1 et on le fait voler pour montrer qu'il est sélectionné
		clicked_first = 1;
		$fiole.position.y-=200;
	elif clicked_first==1:
		#on remet la fiole à son état initial
		find_quantity();
		clicked_first=0;
	else : 
		#sinon, on transvase le maximum de liquide de la fiole cliquée en 2nde
		find_quantity();
		if (quantities[clicked_first-1]>3-quantities[0]) : 
			quantities[clicked_first-1] +=  - 3 +quantities[0] ;
			quantities[0]=3;
		else :
			quantities[0]+= quantities[clicked_first-1];
			quantities[clicked_first-1]=0;
		change_picture();
		clicked_first=0;
		$fiole.texture_normal = load("res://images/fiole"+str(quantities[0])+".png");
		check_if_obtained(false);

#lorsque le bouton retour est enclenché, on revient à etienne
func _on_button_pressed():
	retour_etienne.emit();
