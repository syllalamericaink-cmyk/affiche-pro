---
name: affiche-pro
description: Créer une affiche ou un visuel (post Facebook/Instagram, story, flyer, poster A4, couverture, miniature) qui a l'air fait par un vrai graphiste et pas par une IA. À utiliser chaque fois que l'utilisateur demande une affiche, un visuel, un flyer, une publication illustrée, un poster, une couverture ou une story. Contient les banques d'images, une bibliothèque de polices classées par ambiance, les règles de mise en page anti-« effet IA », la méthode de rendu HTML → PNG et une checklist finale.
---

# Affiche pro

Le reproche à éviter : « ça fait IA ». Une affiche fait IA quand elle a : image générée trop lisse, lumières qui brillent, dégradés violet/bleu, icônes partout, quatre polices, du texte partout, tout centré, aucune vraie personne. Le remède : **vraies photos, une seule idée, deux polices maximum, beaucoup de vide, une grille.**

## Déroulé (le faire en entier, sans demander à chaque étape)

1. **Comprendre** : marque (logo, couleurs, ton), objectif (vendre, informer, faire réagir), format, texte obligatoire (prix, téléphone, adresse). Si l'utilisateur a une page ou un site, y récupérer logo, couleurs et vraies photos.
2. **Choisir l'ambiance** → une association de polices dans `references/polices.md`.
3. **Trouver l'image** → ordre de priorité dans `references/images.md` (photos réelles de la marque d'abord ; pas d'image générée par IA sauf demande explicite).
4. **Choisir une mise en page** → `references/mise-en-page.md` (formats + 8 gabarits).
5. **Construire en HTML/CSS** à la taille exacte, polices chargées par lien (Google Fonts ou Fontshare), puis **rendre en PNG** (voir plus bas).
6. **Regarder le PNG**, corriger, re-rendre. Au moins une passe de correction.
7. **Checklist finale**, puis livrer : le PNG + un `texte_publication.txt`, les sources dans un sous-dossier `src/`.

## Rendu HTML → PNG

Avec Chrome ou Edge sans fenêtre (Chromium, tous systèmes) :

```bash
# Windows : "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ou chrome.exe
# macOS  : "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
# Linux  : google-chrome / chromium
<navigateur> --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
  --window-size=1080,1350 --virtual-time-budget=8000 \
  --screenshot=/chemin/affiche.png file:///chemin/src/affiche.html
```

- **Chemins absolus obligatoires** pour `--screenshot` et l'URL `file:///` (espaces encodés en %20). Avec un chemin relatif, le navigateur n'écrit rien et ne signale aucune erreur.
- Un PNG à fond transparent (logo, produit détouré) disparaît sur un fond de même couleur : le poser sur un carré de couleur contrastée, et l'afficher en entier (`background-size:contain`) plutôt que recadré.
- `--virtual-time-budget` laisse le temps aux polices web de charger. Si une police manque au rendu : 15000, ou embarquer le .ttf en `@font-face` local.
- Alternative : Playwright / Puppeteer `page.screenshot()`.
- Impression A4 : 2480×3508 (300 dpi) ou `--force-device-scale-factor=2`.

## Polices : comment les charger

- **Google Fonts** :
  `<link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;600;800&display=swap" rel="stylesheet">`
- **Fontshare** (gratuit en usage commercial, style « studio ») :
  `<link href="https://api.fontshare.com/v2/css?f[]=clash-display@600,700&f[]=satoshi@400,500,700&display=swap" rel="stylesheet">`
- **Fichiers .ttf hors-ligne** (Photoshop, Canva, rendu sans internet) : dossier `polices/` du dépôt
  https://github.com/syllalamericaink-cmyk/affiche-pro (≈70 familles, licence OFL, liste dans `polices/INDEX.md`).
  Télécharger une famille sans rien installer : `bash scripts/police.sh Anton ./src` puis
  `@font-face{font-family:Anton;src:url(Anton-400.ttf)}`.

## Règles d'or

- **Hiérarchie en 3 niveaux** : 1 titre énorme (lisible en 1 seconde sur téléphone), 1 sous-titre, 1 info pratique.
- **Titre ≤ 7 mots.** Texte total ≤ 25 mots sur un post (hors pied de page).
- **2 polices maximum** (1 expressive pour le titre + 1 neutre pour le texte), 3 graisses maximum.
- **Tailles** sur 1080 px de large : titre 90–160 px ; texte 26–34 px minimum.
- **Marges** 64–80 px. Rien ne touche le bord sauf une photo à fond perdu.
- **Couleurs** : 1 dominante de marque + 1 accent + neutres. L'accent apparaît 2–3 fois, pas plus.
- **Un seul point d'attention** : le prix, le visage OU le titre.
- **Aligné à gauche** par défaut ; centré seulement pour une citation courte.
- **Texte sur photo** : voile sombre uni (noir 35–55 %) ou bandeau plein, pas d'ombre floue partout.
- **Logo** petit, dans un coin, une seule fois. Contact en pied de page.
- **Interdits** : effets néon/glow, dégradés arc-en-ciel, emojis dans le visuel, 3D brillante, clipart, ombres lourdes, contours partout, cinq lignes en MAJUSCULES, photos avec filigrane ou logo d'une autre marque.
- **Détails qui font « graphiste »** : un filet fin, un numéro (« N°03 »), un petit texte vertical, une grille visible, un grain léger (bruit SVG à 4 %), une photo recadrée serrée.

## Checklist avant de livrer

- [ ] Lisible en vignette (300 px de large) : le titre se lit encore ?
- [ ] Orthographe, accents, numéro de téléphone et prix vérifiés.
- [ ] Pas plus de 2 familles de polices.
- [ ] Rien de coupé ni collé au bord, marges égales.
- [ ] Photo réelle et nette, sans filigrane ni logo d'un tiers.
- [ ] Contraste du texte suffisant.
- [ ] Format exact (1080×1350, 1080×1920, 1080×1080, A4…).
- [ ] Texte de publication écrit : accroche humaine + question pour les commentaires + contact.

## Fichiers de référence

- `references/polices.md` — 30 associations par ambiance, ce qu'il faut éviter, astuces typo
- `references/images.md` — banques d'images, mockups, icônes, textures, couleurs, inspiration
- `references/mise-en-page.md` — formats, grille, 8 gabarits, couleurs, texte de publication
