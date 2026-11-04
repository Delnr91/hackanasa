# 01.4 · Hipótesis "Day One", Priorización 80/20 y Diseño Experimental

> **Rol activo:** *Engagement Manager (McKinsey) + Investigador Principal de Ciencia de Datos Planetarios (Stanford / MIT)*.

---

## 1. Sistema de Hipótesis Falsables "Day One"

En el método McKinsey, enunciamos la solución completa como hipótesis verificables antes de procesar el primer píxel:

| ID | Hipótesis Científica / Estratégica | Criterio Cuantitativo de Éxito (*Pass/Fail*) | Qué hacemos si se refuta |
|---|---|---|---|
| **H1 (Validez del Vector)** | Un índice geométrico-ponderado de 8 dimensiones satelitales abiertas (**PAFI**) recupera los análogos históricos de NASA/ESA/ISRO/CNSA sin haber sido entrenado supervisadamente con ellos. | $\ge 85\%$ de los 20 análogos de control caen en el **percentil $\ge 95$** global dentro de su perfil de misión correspondiente. | Revisar escalado de variables asimétricas (aplicar transformación logarítmica en aridez y pendiente) o sustituir suma lineal por media geométrica penalizada. |
| **H2 (La Trampa del Basalto en el Polo Sur Lunar)** | Al exigir simultáneamente **litología anortosítica / corteza félsica-cálcica antigua**, baja vegetación, relieve escarpado y **alta latitud**, los volcanes basálticos tropicales (Hawái) caen en el ranking del Polo Sur Lunar y emergen **Groenlandia occidental (*Fiskenæsset*), Lofoten (Noruega), Labrador (*Nain*) y Sittampundi (India)**. | Los complejos anortosíticos superan en $\ge 25$ puntos de fidelidad litológica-polar a los campos basálticos ecuatoriales para el perfil *Artemis III Highlands*. | Si el mapa global GLiM no distingue anortosita de otros plutones, cruzar con el catálogo global de macizos anortosíticos (Ashwal) y reflectancia ASTER/Sentinel-2. |
| **H3 (Ventanas Efímeras de Luz Rasante)** | Existen lugares accesibles en latitudes $64^\circ\text{–}80^\circ$ (Ártico europeo, canadiense, siberiano y península Antártica) que en **ventanas específicas de 15–30 días al año** reproducen $\ge 4\text{ h/día}$ de elevación solar en $[0.3^\circ, 2.5^\circ]$ sin cobertura nívea total; y **solo la meseta polar ($>88.5^\circ$)** cerca de los equinoccios reproduce el giro azimutal continuo de $360^\circ$. | Demostración analítica exacta con efemérides solares + cruce con máscara de nieve MODIS (`MOD10A2`). | Si todos los sitios $>65^\circ$ ya tienen nieve en esas fechas, identificar campos de lava oscuros barridos por el viento en Islandia norte ($66^\circ\text{N}$ en diciembre) o valles secos polares sin acumulación nívea. |
| **H4 (Gemelos Accesibles de Hielo Marciano)** | Para misiones humanas a *Arcadia Planitia* y *Phlegra Montes*, los **glaciares de roca cubiertos de detritos en los Andes Centrales Áridos (Argentina/Chile)**, **Ladakh (India)** y el **permafrost de Yakutia / Qaidam alto** ofrecen la mayor relación **Fidelidad Criogénica / Costo Logístico** del planeta fuera de la Antártida. | En el frente de Pareto *(Fidelidad ISRU Hielo vs. Accesibilidad Vial)*, Andes Centrales y Ladakh dominan a McMurdo y Devon Island por un factor $>5\times$ en tiempo/costo de acceso. | Documentar diferencias en temperatura media del hielo ($-2^\circ\text{C}$ andino vs. $-20^\circ\text{C}$ antártico vs. $-60^\circ\text{C}$ marciano) en la columna de brecha térmica. |
| **H5 (Descubrimiento de Sitios Sub-Explorados)** | Al restar un *buffer* de $100\text{ km}$ alrededor de los sitios análogos clásicos publicados en inglés, aparecen al menos **12 candidatos de fidelidad $\ge 0.85$** en Sudamérica, Asia Central, Siberia, África y Medio Oriente. | Top-12 de candidatos "vírgenes" o sub-citados verificados visualmente con imágenes Sentinel-2 de $10\text{ m}$ y DEM de $30\text{ m}$. | Ajustar máscaras de salares estacionalmente inundados y áreas agrícolas para eliminar ruido. |
| **H6 (Superioridad del Portafolio)** | Ningún sitio individual en la Tierra alcanza $\ge 0.80$ simultáneamente en los 6 modos de prueba de una base permanente, pero un **portafolio óptimo de 3 a 4 sitios** supera $\ge 0.90$ de cobertura conjunta. | Demostración matemática vía *Set Cover* sobre la matriz de sitios candidatos. | Mostrar curva de rendimientos decrecientes de 1, 2, 3, 4 y 5 sitios. |

