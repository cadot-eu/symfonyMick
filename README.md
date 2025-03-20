# 📌 Installation et utilisation du projet Symfony avec Docker

Ce projet permet de déployer un environnement Symfony avec Apache, PHP et plusieurs extensions optionnelles grâce à Docker et Docker Compose. Les installations sont contrôlées via des variables d'environnement définies dans un fichier `.env`.

## 🚀 Prérequis
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 📂 Structure du projet
```
.
├── Dockerfile
├── docker-compose.yml
├── .env
├── php.ini
├── apache.conf
├── docker-entrypoint.sh
├── build.sh
└── app/ (dossier contenant le projet Symfony)
```

---

## 🛠️ Installation

### 1️⃣ Copier les fichiers nécessaires
Assurez-vous que les fichiers suivants sont bien présents dans votre projet :
- `Dockerfile`
- `docker-compose.yml`
- `.env`
- `apache.conf`
- `php.ini`
- `docker-entrypoint.sh`
- `build.sh`

### 2️⃣ Configurer les options d'installation
Dans le fichier `.env`, activez ou désactivez les composants souhaités en mettant `true` ou `false` :

```env
INSTALL_CHROMIUM=true
INSTALL_LATEX=false
INSTALL_NODEJS=true
INSTALL_YARN=false
INSTALL_IMAGICK=true
INSTALL_AMQP=false
INSTALL_GD=true
INSTALL_APCU=true
INSTALL_XDEBUG=false
INSTALL_POSTGRESQL=true
```

### 3️⃣ Construire et démarrer le conteneur
Lancez la commande suivante pour construire et démarrer le conteneur en utilisant `build.sh` :

```bash
./build.sh && docker-compose up -d
```

---

## 📜 Explication des variables d'environnement

| Variable          | Description                                      | Valeur par défaut |
|------------------|--------------------------------------------------|-------------------|
| INSTALL_CHROMIUM  | Installe Chromium et ses dépendances             | `false`           |
| INSTALL_LATEX     | Installe LaTeX pour la génération de PDF         | `false`           |
| INSTALL_NODEJS    | Installe Node.js                                 | `false`           |
| INSTALL_YARN      | Installe Yarn                                    | `false`           |
| INSTALL_IMAGICK   | Installe ImageMagick pour la manipulation d'images | `false`           |
| INSTALL_AMQP      | Installe l'extension PHP AMQP pour RabbitMQ      | `false`           |
| INSTALL_GD        | Installe l'extension PHP GD                      | `false`           |
| INSTALL_APCU      | Installe l'extension PHP APCU pour le cache      | `false`           |
| INSTALL_XDEBUG    | Installe Xdebug pour le débogage                 | `false`           |
| INSTALL_POSTGRESQL| Installe les extensions PostgreSQL pour PHP      | `false`           |

---

## 🛑 Arrêter et supprimer les conteneurs
Pour arrêter et supprimer les conteneurs créés :
```bash
docker-compose down
```

## 🔄 Rebuilder l'image
Si vous avez modifié le `Dockerfile` ou les dépendances :
```bash
./build.sh && docker-compose build
```

## 📜 Licence
Ce projet est sous licence MIT.

---

🚀 **Symfony sous Docker prêt à l'emploi !** 🎯

# 📌 Installation et utilisation du projet Symfony avec Docker

Ce projet permet de déployer un environnement Symfony avec Apache, PHP et plusieurs extensions optionnelles grâce à Docker et Docker Compose. Les installations sont contrôlées via des variables d'environnement définies dans un fichier `.env`.

## 🚀 Prérequis
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 📂 Structure du projet
```
.
├── Dockerfile
├── docker-compose.yml
├── .env
├── php.ini
├── apache.conf
├── docker-entrypoint.sh
├── build.sh
└── app/ (dossier contenant le projet Symfony)
```

---

## 🛠️ Installation

### 1️⃣ Copier les fichiers nécessaires
Assurez-vous que les fichiers suivants sont bien présents dans votre projet :
- `Dockerfile`
- `docker-compose.yml`
- `.env`
- `apache.conf`
- `php.ini`
- `docker-entrypoint.sh`
- `build.sh`

### 2️⃣ Configurer les options d'installation
Dans le fichier `.env`, activez ou désactivez les composants souhaités en mettant `true` ou `false` :

```env
INSTALL_CHROMIUM=true
INSTALL_LATEX=false
INSTALL_NODEJS=true
INSTALL_YARN=false
INSTALL_IMAGICK=true
INSTALL_AMQP=false
INSTALL_GD=true
INSTALL_APCU=true
INSTALL_XDEBUG=false
INSTALL_POSTGRESQL=true
```

### 3️⃣ Construire et démarrer le conteneur
Lancez la commande suivante pour construire et démarrer le conteneur en utilisant `build.sh` :

