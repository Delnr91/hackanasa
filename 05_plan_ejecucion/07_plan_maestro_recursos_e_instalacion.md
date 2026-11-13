# 05.7 · Plan Maestro: Qué Instalar, Qué Descartar y Qué Construir (Día 1 del Hackathon)

> Evaluación hecha el 13-nov-2026 leyendo el README, la licencia y la actividad de cada repositorio en GitHub, y las versiones en npm.
> **Este repo (`hackanasa`) sigue siendo solo información.** Mañana se crea el repo de construcción y se le pasa este repo como contexto. La plantilla lista para copiar está en [`plantillas/repo-hackathon/`](../plantillas/repo-hackathon/).

---

## 0. Respuesta corta (80/20)

**Instalar 8 cosas, no 25.** Cada skill extra suma contexto, instrucciones que se contradicen entre sí y riesgo de cadena de suministro. Lo esencial:

1. **Google EGM** (*Elephant-Goldfish*) para escribir la especificación y que la revisen "ojos frescos".
2. **Matt Pocock skills** (solo 5): `grill-me`, `prototype`, `tdd`, `diagnosing-bugs`, `code-review`.
3. **Anatomy** (ilustraciones isométricas tipo pictograma). Es tu "sí o sí".
4. **Impeccable** como auditor de diseño y detector de "AI slop".
5. **jakubkrehel/skills** (solo 4): accesibilidad, layout con texto traducido, tipografía y color.
6. **Anthropic skills**: `frontend-design` y `webapp-testing`.
7. **addyosmani/web-quality-skills**: rendimiento y Core Web Vitals, que también miden carbono.
8. **Nuestras skills**: `validador-space-apps-2026` y `pitch-storytelling-space-apps`.

Más dos librerías npm: **Motion** y **@lucasmarkes/hairline**. **Archify** para el diagrama de arquitectura.

---

## 1. Evaluación de cada recurso

Leyenda: ✅ usar · ⚠️ opcional o con condiciones · ❌ no usar · ❓ no identificado

### 1.1 Flujo de ingeniería con agentes
| Recurso | ⭐ / licencia | Qué es | Veredicto |
|---|---|---|---|
| **google/elephant-goldfish-model** (EGM) | 18,5k · Apache-2.0 | Plugin: el "Elefante" guarda el contexto y redacta la especificación; los "Peces dorados" la revisan sin la conversación previa para destapar supuestos ocultos. Funciona en Claude Code y Antigravity (`agy`) | ✅ **Usar el sábado 09:30–11:00** para el brief y la especificación. Requiere subagentes |
| **mattpocock/skills** (*Skills for Real Engineers*) | 324k · MIT | ~20 skills de ingeniería + productividad (los "23" que mencionas): grilling, spec, TDD, diagnóstico, revisión, prototipo, handoff… | ✅ **Solo 5**: `grill-me`, `prototype`, `tdd`, `diagnosing-bugs`, `code-review`. Si se instala todo se duplica con EGM |
| **multica-ai/andrej-karpathy-skills** | 233k · **sin licencia** | Un `CLAUDE.md` con 4 principios (pensar antes de programar, simplicidad, cambios quirúrgicos, ejecución guiada por metas) | ⚠️ **No copiar** (sin licencia). Escribimos nuestros 4 principios con nuestras palabras y citamos la idea |
| **DietrichGebert/ponytail** | 190k · MIT | "El senior más flojo": escalera de simplificación, revisión y auditoría | ⚠️ Se solapa con Karpathy y Pocock. Opcional para auditar al final |
| **addyosmani/agent-skills** | 117k · MIT | Ciclo /spec → /plan → /build → /test → /review → /ship | ⚠️ Excelente, pero duplica EGM + Pocock. Elegir **uno** |
| **addyosmani/web-quality-skills** | 3k · MIT | Lighthouse, Core Web Vitals, accesibilidad, rendimiento | ✅ Rendimiento = menos carbono + mejor *Validity* |
| **JuliusBrussee/caveman** | 120k · Apache-2.0 | Ahorra tokens haciendo que el agente "hable como cavernícola" | ❌ No hace falta y empeora la claridad de documentos en 3 idiomas |
| **affaan-m/ECC** (*Everything Claude Code*) | 302k · MIT | Arnés completo: agentes, skills, hooks, reglas, memoria y seguridad. Su autor (Affaan Mustafa) cuenta en el README que ganó el hackatón **Anthropic × Forum Ventures (sep-2025)** | ⚠️ **Como referencia, no como instalación completa.** Es enorme y sus *hooks* ejecutan código. Si se usa: `npx ecc-universal@2.2.3 install --profile minimal --no-hooks --target claude` |
| **anthropics/skills** | 194k · mixta (muchas Apache-2.0) | Skills oficiales: `frontend-design`, `webapp-testing`, `canvas-design`, `algorithmic-art`, `theme-factory`, `skill-creator`… | ✅ `frontend-design` + `webapp-testing`. `algorithmic-art` es opcional para el enjambre de partículas |

