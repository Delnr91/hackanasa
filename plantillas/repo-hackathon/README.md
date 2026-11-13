# Plantilla del repo de construcción (para el sábado 14-nov-2026, 09:00)

Esto **no es código de la aplicación**: son reglas, declaraciones y un instalador de skills listos para copiar al repo nuevo.

| Archivo | Para qué |
|---|---|
| [`CLAUDE.md`](CLAUDE.md) | Reglas del repo para Claude Code. Enlazarlo también como `AGENTS.md` (`ln -s CLAUDE.md AGENTS.md`) |
| [`AI_DISCLOSURE.md`](AI_DISCLOSURE.md) | Declaración de uso de IA ("Super Intelligence"), exigida por NASA |
| [`CITATION.cff`](CITATION.cff) | Cómo citar el proyecto (completar al final) |
| [`SECURITY.md`](SECURITY.md) | Controles de seguridad proporcionales y cómo reportar problemas |
| [`install-skills.sh`](install-skills.sh) | Copia 16 skills fijadas a commits revisados el 13-nov-2026 y escribe `skills-lock.txt`. Probado: no ejecuta código de terceros al instalar |

## Pasos (≈10 min)
```bash
gh repo create <nombre> --public --clone && cd <nombre>
cp ../hackanasa/plantillas/repo-hackathon/{CLAUDE.md,AI_DISCLOSURE.md,CITATION.cff,SECURITY.md} .
ln -s CLAUDE.md AGENTS.md
bash ../hackanasa/plantillas/repo-hackathon/install-skills.sh .claude/skills
cp -R ../hackanasa/.agents/skills/validador-space-apps-2026 ../hackanasa/.agents/skills/pitch-storytelling-space-apps .claude/skills/
```
Después: instalar el plugin EGM (el script imprime los comandos), activar GitHub Pages, la protección de `main`, Dependabot y el escaneo de secretos.

**Nota de seguridad:** `anatomy` (72 scripts) y `archify` (104 scripts) traen scripts de Node que el agente ejecuta para dibujar y capturar en un navegador local. Al revisarlos no se encontraron llamadas de red salientes, pero hay que mantener los permisos de Bash en modo "preguntar" la primera vez.