```bash
./build.sh && docker-compose up -d
```

---

## 📜 Explication des variables d'environnement

| Variable          | Description                                      | Valeur par défaut |
|------------------|--------------------------------------------------|-------------------|
| INSTALL_CHROMIUM  | Installe Chromium et ses dépendances             | `false`           |
| INSTALL_LATEX     | Installe LaTeX pour la génération de PDF         | `false`           |
| INSTALL_NODEJS    | Installe Node.js                                 | `false`           |
| INSTALL_YARN      | Installe Yarn                                    | `false`           |
| INSTALL_IMAGICK   | Installe ImageMagick pour la manipulation d'images | `false`           |
| INSTALL_AMQP      | Installe l'extension PHP AMQP pour RabbitMQ      | `false`           |
| INSTALL_GD        | Installe l'extension PHP GD                      | `false`           |
| INSTALL_APCU      | Installe l'extension PHP APCU pour le cache      | `false`           |
| INSTALL_XDEBUG    | Installe Xdebug pour le débogage                 | `false`           |
| INSTALL_POSTGRESQL| Installe les extensions PostgreSQL pour PHP      | `false`           |

---

## 🛑 Arrêter et supprimer les conteneurs
Pour arrêter et supprimer les conteneurs créés :
```bash
docker-compose down
```

## 🔄 Rebuilder l'image
Si vous avez modifié le `Dockerfile` ou les dépendances :
```bash
./build.sh && docker-compose build
```

## 📜 Licence
Ce projet est sous licence MIT.

---

🚀 **Symfony sous Docker prêt à l'emploi !** 🎯

# 📌 Installation et utilisation du projet Symfony avec Docker

Ce projet permet de déployer un environnement Symfony avec Apache, PHP et plusieurs extensions optionnelles grâce à Docker et Docker Compose. Les installations sont contrôlées via des variables d'environnement définies dans un fichier `.env`.

## 🚀 Prérequis
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 📂 Structure du projet
```
.
├── Dockerfile
├── docker-compose.yml
├── .env
├── php.ini
├── apache.conf
├── docker-entrypoint.sh
├── build.sh
└── app/ (dossier contenant le projet Symfony)
```

---

## 🛠️ Installation

### 1️⃣ Copier les fichiers nécessaires
Assurez-vous que les fichiers suivants sont bien présents dans votre projet :
- `Dockerfile`
- `docker-compose.yml`
- `.env`
- `apache.conf`
- `php.ini`
- `docker-entrypoint.sh`
- `build.sh`

### 2️⃣ Configurer les options d'installation
Dans le fichier `.env`, activez ou désactivez les composants souhaités en mettant `true` ou `false` :

```env
INSTALL_CHROMIUM=true
INSTALL_LATEX=false
INSTALL_NODEJS=true
INSTALL_YARN=false
INSTALL_IMAGICK=true
INSTALL_AMQP=false
INSTALL_GD=true
INSTALL_APCU=true
INSTALL_XDEBUG=false
INSTALL_POSTGRESQL=true
```

### 3️⃣ Construire et démarrer le conteneur
Lancez la commande suivante pour construire et démarrer le conteneur en utilisant `build.sh` :

```bash
./build.sh && docker-compose up -d
```

---

## 📜 Explication des variables d'environnement

| Variable          | Description                                      | Valeur par défaut |
|------------------|--------------------------------------------------|-------------------|
| INSTALL_CHROMIUM  | Installe Chromium et ses dépendances             | `false`           |
| INSTALL_LATEX     | Installe LaTeX pour la génération de PDF         | `false`           |
| INSTALL_NODEJS    | Installe Node.js                                 | `false`           |
| INSTALL_YARN      | Installe Yarn                                    | `false`           |
| INSTALL_IMAGICK   | Installe ImageMagick pour la manipulation d'images | `false`           |
| INSTALL_AMQP      | Installe l'extension PHP AMQP pour RabbitMQ      | `false`           |
| INSTALL_GD        | Installe l'extension PHP GD                      | `false`           |
| INSTALL_APCU      | Installe l'extension PHP APCU pour le cache      | `false`           |
| INSTALL_XDEBUG    | Installe Xdebug pour le débogage                 | `false`           |
| INSTALL_POSTGRESQL| Installe les extensions PostgreSQL pour PHP      | `false`           |

---

## 🛑 Arrêter et supprimer les conteneurs
Pour arrêter et supprimer les conteneurs créés :
```bash
docker-compose down
```

## 🔄 Rebuilder l'image
Si vous avez modifié le `Dockerfile` ou les dépendances :
```bash
./build.sh && docker-compose build
```

## 📜 Licence
Ce projet est sous licence MIT.

---

🚀 **Symfony sous Docker prêt à l'emploi !** 🎯

