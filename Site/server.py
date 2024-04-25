import os
from flask import Flask, send_from_directory, abort, request

app = Flask(__name__, static_url_path="")

@app.errorhandler(404)
def gerer_erreur(e):
    '''Quelle page renvoyer pour un message d'erreur'''
    return app.send_static_file('404.html'), 404

@app.route('/')
def accueil():
    return app.send_static_file('main.html')

@app.route('/B')
def site_dossier5_certif():
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier1/secret-site/home.html")
@app.route('/B/<page>')
def B_page(page):
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier1/secret-site/{page}.html")

@app.route('/login', methods=['GET', 'POST'])
def check_mdp():
    #Vérifie le mot de passe entré par le joueur
    login = request.form.get('login')
    mdp= request.form.get('mdp')
    if login =="admin" and mdp == "5FruitsEtLégumes" :
        return app.send_static_file(f"jeu-chapitres/Certificat/dossier1/secret-site/home.html")
    else :
        return app.send_static_file(f"jeu-chapitres/Certificat/dossier1/Home.html")


if __name__ == '__main__':
    app.run(debug=False,port=80,  host="0.0.0.0") # Lance l'appli