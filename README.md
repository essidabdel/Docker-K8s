
# 🚀 Docker-K8s – Web App Containerization Assessment

Bienvenue dans ce projet d'évaluation visant à containeriser une application web simple avec **Docker**, en deux étapes :  
1. 🛠️ **Déploiement manuel avec Docker CLI**  
2. ⚙️ **Déploiement automatisé avec Docker Compose**

---

## 🎯 Objectif

Mettre en place une architecture complète en 3 conteneurs :

- **Nginx** : reverse proxy
- **App Web** (Flask) : expose `/health` et `/data`
- **MySQL** : base de données avec persistance

---

## 🗂️ Structure du Projet

```
.
├── app/             # Dockerfile & code de l'application
│   ├── Dockerfile
│   ├── conf/
│   └── src/
├── mysql/           # Dockerfile & config de la DB
│   ├── Dockerfile
│   └── conf/
├── nginx/           # Config Nginx
│   ├── Dockerfile (optionnel)
│   └── conf/
├── compose.yaml     # Déploiement Docker Compose (Partie 2)
└── setup_manual.sh  # Script de déploiement manuel (Partie 1)
```

---

## ▶️ Partie 1 – Déploiement Manuel

Lancer les conteneurs manuellement avec le script :

```bash
chmod +x setup_manual.sh
./setup_manual.sh
```

🧹 Pour nettoyer : des commandes sont commentées dans le script.

---

## ▶️ Partie 2 – Docker Compose

Lancer tout automatiquement avec :

```bash
docker compose up --build -d
```

🩺 Compose gère aussi les dépendances et les vérifications de santé.

---

## 🌐 Accès à l'application

Après lancement, accédez à :

- `/health` : [http://localhost:5423/health](http://localhost:5423/health)
- `/data`   : [http://localhost:5423/data](http://localhost:5423/data)

---

## ⚙️ Détails techniques

- **App** : écoute sur le port interne `4743`
- **MySQL** : port interne `5655`, persistance via `db_volume`
- **Nginx** : expose le port `5423`, redirige vers l'app sur `4743`
- **Images** : `app` basé sur `alpine:<antepenultimate>`, `mysql`, `nginx`
- **Réseaux** : `db_network`, `site_network`

---

## ✅ Ce dépôt contient :

- Tous les Dockerfiles requis
- Les fichiers de config Nginx et MySQL
- Le code source de l'app
- Le script de déploiement manuel
- Le fichier Docker Compose
- ➕ Ce README pour vous guider ✨
