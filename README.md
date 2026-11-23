# affiche-pro 🎨

**Un skill (compétence) à donner à votre IA pour qu'elle fasse des affiches qui ont l'air faites par un vrai graphiste, pas par une IA.**

Vous trouvez que les visuels de ChatGPT, Claude ou Gemini « font IA » (trop lisses, lumières qui brillent, dégradés violets, quatre polices, texte partout) ? Ce skill donne à l'IA la méthode d'un graphiste : vraies photos, une idée forte, deux polices bien associées, une grille, de l'espace vide, et une checklist avant de livrer.

## Ce qu'il contient

| Fichier | Contenu |
|---|---|
| `SKILL.md` | La méthode : déroulé, règles d'or, rendu HTML → PNG, checklist |
| `references/polices.md` | 30 associations de polices par ambiance (formation, chantier, promo, tech, luxe, événement…) |
| `references/images.md` | Les banques d'images des graphistes (gratuites et payantes), mockups, icônes, textures, couleurs, inspiration |
| `references/mise-en-page.md` | Formats (post, story, A4…), grille, 8 gabarits, couleurs, texte de publication |
| `polices/` | ≈70 familles de polices en .ttf (Google Fonts, licence OFL) — liste dans `polices/INDEX.md` |
| `scripts/police.sh` | Télécharge une famille de polices à la demande |

## Installation

**Claude Code**
```bash
git clone https://github.com/syllalamericaink-cmyk/affiche-pro.git
mkdir -p ~/.claude/skills/affiche-pro
cp -r affiche-pro/SKILL.md affiche-pro/references affiche-pro/scripts ~/.claude/skills/affiche-pro/
```
Ensuite demandez simplement : « Fais-moi une affiche pour… ». Claude utilisera le skill tout seul.

**Claude.ai (web / app)** : Paramètres → Capacités → Skills → importer un ZIP contenant `SKILL.md` + `references/`.

**Autres IA (ChatGPT, Gemini, Cursor, etc.)** : collez le contenu de `SKILL.md` et des fichiers `references/` dans les instructions personnalisées ou en début de conversation.

## Comment l'IA fabrique l'affiche

Elle écrit l'affiche en HTML/CSS (polices Google Fonts ou Fontshare), puis la transforme en image PNG avec Chrome ou Edge en mode sans fenêtre. Pas besoin de Photoshop. Les polices du dossier `polices/` servent aussi pour Photoshop, Canva ou Word.

## Licences

- Textes et scripts : MIT (voir `LICENSE`).
- Polices du dossier `polices/` : SIL Open Font License 1.1 (voir `polices/OFL.txt`), © leurs auteurs respectifs, redistribuées depuis Google Fonts.
- Les polices Fontshare citées ne sont pas incluses (leur licence n'autorise pas la redistribution) : elles se chargent par lien.