---

## 2. Priorización Rigurosa 80/20 para las 48 Horas

Evaluamos cada módulo candidato según **(A) Impacto directo en los 5 criterios de jueces de Space Apps** y **(B) Facilidad y seguridad técnica en 48 horas**:

| Prioridad | Módulo / Entregable | Impacto Jueces (1–10) | Viabilidad 48h (1–10) | Score 80/20 | Decisión Ejecutiva |
|---|---|---|---|---|---|
| **P0 — Núcleo Vital** | **Índice Multidimensional PAFI (8 capas abiertas) + Tabla de Brecha Física Irreducible** | 9.8 | 8.5 | **9.15** | **Hacer Día 1 mañana.** Es el cimiento de *Validity* y *Best Use of Data*. |
| **P0 — Núcleo Vital** | **Motor Astronómico *Chrono-Analog* de Luz Rasante Polar Lunar (lugar + día del año)** | 9.6 | 9.2 | **9.40** | **Hacer Día 1 mañana.** Cero riesgo de descarga pesada, física exacta y máximo factor *Creativity / Wow*. |
| **P0 — Núcleo Vital** | **Back-testing Estadístico contra 20 Análogos Oficiales (NASA/ESA/CNSA/ISRO/IKI)** | 9.5 | 9.0 | **9.25** | **Hacer Día 1 tarde.** Convierte un mapa bonito en ciencia publicable. |
| **P1 — Alto Valor** | **Atlas Web Interactivo 2D/3D + Comparador Lado a Lado + Radar de 8 Ejes** | 9.4 | 7.5 | **8.45** | **Hacer Día 1 tarde – Día 2 mañana.** Clave para *Presentation* y *Relevance*. |
| **P1 — Alto Valor** | **Descubrimiento Global + Caso Estrella Local (Anortosita Polar + Glaciares de Roca Andinos / Puna)** | 9.2 | 8.0 | **8.60** | **Hacer Día 2 mañana.** Asegura victoria en Sede Local y diferenciación Global. |
| **P2 — Diferenciador** | **Optimizador Matemático de Portafolio de Campaña (*Mission Campaign Planner*)** | 8.8 | 7.8 | **8.30** | **Hacer Día 2 mañana** (es un script limpio de 60 líneas sobre la tabla ya calculada). Apunta a *Best Mission Concept*. |
| **P3 — Extensión IA** | **Buscador Vectorial de Texturas Geomórficas con Embeddings (`AlphaEarth` / invariantes DEM)** | 8.5 | 5.5 | **7.00** | **Solo si P0–P2 están cerrados** antes de la hora 30, o pre-calcular sobre 200 sitios candidatos. |
| **Descartado** | **Entrenar desde cero una red neuronal profunda sobre terabytes crudos de HiRISE/LROC** | 6.0 | 1.5 | **3.75** | **No hacer.** Alto riesgo de colapso de GPU/tiempo en 48 h con poco retorno adicional frente a P0–P2. |

---

## 3. Diseño de Validación Científica (A Prueba de Jurados NASA)

1. **Conjunto de Control Ciego (*Hold-out Benchmark* de 20 sitios):**
   Calculamos las fórmulas usando **únicamente parámetros de la Luna y Marte** (sin ajustar trampas ad-hoc a coordenadas terrestres) y verificamos en qué percentil caen automáticamente:
   - *Control Marte Frío/Hielo:* University Valley (McMurdo), Haughton Crater (Devon Island), Svalbard (Bockfjord), Batagaika/Yakutia, Tso Kar (Ladakh).
   - *Control Marte Hiperárido/Químico:* Yungay (Atacama), Dalangtan (Qaidam), Río Tinto, Matanomadh (Kachchh), Dallol (Danakil).
   - *Control Volcánico/Tubos:* Lanzarote, Holuhraun (Islandia), Mauna Kea (Hawái), Craters of the Moon (Idaho), Tolbachik (Kamchatka), Payunia (Mendoza).
   - *Control Impacto y Tierras Altas Lunares:* Meteor Crater (Arizona), Ries (Alemania), Lonar (India), Lofoten (Noruega), Sittampundi (India), Fiskenæsset (Groenlandia).
2. **Prueba de Robustez Monte Carlo (1,000 iteraciones):**
   Perturbamos los vectores de pesos AHP con ruido Dirichlet ($\alpha = 10$) y medimos la frecuencia con que cada candidato permanece en el Top-25. En la ficha de cada sitio reportamos su **Índice de Estabilidad de Ranking ($R_{\text{stab}} \in [0,100\%]$)**.
