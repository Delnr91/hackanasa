# Reglas del repo de construcción · NASA Space Apps 2026 (Lattices Team)

> Copiar este archivo como `CLAUDE.md` (y enlazarlo como `AGENTS.md` para Antigravity/Codex).
> Contexto de investigación: repo `hackanasa`. Ante cualquier duda de reglas manda `hackanasa/00_desafio/03_rubrica_oficial_global_2026.md`.

## Qué construimos
Un solo motor de análogos terrestres de la Luna y Marte con datos abiertos, en dos partes:
- **Parte A · Explorador** (sede Antofagasta, La Araucana): aprendizaje para todas las edades, por capas de papel.
- **Parte B · Misión** (jurado global NASA): fidelidad por dimensión, brecha física irreducible y back-testing.
La idea y las decisiones de producto las toma el equipo humano (ver `AI_DISCLOSURE.md`).

## Reglas no negociables
1. **Datos abiertos y citados desde el día 1.** Cada ficha MDX tiene `sources[]` y `datasets[]`; sin fuente, no compila. Bibliografía única en `src/data/references.bib`.
2. **Al menos un dataset NASA en el núcleo** de cada resultado mostrado, con su rótulo de fuente visible.
3. **Honradez física:** nunca "idéntico a la Luna/Marte". Siempre qué se parece, cuánto y qué no (1/6 g o 0,38 g, vacío o CO₂ de ~0,6 kPa, radiación, 40–90 K en PSR).
4. **Trilingüe:** `es` (fuente), `en` (obligatorio para NASA), `zh` (chino simplificado). Ningún texto suelto: todo pasa por los diccionarios o el contenido MDX. Las traducciones con IA se declaran y las revisa una persona.
5. **Privacidad:** sin base de datos, cuentas, cookies, analítica ni formularios. Solo `localStorage` opcional y local.
6. **Sin menores** reconocibles en imágenes, voces o video.
7. **Sin marcas NASA** (insignia, *worm*, sello) ni logos de terceros sin permiso escrito. Imágenes raster generadas con IA → marca de agua visible.
8. **Licencias:** código MIT, contenidos CC BY 4.0, dependencias solo con licencia OSI (GSAP no).
9. **Nada de cooperación con entidades chinas** (política NASA). El idioma chino está permitido.
10. **Accesibilidad:** WCAG AA, teclado, `prefers-reduced-motion` con alternativa estática.

## Cómo trabajamos (principios propios, inspirados en las observaciones de Karpathy sobre agentes)
- **Piensa antes de programar:** si algo es ambiguo, pregunta; no supongas.
- **Simplicidad primero:** la solución más pequeña que cumpla; nada de abstracciones "por si acaso".
- **Cambios quirúrgicos:** toca solo lo que la tarea necesita.
- **Guiado por metas verificables:** define cómo se comprueba (test, captura, métrica) antes de construir.

## Stack
Astro 7 (estático, i18n) · React 19 (islas) · Tailwind 4 · MDX + rehype-citation · MapLibre + PMTiles · three/R3F (solo Parte B) · Motion · Hairline · Observable Plot · PWA · CO2.js · axe-core · GitHub Pages. Ciencia en Python, precalculada a archivos estáticos.

## Patrones
Pipeline precalculado · Islands · Ports & Adapters por agencia (`DatasetAdapter`) · Strategy por dimensión de similitud · Content as data · Fuente única de verdad (bibliografía y tokens).

## Skills del repo (fijadas en `skills-lock.txt`)
EGM (spec + revisión con ojos frescos) · grill-me · prototype · tdd · diagnosing-bugs · code-review · anatomy · impeccable · better-accessibility/layout/typography/colors · archify · frontend-design · webapp-testing · web-quality-audit · core-web-vitals · validador-space-apps-2026 · pitch-storytelling-space-apps.

## Puntos de control
- Sáb 18:00 → gate P0 + envío preliminar (validador, modo pre-envío).
- Dom ≤ 20:00 → envío final. El cierre es a las 23:59, hora de Chile.
