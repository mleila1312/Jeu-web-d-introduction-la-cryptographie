extends CanvasLayer


#initialise les ZZZ pour montrer que le joueur dort
func set_zzz():
	$big_Z.text="Z";
	$big_Z.show();
	$middle_Z.text="Z";
	$middle_Z.show();
	$small_Z.text="Z";
	$small_Z.show();
	$image_bg.hide()
	$Mail_notification.hide();
	$mail.hide();
	$security.hide();
	$identity.hide();
	$decision.hide();
	$icone_decision.hide();
	$FinPhase.hide()



# Affiche les zzz et les fait bouger tous les delta(= temps entre la frmae actuelle et celle d'avant)
func affiche_zzz(delta):
	var big_z_pos= $big_Z.position;
	var middle_z_pos = $middle_Z.position;
	var small_z_pos = $small_Z.position;
	$big_Z.position.x = fmod(big_z_pos.x+delta*90, 1150);
	$big_Z.position.y = fmod(big_z_pos.y+delta*90, 750);
	$middle_Z.position.x= fmod(middle_z_pos.x+delta*120, 1150);
	$middle_Z.position.y = fmod(middle_z_pos.y+delta*120, 750);
	$small_Z.position.x= fmod(small_z_pos.x+delta*150, 1150);
	$small_Z.position.y= fmod(small_z_pos.y+delta*150, 750);
	
#pour arrêter l'intro avec les zzz
func stop_beginning():
	$big_Z.hide();
	$middle_Z.hide();
	$small_Z.hide();

#change le fond d'écran
func change_bg(image) :
	$image_bg.texture=load(image);
	$image_bg.show()

#Permet d'afficher les textes des différents mails que peut recevoir le joueur, en fonction de ce qu'il soumet en réponse et du moment dans le jeu dans lequel il est 
func text_mail(etape, doss):
	if etape==0 :
		var env= get_node("mail/envoyeur");
		env.text = "Boss";
		var txt_mail= get_node("mail/Scroll/contenu");
		txt_mail.text = "Qu’est-ce que tu fais? Cela fait 1 semaine que je vois les demandes de certification s’empiler sur ton bureau sans qu’aucune ne soit traitée, tu as intérêt à commencer à t’activer.\n
		Bosse.\n
		PS: On a reçu un signalement anonyme qu’un des sites demandant une certification paraît faussement legit, il faut bien fouiller pour réussir à le débusquer. Comme d’habitude, ne télécharge rien du tout sur ces sites. Si tu te sens curieux, tu peux aussi inspecter le code des sites en faisant clic-droit et en cliquant sur inspecter.\n Certains sites peuvent être très louches...\n
		PPS : N’oublie pas, si tu détectes un problème, ce n’est peut être pas le seul, pense bien à vérifier tous les critères pour pouvoir renvoyer un retour détaillé au client."
	elif etape==1 :
		var env= get_node("mail/envoyeur");
		env.text = "Boss";
		var txt_mail= get_node("mail/Scroll/contenu");
		txt_mail.text = "Bien joué pour le dossier "+str(doss+1)+"! Le client est content, et nous aussi, bon boulot, mais ne ralentis pas."
	elif etape==2 :
		var env= get_node("mail/envoyeur");
		env.text = "Boss";
		var txt_mail= get_node("mail/Scroll/contenu");
		txt_mail.text = "Bien joué pour le dossier "+str(doss+1)+"! Le client est pas content, mais nous oui, bon boulot, mais ne ralentis pas."
	elif etape==-1 :
		var env= get_node("mail/envoyeur");
		env.text = "Boss";
		var txt_mail= get_node("mail/Scroll/contenu");
		txt_mail.text = "Mais qu'est-ce que tu fais sur le dossier "+str(doss+1)+"??? Tu dois bien être conscient tout de même que tu me renvoie n'importe quoi là... travaille réellement le dossier au lieu de faire semblant, on perdra moins de temps..."
	elif etape == 3 : 
		var env= get_node("mail/envoyeur");
		env.text = "B";
		var txt_mail= get_node("mail/Scroll/contenu");
		txt_mail.text = "Bien. Je vois que tu as bien exploré ma page. Cependant, maintenant, tu en sais trop. Dommage, t'avais l'air plutôt compétent, on se recroisera peut-être dans une autre vie!"
		

#quand on a réussi à résoudre les 4 premiers dossiers, on change le fond pour que le joueur puisse accéder au dossier 5
func _on_decision_change_background():
	$decision.texture = load("res://images/Decision5.png")
