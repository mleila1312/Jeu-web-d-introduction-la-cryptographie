extends Node

#répertorie l'état dans lequel le jeu est
var state = 0;

#garde en mémoire si la souris est en ce moment même au dessus d'un des boutons
var detection = [false, false, false, false, false];

var prec;
#retiens en mémoire si les fichiers ont été vérifiés ou non
var files_verified = [false, false, false, false, false];
#check si un logiciel a déjà été ouvert, si oui, on n'affichera pas de texte d'explication
var logiciel_seen = [false, false, false];

var id_text=1;


#signal qui indique que les 4 premiers dossiers ont été checkés
signal all_seen_except_5;

#en fonction de si le joueur a bien résolu le fichier ou non, il recevra un mail différent de son patron
func check_file(file, outcome): 
	if outcome ==1 or outcome ==2 : 
		files_verified[file]=true;
		prec.hide();
		var web = get_node("display/mail");
		web.show();
		$display.text_mail(outcome, file);
		prec=web;
		if files_verified[0] and files_verified[1] and files_verified[2] and files_verified[3] and file <4 :
			get_node("display/mail/Scroll/contenu").text+= "\nD'ailleurs, un nouveau dossier est arrivé. Tu sais, je pense que pour celui là, il pourrait être intéressant d'inspecter sa page web. POur inspecter une page web, il te suffit de faire click droit et de sélectionner inspecter. Tu pourras alors voir le code de la page, les commentaires etc. Qui sait, des informations intéressantes pourraient s'y trouver."
	else :
		prec.hide();
		var web = get_node("display/mail");
		web.show();
		$display.text_mail(outcome, file);
		prec=web;

#lance les zzz d'intro
func _ready():
	$display.set_zzz(); 
	$Dialogue_texte.hide()
	
	
#fonction qui checkent si la souris est au dessus d'un élément
func hover_computer():
	detection[0]=true;
	
func unhover_computer():
	detection[0]=false;
	
func hover_files():
	detection[1]=true;
	
func unhover_files():
	detection[1]=false;
	
func hover_accessories():
	detection[2]=true;
	
func unhover_accessories():
	detection[2]=false;
	

func hover_decision():
	detection[3]=true;
	
func unhover_decision():
	detection[3]=false;

# les prochaines fonctions cré les zones de détection de la souris
func create_detection_description1() : 
	var detection_files= Control.new();
	detection_files.set_name("detection_files");
	detection_files.size.x= 335;
	detection_files.size.y= 429;
	detection_files.position.x=815 ;
	detection_files.position.y= 137;
	$display.add_child(detection_files);
	var detection_accessories= Control.new();
	detection_accessories.set_name("detection_accessories");
	detection_accessories.size.x= 596;
	detection_accessories.size.y= 124;
	detection_accessories.position.x=0 ;
	detection_accessories.position.y= 526;
	$display.add_child(detection_accessories);
	var detection_computer= Control.new();
	detection_computer.set_name("detection_computer");
	detection_computer.size.x= 450;
	detection_computer.size.y= 450;
	detection_computer.position.x=0 ;
	detection_computer.position.y=0;
	$display.add_child(detection_computer);
	var computer = get_node("display/detection_computer");
	computer.show();
	computer.mouse_entered.connect(self.hover_computer);
	computer.mouse_exited.connect(self.unhover_computer);
	var files= get_node("display/detection_files");
	files.mouse_entered.connect(self.hover_files);
	files.mouse_exited.connect(self.unhover_files);
	files.show()
	var accessories= get_node("display/detection_accessories");
	accessories.mouse_entered.connect(self.hover_accessories);
	accessories.mouse_exited.connect(self.unhover_accessories);
	accessories.show()


func create_detection_computer() : 
	var Mail= Control.new();
	Mail.set_name("Mail");
	Mail.position.x= 652;
	Mail.position.y= 600;
	Mail.size.x=53 ;
	Mail.size.y= 26;
	$display.add_child(Mail);
	var Identity= Control.new();
	Identity.set_name("Identity");
	Identity.position.x= 582;
	Identity.position.y= 596;
	Identity.size.x=54 ;
	Identity.size.y= 37;
	$display.add_child(Identity);
	var key= Control.new();
	key.set_name("key");
	key.position.x= 520;
	key.position.y= 596;
	key.size.x=46 ;
	key.size.y=30;
	$display.add_child(key);
	var Decision= Control.new();
	Decision.set_name("Decision");
	Decision.position.x= 470;
	Decision.position.y= 596;
	Decision.size.x=46 ;
	Decision.size.y=30;
	$display.add_child(Decision);
	var tmp= Polygon2D.new();
	tmp.offset.x= 470;
	tmp.offset.y= 596;
	tmp.position.x=46 ;
	tmp.position.y=30;
	tmp.color = Color(1, 1, 1, 1);
	var k = get_node("display/key");
	k .show();
	k .mouse_entered.connect(self.hover_computer );
	k .mouse_exited.connect(self.unhover_computer);
	var i= get_node("display/Identity");
	i.mouse_entered.connect(self.hover_files);
	i.mouse_exited.connect(self.unhover_files);
	i.show();
	var m= get_node("display/Mail");
	m.mouse_entered.connect(self.hover_accessories);
	m.mouse_exited.connect(self.unhover_accessories);
	m.show();
	get_node("display/Mail_notification").texture = load("res://images/New_mail.png");
	get_node("display/Mail_notification").show();
	var dec = get_node("display/Decision");
	dec.mouse_entered.connect(self.hover_decision);
	dec.mouse_exited.connect(self.unhover_decision);