### 1.2 Diseño, UI y estilo
| Recurso | ⭐ / licencia | Qué es | Veredicto |
|---|---|---|---|
| **pbakaus/impeccable** | 109k · Apache-2.0 | Vocabulario de diseño (`polish`, `bolder`), `critique`, `audit` y 62 reglas deterministas anti-"AI slop" | ✅ **Auditor de diseño** antes de cada demo |
| **Leonxlnx/taste-skill** | 115k · MIT | Dirección de arte con imágenes de referencia y verificación en navegador | ⚠️ Útil para definir la dirección de arte; se solapa con Impeccable |
| **nextlevelbuilder/ui-ux-pro-max-skill** | 149k · MIT | Generador de sistemas de diseño genéricos (landing, conversión) | ❌ Empuja a patrones de landing comercial; nuestra identidad ya está definida |
| **Nutlope/hallmark** | 54k · MIT | 50 temas por "material" (incluye papel), con barrera contra hechos inventados | ⚠️ Alternativa a Impeccable; no usar ambos |
| **jakubkrehel/skills** | 12k · MIT | `better-accessibility`, `better-layout` (deja espacio para texto traducido), `better-typography`, `better-colors`, `interface-review`… | ✅ **4 skills**: las primeras cuatro. Clave para la plataforma trilingüe |
| **elayadesign/ai-design-skills** | 15k · MIT | Landing de conversión + diseño en Figma | ❌ No es nuestro caso |
| **21st.dev** (21st MCP) | ISC (cliente) | Catálogo de componentes React/Tailwind vía MCP | ⚠️ Requiere **cuenta y API key** (las crea el usuario), y cada componente tiene su propia licencia que hay que citar. Opcional para inspiración |

### 1.3 Ilustración, motion y diagramas
| Recurso | ⭐ / licencia | Qué es | Veredicto |
|---|---|---|---|
| **wheresryan22/anatomy** | 27k · MIT | Skill que inventa un **objeto físico cuyo funcionamiento *es* el concepto** y lo dibuja isométrico con piezas sombreadas, tarjeta, lectura en vivo y movimiento al puntero. SVG, SVG + WebGL (fuego, agua, brillo) y 3D beta | ✅ **Tu skill de pictogramas.** Tematizarla con la paleta papel-cartón. Ideal para explicar "cómo se prueba un taladro en un glaciar rocoso" |
| **wheresryan22/anatomy-figures** | MIT | 52 figuras de Anatomy como componentes React | ⚠️ Referencia de estilo |
| **lucasmarkes/hairline** | 3,7k · MIT · npm 0.5.1 | 33 figuras isométricas de líneas finas que reaccionan al puntero; sin dependencias; incluye `Terrain` | ✅ Acentos de la Parte B (estilo técnico) |
| **tt-a1i/archify** | 96k · Apache-2.0 | Skill que convierte una idea o un repo en un **diagrama interactivo** HTML autocontenido, con fuentes citadas | ✅ Diagrama de arquitectura para la página y el pitch. Citar la herramienta |
| **Motion** (motion.dev) | MIT | Animación JS/React, resortes, scroll | ✅ Principal |
| **anime.js v4** | MIT | Línea de tiempo para secuencias narrativas | ⚠️ Solo si una secuencia lo justifica |
| **react-spring** (`@react-spring/web` 10.1) | MIT | Física de resortes en React | ⚠️ Motion ya trae resortes; evitar dos motores |
| **GSAP** | licencia propia "no charge" | — | ❌ **No es OSI**; Space Apps exige materiales libres u OSI |
| **text-to-card** (crea cosas 3D) | — | No lo encontré con ese nombre | ❓ **Pásame el link exacto** |

