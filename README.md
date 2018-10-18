# extracction site et envoi contenus vers google_drive
Commenter les fonctions que vous n'utiliser pas pour eviter une longue attente au upload

# cree un fichier config.json du meme niveau que app.rb
met dans ton fichier ceci :
{
  "client_id": "votre_secret_client_id",
  "client_secret": "le_secret_code",
  "scope": [
    "https://www.googleapis.com/auth/drive",
    "https://spreadsheets.google.com/feeds/"
  ],
  "refresh_token": "le_cle_identifiant_qu_on_t_a_donne"
}