#gère les click
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() && not event.is_echo():
		if state ==0:
			prec = get_node("display/security");
			state +=1
			$display.stop_beginning();
			$Dialogue_texte.display_dialogue(state);
			$Dialogue_texte.show();
		elif state ==1:
			state +=1
			$display.change_bg("res://images/1.png");
			$Dialogue_texte.display_dialogue(state);
		elif state ==2:
			state +=1
			$Dialogue_texte.hide();
			create_detection_description1();
		elif state==3 :  
			if detection[0]==true :
				$Dialogue_texte.display_dialogue(-1);
				$Dialogue_texte.show();
				state+=1;
			elif detection[1]==true: 
				$Dialogue_texte.display_dialogue(-2);
				$Dialogue_texte.show();
			elif detection[2]==true : 
				$Dialogue_texte.display_dialogue(-3);
				$Dialogue_texte.show();
			else : 
				$Dialogue_texte.hide();
		elif state == 4 :
			$display.change_bg("res://images/3.png");
			$Dialogue_texte.display_dialogue(state);
			get_node("display/detection_computer").queue_free();
			get_node("display/detection_files").queue_free();
			get_node("display/detection_accessories").queue_free();
			create_detection_computer();
			get_node("display/icone_decision").show();
			state +=1;
		elif state == 5 and detection[2]==true :
			prec.hide();
			$Dialogue_texte.display_dialogue(7);
			$Dialogue_texte.show();
			var web = get_node("display/mail");
			web.show();
			$display.text_mail(0, 0);
			prec=web;
			state+=1;
			get_node("display/decision").verify_file.connect(self.check_file);
			all_seen_except_5.connect(get_node("display/security").authorize5);
		elif state==6 and id_text<5 : 
			$Dialogue_texte.display_dialogue(9+id_text);
			id_text+=1;
			if id_text>=5 : 
				state+=1;
		elif state==7 : 
			if detection[0]==true :
				prec.hide();
				if not logiciel_seen[0]:
					$Dialogue_texte.display_dialogue(8);
					$Dialogue_texte.show();
					logiciel_seen[0]=true;
				var web = get_node("display/security");
				web.show();
				prec=web;
			elif detection[1]==true: 
				prec.hide()
				if not logiciel_seen[1]:
					$Dialogue_texte.display_dialogue(6);
					$Dialogue_texte.show();
					logiciel_seen[1]=true;
				var web = get_node("display/identity");
				web.show();
				prec=web;
			elif detection[2]==true : 
				prec.hide();
				var web = get_node("display/mail");
				web.show();
				prec=web;
			elif detection[3]==true : 
				prec.hide();
				if not logiciel_seen[2] : 
					$Dialogue_texte.display_dialogue(9);
					$Dialogue_texte.show();
					logiciel_seen[2]=true;
				var web = get_node("display/decision");
				web.show();
				prec=web;
			elif files_verified[4] : 
				$Dialogue_texte.display_dialogue(15);
				$Dialogue_texte.show();
				get_node("display/decision").texture = load("res://images/Decision5.png");
				state = 8;
			else : 
				$Dialogue_texte.hide();
				get_node("display/decision").text_dossier();
		elif state==8 : 
			$Dialogue_texte.display_dialogue(16);
			$Dialogue_texte.show();
			state+=1
		elif state==9 : 
			prec.hide();
			var web = get_node("display/mail");
			web.show();
			prec=web;
			state+=1
		elif state==10 :
			$display.text_mail(3, 0);
			state+=1
		elif state==11:
			get_node("display/image_bg").hide()
			get_node("display/Mail_notification").hide();
			get_node("display/mail").hide();
			get_node("display/security").hide();
			get_node("display/identity").hide();
			get_node("display/decision").hide();
			get_node("display/icone_decision").hide();
			get_node("display/FinPhase").show();
			$Dialogue_texte.display_dialogue(17);
			
		else : 
			$Dialogue_texte.hide();
	if files_verified[0] and files_verified[1] and files_verified[2] and files_verified[3] : 
		all_seen_except_5.emit();
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == 0 :
		$display.affiche_zzz(delta);
