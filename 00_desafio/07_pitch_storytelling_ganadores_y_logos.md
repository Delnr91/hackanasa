# 00.7 · Cómo Contaron su Historia los Ganadores 2025 + Política de Logos en el Pitch

> Fuente: el campo *Summary* y la demo de las **10 páginas de proyecto ganadoras 2025**, leídas el 13-nov-2026 en `spaceappschallenge.org/2025/find-a-team/<equipo>/?tab=project`. Las citas son cortas y textuales; el resto es análisis propio.
> Skill derivada: [`pitch-storytelling-space-apps`](../.agents/skills/pitch-storytelling-space-apps/SKILL.md).

---

## 0. Respuesta corta

1. **Todos los ganadores escribieron el resumen con la misma estructura de tres golpes:** *qué construimos → cómo responde al desafío con datos NASA nombrados con precisión → por qué importa*. Es literalmente lo que pide el formulario, sin adornos.
2. **Cada uno tiene un "dispositivo narrativo" único**: un personaje, un narrador no humano, una pregunta-amenaza, un índice con nombre propio o una cifra brutal.
3. **Nombran el dataset exacto** (GeneLab OSD-288, API DONKI, NASA POWER, SPARK + DAS), no "datos de la NASA".
4. **Hay demo desplegada y pública** (Vercel, Netlify, GitHub Pages, Framer) y la demo de 30 s está en YouTube o Drive. Un solo ganador usó diapositivas de Canva.
5. **Los logos no hacen ganar**: ningún resumen ganador depende de mostrar logos. Lo que gana es la historia + el dato + la demo.

---

## 1. Disección de los 10 ganadores

| Premio | Proyecto | Dispositivo narrativo | Gancho (cita corta) | Prueba que usan | Lo que copiamos |
|---|---|---|---|---|---|
| Science | **SpaceGenes+** | *Brecha del statu quo*: "todos miran X aislado; en la realidad se combinan" | *"most space omics tools treat stressors in isolation"* | Dataset exacto **GeneLab OSD-288**, genes nombrados (TP53, ATM, GADD45A), fórmula de sinergia | "Ningún análogo calza solo; la **combinación de dimensiones** sí" |
| Data | **Resonant Worlds Explorer** | *Enemigo = el falso positivo* | La IA tradicional *"can misclassify or hallucinate"* | Pipeline completo Kepler/TESS/JWST → validación física → reporte | Enemigo = **el análogo elegido "por costumbre"** o por parecido visual |
| Technology | **SkySense (Twisters)** | *Pregunta cotidiana* | Convertir datos en decisiones *"understandable and actionable"* | NASA POWER API, Open-Meteo, asistente conversacional | Tagline como pregunta: **"¿Dónde en la Tierra entreno para la Luna?"** |
| Galactic Impact | **Astro Sweepers** | *Índice con nombre propio* (ASRI) + modelo de negocio | Un "credit score" para satélites | NASA SPARK + DAS + ESA DISCOS; clientes: operadores, aseguradoras | Bautizar nuestro índice (p. ej. **PAFI**) y mostrar **antes/después** |
| Mission Concept | **PureFlow** | *Pregunta-amenaza en el título* | *"Would Your Habitat Survive a Solar Storm... Today?"* | API **DONKI** con tormentas reales | Título-pregunta: **"¿Sobreviviría tu rover a este lugar… hoy?"** |
| Inspirational | **AakashNet (Photonics Odyssey)** | *Soberanía + un niño bajo una lámpara* | Cerrar la brecha digital rural | Diseño técnico (phased-array, banda Ku/Ka), 700 M sin banda ancha | **Una imagen humana concreta** (adulta en nuestro caso) y una cifra de alcance |
| Storytelling | **A Solar Tale (HerCode Space)** | *Narrador no humano*: el Sol cuenta su historia en 5 actos | Que *"the Sun … tell its own story"* | NASA Space Weather + NOAA SWPC; lista honesta de herramientas de IA | **Que la Luna/Marte (o una roca) narre**; actos = capas de papel |
| Global Connection | **Gaia-LEO** | *Cuantificar "cuándo y dónde" conviene* | Espacio como *"a computational layer"* | Optimización entera mixta, datos NASA de CO₂, agua y basura orbital | Nuestro optimizador: **cuándo y dónde** un análogo cercano reemplaza a uno lejano |
| Art & Technology | **Henry's Farm Adventure (Zumorroda-X)** | *Protagonista con nombre + viaje del héroe* | *"Meet Henry, a struggling farmer"* | Mini-juegos sobre eventos reales (inundaciones Pakistán 2022, olas de calor India) | **Personaje guía** en papel-cartón que viaja Tierra → Luna → Marte |
| Local Impact | **QUEÑARIS** | *Cifra brutal local* | Un manantial que cayó *"from 14 L/s to 0 in days"* | Datos satelitales + drones + IA + microorganismos nativos; % por sector | **Un número local verificable** del territorio de Antofagasta |

---

## 2. El patrón ganador en una fórmula

```
[Gancho: personaje | pregunta-amenaza | cifra brutal | narrador no humano]
→ [Enemigo claro: el statu quo que falla]
→ [Solución con nombre propio + índice/método bautizado]
→ [Prueba: dataset NASA exacto + demo pública que funciona]
→ [Futuro: a quién ayuda mañana y a escala]
```

**Estructura del *Summary* que usaron 10/10** (≈120–180 palabras):
1. *We developed **X**, a [tipo de herramienta] that [verbo + resultado] using [dataset NASA exacto].*
2. *It addresses the challenge by [mecanismo concreto]; unlike [statu quo], it [diferencia].*
3. *This matters because [consecuencia humana o de misión, con una cifra].*

