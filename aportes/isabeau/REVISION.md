# Revisión del aporte de Isabeau Valverde · ATACAMA LOOP

> Revisado el 13-nov-2026 contra la guía oficial de NASA 2026 ([`00_desafio/03`](../../00_desafio/03_rubrica_oficial_global_2026.md)) y los objetivos de La Araucana ([`00_desafio/05`](../../00_desafio/05_lente_la_araucana_y_estrategia_doble_rol.md)).
> Su trabajo llegó desde un **fork** (`isabeau-valverde-cordovez/hackanasa`) y se fusionó en `main` conservando su autoría (commit de merge `eba55e2`).

---

## 1. Veredicto

**Es la propuesta más construible del repo y pasa a ser el núcleo del MVP.** Acota el problema a algo que un equipo de cuatro personas puede terminar en 48 h, con ciencia verificable y sin promesas que no se puedan probar.

| Fortaleza | Por qué suma |
|---|---|
| Una comparación **real, reproducible y con límites visibles** como mínimo suficiente | Es exactamente lo que pide *Validity* + *Relevance* |
| Datos exactos: **NASADEM** (1 segundo de arco) y **USGS CTX DEM Jezero (20 m/píxel)**, y la advertencia de no confundirlo con la resolución de las fotos CTX | Precisión que un juez SME nota |
| Procesamiento **previo** a archivos estáticos (JSON/GeoJSON) | Demo sin servidor = sin caídas |
| Regla explícita de **no inventar** porcentajes, aprendizajes, carbono, empleos ni alianzas | Coincide con las reglas del repo y protege de descalificación |
| **Monturaqui** marcado como opcional porque NASADEM no resuelve bien un cráter de ~350 m | Juicio de escala correcto (pide el desafío: "consider scale") |
| Rótulo **"Datos de ejemplo · no mediciones"** en las maquetas | Honestidad visible en el diseño |
| Tres funciones (Comparar, Aprender, Planificar) + Atlas y Evidencia como pestañas | Alcance controlado |
| Roles para un equipo de cuatro | Listo para repartir el sábado |

---

## 2. Ajustes recomendados

| # | Tema | Ajuste |
|---|---|---|
| 1 | **Atacama como titular** | La página del desafío nombra al Desierto de Atacama entre los sitios "ya muy estudiados", y **Yungay** es uno de los análogos de Marte más conocidos del mundo. Mantener Yungay como **control** (sirve para demostrar que el método funciona) y sumar al menos **un sector poco estudiado** que el propio método proponga en la región de Antofagasta |
| 2 | **Resolución inconsistente** | Una maqueta dice "Marte ~30 m por píxel"; el README dice 20 m (correcto para el CTX DEM). Unificar y explicar el remuestreo a una escala común |
| 3 | **Solo Marte** | Válido para el desafío ("Moon *or* Mars"). La Luna queda como P2 dentro de la red (*lattice*) |
| 4 | **Videos de 43 s y 70 s** | Sirven como demo conceptual interna. La demo para NASA debe durar **≤ 30 s** con subtítulos en inglés |
| 5 | **Planetas con anillos** en la portada | Decorativos, pero una audiencia científica nota que no corresponden a la Luna ni a Marte. En el arte final, usar los cuerpos reales sin anillos |
| 6 | **Trilingüe** | Agregar `react-i18next` desde el día 1 (es · en · zh) |
| 7 | **Imágenes generadas con IA** | Si alguna va a la entrega: marca de agua visible y declaración en `AI_DISCLOSURE.md` |

---

## 3. Archivos que no quedaron en `main` (y por qué)

Siguen en el historial de git y en el fork de Isabeau; solo se quitaron del árbol actual porque el repo es público.

| Archivo | Motivo |
|---|---|
| *Infografía ATACAMA LOOP: Análogos Planetarios* | Muestra la insignia de NASA y logos de ESA, JAXA y USGS, y un "87 % de similitud" inventado. NASA prohíbe su insignia sin permiso, y en especial junto a imágenes generadas con IA |
| *Infografía ATACAMA LOOP: Tierra, Luna y Marte* | Mismo motivo (una insignia NASA alterada, logos de agencias y "87 %") |
| *WhatsApp Image 11.44.03* | Foto de pantalla con el fondo que tiene la insignia de NASA y una búsqueda de Google que muestra la ubicación personal |
| *WhatsApp Images 11.56.13, 12.22.26 y 12.27.23* | Capturas de una conversación con fotos de terceros (derechos desconocidos, posibles personas reconocibles). Su contenido quedó resumido abajo |
| *readme prototipo* | Copia idéntica de `README_ATACAMA_LOOP.md` |

**Contenido de las capturas, resumido:** ATACAMA LOOP parte de algo concreto y realizable: **P1** comparación Tierra–Marte (pendientes, relieve y limitaciones), **P9** educación y accesibilidad (aprender a interpretar datos espaciales con retos) y **P5** planificación simplificada (preparar un ensayo con recursos y equipos compartidos). Pantallas: Comparar terrenos, Atlas de candidatos, Aprender, Planificar ensayo y Evidencia científica; Atlas y Evidencia pueden ser secciones internas de Comparar.

---

## 4. Material que sí quedó

| Archivo | Contenido |
|---|---|
| [`README_ATACAMA_LOOP.md`](README_ATACAMA_LOOP.md) | Su propuesta original, sin cambios |
| [`img/01-portada-papel.png`](img/01-portada-papel.png) | Portada en estilo capas de papel |
| [`img/02-comparar-terrenos-a.png`](img/02-comparar-terrenos-a.png) · [`03`](img/03-comparar-terrenos-b.png) · [`04`](img/04-comparar-terrenos-c.png) | Tres variantes de la pantalla Comparar (todas rotuladas "datos de ejemplo") |
| [`img/05-cinco-pantallas.gif`](img/05-cinco-pantallas.gif) | Recorrido animado de las cinco pantallas |
| [`video/demo-conceptual-43s.mp4`](video/demo-conceptual-43s.mp4) · [`70s`](video/demo-conceptual-70s.mp4) | Demos conceptuales con cursor (rotuladas "demo conceptual · datos científicos pendientes") |
