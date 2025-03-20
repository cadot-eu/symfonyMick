#!/bin/bash

# Récupérer le nom du répertoire actuel
projet=${PWD##*/}

# Charger les variables du fichier .env, en ignorant les lignes commentées
export $(grep -v '^#' .env | xargs)
export $(grep -v '^#' .env.local | xargs)



# Vérifier si l'option -s est passée en argument
NO_CACHE="--no-cache"
if [ "$1" = "-s" ]; then
    NO_CACHE=""
fi

# Créer le préfixe du nom d'image et le convertir en minuscule
image_name="symfonyMick-"
image_name=$(echo $image_name | tr '[:upper:]' '[:lower:]')  # Forcer le nom de l'image en minuscule

# Liste des arguments d'installation
args=("INSTALL_CHROMIUM" "INSTALL_LATEX" "INSTALL_NODEJS" "INSTALL_YARN" "INSTALL_IMAGICK" "INSTALL_AMQP" "INSTALL_GD" "INSTALL_APCU" "INSTALL_XDEBUG" "INSTALL_POSTGRESQL")

# Créer la chaîne d'arguments build
build_args=""
for arg in "${args[@]}"; do
    value=$(eval echo \$$arg)  # Récupérer la valeur de la variable (par exemple, INSTALL_CHROMIUM)
    if [ "$value" = "true" ] || [ "$value" = "1" ]; then
        echo "Option $arg activée"
        # Enlever 'INSTALL_' du nom et le convertir en minuscule
        option_name=$(echo $arg | sed 's/INSTALL_//g' | tr '[:upper:]' '[:lower:]')
        # Ajouter l'option sans répétition
        if [[ ! "$image_name" =~ "$option_name" ]]; then
            image_name="${image_name}-${option_name}"
        fi
        build_args="$build_args --build-arg $arg=true"
    fi
done
# Construire l'image Docker avec le nom généré et les arguments dynamiques
docker build --progress=plain $NO_CACHE $build_args -t $image_name .

# Afficher le nom de l'image créée
echo "Image Docker créée : $image_name"
