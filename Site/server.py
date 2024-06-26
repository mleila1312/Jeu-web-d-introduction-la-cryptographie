import os
from flask import Flask, send_from_directory, abort, request
import webbrowser
import argparse
from pathlib import Path
from flask_cors import CORS
# Pour run le server installer:
# pip install flask
# pip install flask_cors

# Création de l'app, enabling of CORS
app = Flask(__name__, static_url_path="")
CORS(app)

# Gestion des pages 404
@app.errorhandler(404)
def gerer_erreur(e):
    '''Quelle page renvoyer pour un message d'erreur'''
    return app.send_static_file('404.html'), 404

# Pour ne pas accéder à root, on renvoie vers notre page d'acceuil
@app.route('/')
def accueil():
    return app.send_static_file('main.html')

# Site du dossier 5, fait pour masquer le chemin jusqu'au fichier
@app.route('/B')
def site_dossier5_certif():
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier5/secret-site/home.html")

# pages du dossier 5
@app.route('/B/<page>')
def B_page(page):
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier5/secret-site/{page}.html")

# page de login pour le dossier 5
@app.route('/login', methods=['GET', 'POST'])
def check_mdp():
    #Vérifie le mot de passe entré par le joueur
    login = request.form.get('login')
    mdp= request.form.get('mdp')
    #si le mdp et login sont corrects
    if login =="admin" and mdp == "5FruitsEtLégumes" :
        return app.send_static_file(f"jeu-chapitres/Certificat/dossier5/secret-site/home.html")
    else :
        return app.send_static_file(f"jeu-chapitres/Certificat/dossier5/Home.html")

#pour le site du dossier 1
@app.route('/ArtisaMiel')
def site_dossier1():
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier1/Home.html")

#pour le site du dossier 2
@app.route('/Artichaut')
def site_dossier2():
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier2/artichauts.html")

#pour le site du dossier 3
@app.route('/Headband')
def site_dossier3():
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier3/Home.html")

#pour le site du dossier 4
@app.route('/Random')
def site_dossier4():
    return app.send_static_file(f"jeu-chapitres/Certificat/dossier4/Random.html")

# url de test pour les jeux godots (spoiler ça marche, thank god)
@app.route('/DodgeTheCreeps')
def site_dodge_the_creeps():
    return send_from_directory(app.static_folder+"/dodge_the_creeps/web_tes/", "Index_test.html")

#pour les certificats
@app.route('/Certificats-game')
def site_certificat():
    return app.send_static_file(f"jeu-chapitres/Certificat/godot-game-certif/web/Certificats.html")

@app.route('/Chapitre-certificat')
def certiftestiframe():
    return app.send_static_file(f"jeu-chapitres/Certificat/Chapitre-certificat.html")

#grand chiffre
@app.route('/GrandChiffre-game')
def jeu_grandchiffre():
    return app.send_static_file(f"jeu-chapitres/GrandChiffre/godot/web/GrandChiffre.html")

@app.route('/Chapitre-GrandChiffre')
def grandchiffretestiframe():
    return app.send_static_file(f"jeu-chapitres/GrandChiffre/Chapitre-grandchiffre.html")

#test iframe
@app.route('/testiframe')
def sitetestiframe():
    return app.send_static_file(f"jeu-chapitres/page_test_iframe.html")

# pour ne pas avoir de pb de SharedArrayBuffer et CORS
@app.after_request
def add_header_home(response):
    response.headers['Cross-Origin-Embedder-Policy'] = 'require-corp'
    response.headers['Cross-Origin-Opener-Policy'] = 'same-origin'
    return response

# lance le server et ouvre la page d'acceuil
def serve(port):
    app.run(host='0.0.0.0', port=port)

# lance le server
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=4444)