### 1.4 Seguridad y referencias
| Recurso | Veredicto |
|---|---|
| **asgeirtj/system_prompts_leaks** (71k) | ❌ **No usar ni copiar.** Son prompts filtrados de terceros: la etiqueta CC0 del repo no da derechos sobre textos ajenos, y Space Apps exige permiso para todo material usado. Para aprender, Anthropic publica de forma oficial los *system prompts* de sus apps en su documentación y tiene guías de *prompt engineering* |
| **ISO/IEC 27001** | Es una certificación de **sistemas de gestión de una organización**; no aplica a un prototipo de 2 días. Aplicamos **controles proporcionales** (§4) y lo decimos así, sin afirmar cumplimiento |
| Skills GRC (p. ej. `Sushegaad/Claude-Skills-Governance-Risk-and-Compliance`, MIT) | ❌ Excesivo para el hackathon |
| `/security-review` de Claude Code + `npm audit` + Dependabot + escaneo de secretos de GitHub | ✅ Suficiente y verificable |

---

## 2. Estilos visuales que te llaman: dónde sirve cada uno

**Regla:** un estilo protagonista y acentos con función. Zumorroda-X ganó *Art & Technology* con **un** estilo coherente.

| Estilo | Rol | Justificación científica (no decorativa) |
|---|---|---|
| **Papel recortado** | 🟢 **Protagonista** (Partes A y B) | Capas = curvas de nivel reales del DEM |
| **Ray marching** | 🟡 Parte B, un módulo | **Ray marching del terreno (DEM), no fractales**: sombras con el Sol rasante de 0°–2,5° del Polo Sur lunar (Chrono-Luna). El fractal Mandelbulb no aporta ciencia y gasta GPU y batería |
| **Enjambre de partículas** | 🟡 Parte B | Cada partícula es un sitio análogo y el enjambre se agrupa por similitud; o el polvo y regolito movido por el viento |
| **Glassmorphism** | 🟠 Solo paneles flotantes del HUD | Cuidar el contraste (WCAG AA); nunca texto largo sobre vidrio |
| **Plastilina 3D** (clay) | 🔴 Evitar como estilo principal | Compite con el papel; como mucho un personaje guía. Dos estilos táctiles confunden la identidad |
| **Isométrico** (Anatomy / Hairline) | 🟢 Pictogramas y explicadores | Enseñar procesos con objetos que funcionan |

Todo con `prefers-reduced-motion` y alternativa estática.

---

## 3. Cómo meter IA (y respetar las reglas "Super Intelligence")

| Dónde | Sí / No | Cómo |
|---|---|---|
| **Idea central** | ❌ | Las reglas dicen que la IA no debe idear la solución. La decisión de qué construir la toma y documenta el equipo (acta humana en `AI_DISCLOSURE.md`) |
| **Flujo de desarrollo** | ✅ | Agentes + skills (EGM, Pocock, Impeccable…), con revisión humana de cada PR |
| **Método científico (Parte B)** | ✅ | ML **explicable** precalculado: vectores de características por dimensión → similitud (k-NN/coseno) + back-testing. Sin caja negra |
| **Contenido trilingüe** | ✅ con revisión | Borradores con IA en *build time*, revisados por personas y **declarados** |
| **Ilustraciones** | ✅ con condiciones | Anatomy y Hairline generan **código SVG propio**; si alguna imagen raster sale de IA → marca de agua visible. Nunca logos NASA |
| **Chatbot en el producto** | ❌ | Requiere servidor, API keys y guardar consultas → rompe "sin datos de nadie" y "sitio estático" |

