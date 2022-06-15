# Projet 7 de la formation OpenClassrooms
# Groupomania

Le front-end de ce projet a été réalisé avec Angular v13.
Le back-end avec node et essentiellement le framwork express

## Les pré-requis pour faire tourner une copie de l'application

- [Node.js]

- [MySQL Server]

- [Angular CLI]


## Installation

Cloner le dépot git sur votre poste.

```Shell
git clone https://github.com/herival/P7_OC.git
```

Installation du back-end

```Shell 
cd P7_OC/back-end
npm install
```


### Importation de la base de données via phpmyadmin

* Créer une nouvelle base de données nommée "groupomania" dans phpmyadmin
* Importer le fichier database.sql dans la bdd nouvellement créer. 

Ou

### Importation de la base de données via MySQL

Ouvrir MySql command Line client

```Shell
CREATE DATABASE groupomania;
USE groupomania;
```

Importer le fichier database.sql (qui se trouve à la racine du projet) :
```Shell
mysql -u [username] -p groupomania < (Chemin_du_dossier)/database.sql
```

Changer les informations de connexion à la base de données dans le fichier "back-end/mysql.js" si besoin


## Lancer le back-end

Executer la commande :

```Shell
cd back-end
npm run start
```

## Installation du front-end

Entrer dans le dossier front-end
Ouvrir une nouvelle ligne de commande

```Shell
npm install
```
## Lancer le front-end
```Shell
ng serve
```


Aller à l'adresse `http://localhost:4200/`.

## Compte Administrateur
user : admin@test.com
mot de passe : 123ABC456abc??


