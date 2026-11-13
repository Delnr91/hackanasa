#!/usr/bin/env bash
# Instala en el repo del hackathon SOLO las skills elegidas en
# hackanasa/05_plan_ejecucion/07_plan_maestro_recursos_e_instalacion.md,
# fijadas al commit revisado el 13-nov-2026. No ejecuta código de terceros:
# solo descarga el árbol del commit y copia carpetas de skills.
# Uso:  bash install-skills.sh [carpeta_destino]   (por defecto .claude/skills)
# Antes de usar una skill, LEE su SKILL.md y sus scripts.
set -euo pipefail

DEST="${1:-.claude/skills}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$DEST"

# repo  commit  ruta_en_repo  nombre_destino
SKILLS=(
  "mattpocock/skills 5863806dd4e15c63174bee4e7515a4256792ecfa skills/productivity/grill-me grill-me"
  "mattpocock/skills 5863806dd4e15c63174bee4e7515a4256792ecfa skills/engineering/prototype prototype"
  "mattpocock/skills 5863806dd4e15c63174bee4e7515a4256792ecfa skills/engineering/tdd tdd"
  "mattpocock/skills 5863806dd4e15c63174bee4e7515a4256792ecfa skills/engineering/diagnosing-bugs diagnosing-bugs"
  "mattpocock/skills 5863806dd4e15c63174bee4e7515a4256792ecfa skills/engineering/code-review code-review"
  "wheresryan22/anatomy 1482e8469b0a9e0d8cc18ea2740a01423d29ae80 . anatomy"
  "pbakaus/impeccable c4cd1924c389f68d37c687d9c2bbf13f12547c41 .claude/skills/impeccable impeccable"
  "jakubkrehel/skills a72290d140249813898ba8648becf6415abcb059 skills/better-accessibility better-accessibility"
  "jakubkrehel/skills a72290d140249813898ba8648becf6415abcb059 skills/better-layout better-layout"
  "jakubkrehel/skills a72290d140249813898ba8648becf6415abcb059 skills/better-typography better-typography"
  "jakubkrehel/skills a72290d140249813898ba8648becf6415abcb059 skills/better-colors better-colors"
  "tt-a1i/archify e37848822238e3a61b12739185cdadd49843a620 archify archify"
  "anthropics/skills 2c5958ecac7cee2b583967a2c4981d0f4a75c579 skills/frontend-design frontend-design"
  "anthropics/skills 2c5958ecac7cee2b583967a2c4981d0f4a75c579 skills/webapp-testing webapp-testing"
  "addyosmani/web-quality-skills afa8da942115f2961fdbfa80807ea0b232ff6c00 skills/web-quality-audit web-quality-audit"
  "addyosmani/web-quality-skills afa8da942115f2961fdbfa80807ea0b232ff6c00 skills/core-web-vitals core-web-vitals"
)

for line in "${SKILLS[@]}"; do
  read -r repo sha path name <<<"$line"
  src="$TMP/$(echo "$repo" | tr / _)-$sha"
  if [ ! -d "$src" ]; then
    mkdir -p "$src"
    curl -fsSL "https://codeload.github.com/$repo/tar.gz/$sha" | tar -xz --strip-components=1 -C "$src"
  fi
  if [ ! -f "$src/$path/SKILL.md" ]; then echo "✗ $name: no hay SKILL.md en $repo/$path" >&2; exit 1; fi
  rm -rf "${DEST:?}/$name"
  cp -R "$src/$path" "$DEST/$name"
  echo "✓ $name  ←  $repo@${sha:0:12}/$path" | tee -a "$DEST/../skills-lock.txt" >/dev/null
  echo "✓ $name"
done

cat <<'MSG'

Listo. Pasos manuales (requieren tu confirmación):
  1. Plugin Google EGM (Elephant-Goldfish):
       claude plugin marketplace add google/elephant-goldfish-model
       claude plugin install egm@egm
     (commit revisado: 964a4f1ecd33; en Antigravity: agy plugin install https://github.com/google/elephant-goldfish-model)
  2. Copiar nuestras skills desde hackanasa:
       cp -R ../hackanasa/.agents/skills/validador-space-apps-2026 ../hackanasa/.agents/skills/pitch-storytelling-space-apps .claude/skills/
  3. Revisar cada SKILL.md copiado antes de usarlo. No activar hooks de terceros.
MSG