Archivo obligatorio en el repo nuevo: `AI_DISCLOSURE.md` (plantilla incluida).

---

## 4. Seguridad proporcional ("hardening" inspirado en ISO/IEC 27001:2022, sin certificar)

| Control (referencia del Anexo A) | Aplicación concreta |
|---|---|
| Ciclo de desarrollo seguro / codificación segura (8.25, 8.28) | Revisión con `/security-review`; nada de `eval` ni HTML sin sanitizar |
| Vulnerabilidades técnicas (8.8) | `npm audit`, Dependabot y versiones fijadas con lockfile. Preferir versiones publicadas hace ≥ 7 días |
| Gestión de configuración (8.9) | CSP en `<meta>` (GitHub Pages no permite cabeceras propias), SRI si hay CDN (mejor: ningún CDN), sin scripts de terceros |
| Privacidad y datos personales (5.34) | Sin cookies, analítica, formularios ni cuentas; `localStorage` opcional y local |
| Control de acceso al repo | 2FA, protección de la rama `main`, escaneo de secretos activado |
| Cadena de suministro de skills | **Leer cada `SKILL.md` y sus scripts antes de instalar**; fijar el commit; no activar *hooks* de terceros |

**Commits revisados hoy** (fijarlos en `skills-lock.md` del repo nuevo):
`google/elephant-goldfish-model@964a4f1ecd33` · `mattpocock/skills@5863806dd4e1` · `wheresryan22/anatomy@1482e8469b0a` · `pbakaus/impeccable@c4cd1924c389` · `jakubkrehel/skills@a72290d14024` · `tt-a1i/archify@e37848822238` · `anthropics/skills@2c5958ecac7c` · `addyosmani/web-quality-skills@afa8da942115`

---

## 5. Stack completo y patrones de diseño (actualiza [`06_dos_partes_stack_motion_identidad.md`](06_dos_partes_stack_motion_identidad.md))

**Cambio recomendado: islas React en vez de Svelte.** Casi todo lo que quieres usar es React (Hairline, Anatomy-figures, 21st.dev, React Three Fiber, react-spring). Con React se integra sin fricción y los agentes lo dominan mejor.

| Capa | Elección (versión verificada) |
|---|---|
| Sitio | **Astro 7.4** estático + i18n `/es/ /en/ /zh/` |
| Islas | **React 19.3** (`@astrojs/react`) |
| Estilos | **Tailwind CSS 4.3** (`@tailwindcss/vite`) + tokens CSS de papel |
| Contenido | MDX con esquema Zod que exige `sources[]` + `rehype-citation` |
| 2D | MapLibre GL 6.18 + PMTiles 4.5 |
| 3D | three 0.187 + React Three Fiber 9.8 + drei 10.7 (ray marching de terreno y partículas) |
| Motion | Motion 14 (+ `@lucasmarkes/hairline` 0.5) |
| Gráficos | Observable Plot 0.6 |
| Offline / carbono / a11y | `@vite-pwa/astro` · CO2.js · axe-core |
| Ciencia | Python (xarray, rioxarray, scikit-learn) → JSON/COG/PMTiles precalculados |
| Despliegue | GitHub Pages + Actions |

**Patrones de arquitectura:**
- **Pipeline de datos precalculado** (*data at build time*): ningún servidor; el sitio solo lee archivos estáticos.
- **Islands architecture**: HTML estático + interactividad solo donde hace falta (menos carbono).
- **Ports & Adapters** para fuentes de datos: un adaptador por agencia (NASA, ESA, JAXA, CSA) con la misma interfaz `DatasetAdapter` → agregar una agencia no cambia el motor.
- **Strategy** para las métricas de similitud por dimensión (geología, topografía, térmica, hielo…), intercambiables y testeables.
- **Content as data**: cada análogo es una ficha MDX tipada (fuentes, datasets, dimensiones, brecha irreducible) en 3 idiomas.
- **Single source of truth** para la bibliografía (`references.bib`) y para los tokens de diseño.

