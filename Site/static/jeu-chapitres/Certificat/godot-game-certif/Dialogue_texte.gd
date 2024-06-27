extends CanvasLayer

# Contient l'ensemble des dialogues à afficher en fonction de l'état dans lequel est le jeu
func display_dialogue(state):
	if state==1 : 
		$Dialogue.text = "Hummmm, j'étais si confortable...";
	elif state==2 : 
		$Dialogue.text = "Tu te réveilles sur ton bureau";
	elif state==-1: 
		$Dialogue.text = "Cela semble être votre ordinateur... Vous avez un nouveau mail de votre boss qui semble plutôt aggressif...";
	elif state==-2 : 
		$Dialogue.text = "Quel énorme tas de dossiers... ça ne donne pas envie de s'y mettre...";
	elif state==-3 : 
		$Dialogue.text = "Votre souris et votre clavier.";
	elif state==4 : 
		$Dialogue.text = "Bon, voyons voir ce qu'on me veut.";
	elif state==6: 
		$Dialogue.text = "C'est donc comme ça qu'ils vérifient les informations d'identité...";
	elif state==7: 
		$Dialogue.text = "Mes mails...";
	elif state==8 : 
		$Dialogue.text = "Voici la page pour vérifier que la clé est bien sécurisée et que le client possède la clé privée.";
	elif state==9: 
		$Dialogue.text = "Bon, je peux rentrer ici ma décision pour le dossier";
	elif state==10 : 
		$Dialogue.text = "J’imagine qu’il faut que j’inspecte ces sites. Pour donner un certificat à un site, il faut que je vérifie sa clé publique, si celle-ci est assez sécurisée et s'ils possèdent bien la clé privé en leur envoyant un message chiffré avec leur clé publique qu'ils ";
	elif state==11 : 
		$Dialogue.text = "devront me renvoyer déchiffré. Pour cela, je pourrais utiliser le logiciel au logo orange avec une croix dans un carré sur la barre du bas.";
	elif state==12 : 
		$Dialogue.text = "Il faudra aussi que je vérifie les informations sur le responsable légal de l’entreprise, pour cela il faudra que j'utilise le logiciel au logo rose sur la barre du bas.";
	elif state==13 : 
		$Dialogue.text = "J'aurais également accès à l'URL du site demandant un certificat, si je me sens curieux, je pourrais explorer un peu les pages. Pour accéder à ces informations, il faudra que je clique sur la logo blanc en bas de l'écran.";
	elif state==14 : 
		$Dialogue.text = "Dans ce logiciel, je pourrais également donner ma décision sur le dossier donc soit accepter la demande, soit indiquer le problème du site en sélectionnant le bon choix ou en ajoutant un mot clé.";
	elif state==15 : 
		$Dialogue.text = "C'est tout de même étrange.... Pourquoi demander un certificat alors que dans le site même il y a la raison pour ne pas le donner?";
	elif state==16 : 
		$Dialogue.text = "Tiens, nouveau mail ? Encore un nouveau dossier ?";
	elif state==17 : 
		$Dialogue.text = "Puis, tout devint noir, je sentais ma tête tourner, je me sentais tomber.";
