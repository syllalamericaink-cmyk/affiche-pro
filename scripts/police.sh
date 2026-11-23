#!/usr/bin/env bash
# Télécharge une famille de polices depuis le dépôt affiche-pro (aucune installation système).
# Usage : bash police.sh <Famille sans espaces, ex: Anton | PlayfairDisplay> [dossier]
# Liste des familles : polices/INDEX.md
set -e
FAM="$1"; DEST="${2:-.}"
[ -z "$FAM" ] && { echo "Usage: bash police.sh <Famille> [dossier]"; exit 1; }
REPO="syllalamericaink-cmyk/affiche-pro"
mkdir -p "$DEST"
LIST=$(curl -sf "https://api.github.com/repos/$REPO/contents/polices/$FAM" | grep '"name"' | sed 's/.*"name": "\(.*\)".*/\1/')
[ -z "$LIST" ] && { echo "Famille introuvable : $FAM (voir polices/INDEX.md)"; exit 1; }
for f in $LIST; do
  curl -sfL "https://raw.githubusercontent.com/$REPO/main/polices/$FAM/$f" -o "$DEST/$f" && echo "$DEST/$f"
done