---

## 6. Qué construir: MVP con recortes decididos de antemano

| Prioridad | Parte A · Explorador | Parte B · Misión |
|---|---|---|
| **P0 (sí o sí)** | 3 misiones guiadas por capas de papel sobre 3 análogos reales; cada una dice "en qué se parece y en qué no", con fuentes; trilingüe | Mapa con 5–10 análogos y fidelidad por dimensión; brecha irreducible visible; back-testing contra 3 análogos conocidos |
| **P1** | Pictogramas Anatomy de 2 procesos; modo offline | Ray marching de terreno con Sol rasante; exportar ficha |
| **P2** | Personaje guía animado | Enjambre de partículas por similitud; globo 3D |
| **Recortar si a las 18:00 del sábado no está P0** | P1 y P2 completos | P1 y P2 completos |

---

## 7. Cronograma de las 48 h con puntos de control

| Hora | Qué | Herramienta |
|---|---|---|
| Sáb 09:00 | Crear repo, copiar `plantillas/repo-hackathon/`, instalar skills fijadas, activar Pages | `npx skills add …` |
| 09:30 | **Brief y spec** (decisión humana de la idea; acta en `AI_DISCLOSURE.md`) | EGM `egm-brainstorm` → `egm-draft` |
| 11:00 | Revisión con ojos frescos + preguntas a la Local Lead | EGM `egm-review` + `validador-space-apps-2026` (modo idea) |
| 11:30 | Diagrama de arquitectura | Archify |
| 12:00–18:00 | P0 de ambas partes en paralelo (datos ↔ front) | Pocock `prototype`, `tdd` |
| 18:00 | **Gate P0** + envío preliminar de la página de proyecto | Validador (pre-envío) |
| Sáb noche | P1 + pictogramas | Anatomy, Hairline, Impeccable `critique` |
| Dom 09:00 | Pulido, accesibilidad y rendimiento | jakubkrehel, web-quality, axe |
| Dom 12:00 | Video de 30 s + pitch de 3 min | `pitch-storytelling-space-apps` |
| Dom 15:00 | `/security-review`, `npm audit`, links en ventana privada | — |
| Dom ≤ 20:00 | **Envío final** (cierra 23:59; no apurar) | Validador modo pre-envío |

---

## Fuentes
Repositorios leídos el 13-nov-2026: [google/elephant-goldfish-model](https://github.com/google/elephant-goldfish-model) · [mattpocock/skills](https://github.com/mattpocock/skills) · [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) · [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) · [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) · [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills) · [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman) · [affaan-m/ECC](https://github.com/affaan-m/ECC) · [anthropics/skills](https://github.com/anthropics/skills) · [pbakaus/impeccable](https://github.com/pbakaus/impeccable) · [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) · [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) · [Nutlope/hallmark](https://github.com/Nutlope/hallmark) · [jakubkrehel/skills](https://github.com/jakubkrehel/skills) · [elayadesign/ai-design-skills](https://github.com/elayadesign/ai-design-skills) · [21st-dev/magic-mcp](https://github.com/21st-dev/magic-mcp) · [wheresryan22/anatomy](https://github.com/wheresryan22/anatomy) · [lucasmarkes/hairline](https://github.com/lucasmarkes/hairline) · [tt-a1i/archify](https://github.com/tt-a1i/archify) · [asgeirtj/system_prompts_leaks](https://github.com/asgeirtj/system_prompts_leaks) · [motiondivision/motion](https://github.com/motiondivision/motion) · [juliangarnier/anime](https://github.com/juliangarnier/anime) · [pmndrs/react-spring](https://github.com/pmndrs/react-spring) · [greensock/GSAP](https://github.com/greensock/GSAP)
