#!/bin/bash
set -e

# Démarrer Apache en avant-plan (permet de garder le conteneur en vie)
exec apache2-foreground