---

## 3. Pitch "nivel Silicon Valley" adaptado a Space Apps

Estructuras clásicas de pitch de alto nivel (inversión y producto), traducidas a nuestras restricciones:

| Bloque | Origen del patrón | Versión 30 s (global) | Versión 3 min (local) |
|---|---|---|---|
| Una frase que dice qué haces | Práctica de aceleradoras: "say what you do in one sentence" | 0:05 título + tagline | 0:00–0:15 |
| Problema / "lo que es" | Duarte (*Resonate*): contraste "lo que es / lo que podría ser" | 0:02 desafío | 0:15–0:45 con persona y cifra local |
| Solución + demo | Demo-first | 0:10–0:20 captura real | 0:45–1:45 demo en vivo |
| Por qué ahora | Estructura de deck de capital de riesgo ("why now") | Artemis + Marte, datos abiertos disponibles | 1:45–2:00 |
| Prueba / tracción | — | Dataset NASA nombrado | Back-testing + usuarios que lo probaron en el evento |
| Modelo / sostenibilidad | Exigido por Nómada (20 %) | — | 2:00–2:30: gratuito, abierto, financiamiento institucional/educativo |
| Equipo + pedido | Cierre de deck | 0:20–0:30 futuro | 2:30–3:00 qué necesitamos y con quién |

> **Regla de oro:** el jurado global lee primero la página. El pitch en vivo (local) puede emocionar; la página (global) tiene que **probar**.

---

## 4. Logos en el pitch: qué se puede y qué no

**No es obligatorio poner logos** en ninguna entrega: ni la *Submission Guide* ni la *Judging Guide* lo piden. Lo obligatorio es **citar** datos y recursos en el formulario.

| Logo | ¿Usarlo? | Base |
|---|---|---|
| **Insignia NASA** (*meatball*), logotipo *worm*, sello | ❌ **No.** Requiere permiso explícito; además NASA no permite que su insignia aparezca junto a imágenes generadas con IA, y Space Apps lo prohíbe en contenido generado con IA | NASA Brand Center (*logo use*) · Submission Guide 2026 |
| **Logo de NASA Space Apps Challenge** | ⚠️ Solo si la guía de marca de Space Apps lo permite para equipos; las reglas publicadas cubren a Local Leads, Collaborators y Navigators, **no a equipos**. Consultar al Global Organizing Team o a la Local Lead | `spaceappschallenge.org/brand` |
| **Caja La Araucana / American Spaces / UCN** | ⚠️ Solo con autorización escrita del organizador | Uso de marca corporativa; las bases Nómada lo prohíben explícitamente para UCN/USQAI (11.d) |
| **Nómada / USQAI / UCN** | ❌ Sin autorización previa, no | Bases Nómada 2026, numeral 11.d |
| **Logos de agencias de datos** (ESA, JAXA, CSA…) | ⚠️ Cada agencia tiene sus reglas → usar **crédito en texto** | Política de cada agencia |
| **Nuestros logos** (equipo, `nasa-ciencia-abierta`, plataforma) | ✅ Sí, presentados como trabajo **independiente**, sin sugerir patrocinio | Propiedad propia |

**Recomendación práctica:** una diapositiva final "**Data & Credits**" solo en texto ("*Data: NASA LRO/LOLA, NASA Earthdata, ESA Copernicus, JAXA G-Portal…*") + nuestro logo. Si la Local Lead autoriza por escrito el logo de La Araucana para el Demo Day local, va **solo en la versión local**, nunca en la entrega global.

---

## Fuentes
- Páginas de proyecto 2025: [SpaceGenes+](https://www.spaceappschallenge.org/2025/find-a-team/spacegenes/?tab=project) · [Resonant Exoplanets](https://www.spaceappschallenge.org/2025/find-a-team/resonant-exoplanets/?tab=project) · [Twisters](https://www.spaceappschallenge.org/2025/find-a-team/twisters/?tab=project) · [Astro Sweepers](https://www.spaceappschallenge.org/2025/find-a-team/astro-sweepers-we-catch-what-space-leaves-behind/?tab=project) · [PureFlow](https://www.spaceappschallenge.org/2025/find-a-team/pureflow2/?tab=project) · [Photonics Odyssey](https://www.spaceappschallenge.org/2025/find-a-team/photonic-force/?tab=project) · [HerCode Space](https://www.spaceappschallenge.org/2025/find-a-team/hercode-space/?tab=project) · [Gaia+LEO](https://www.spaceappschallenge.org/2025/find-a-team/gaialeo/?tab=project) · [Zumorroda-X](https://www.spaceappschallenge.org/2025/find-a-team/zumorroda-x/?tab=project) · [QUEÑARIS](https://www.spaceappschallenge.org/2025/find-a-team/watana-project/?tab=project)
- [NASA Brand Center: NASA Logo Use](https://www.nasa.gov/nasa-brand-center/nasa-logo-use/) · [NASA Brand Guidelines](https://www.nasa.gov/nasa-brand-center/brand-guidelines) · [NASA Images and Media Usage Guidelines](https://www.nasa.gov/multimedia/guidelines/index.html)
- [Space Apps Brand](https://www.spaceappschallenge.org/brand/) · [Project Submission Guide 2026](https://www.spaceappschallenge.org/resources/project-submission-guide/)
- Bases Nómada 2026 (USQAI-UCN), numeral 11.d; ver [`06_rubrica_nomada_usqai_y_cruce.md`](06_rubrica_nomada_usqai_y_cruce.md)
