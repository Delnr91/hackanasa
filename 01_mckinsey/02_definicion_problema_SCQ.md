# 01.2 · Definición del Problema: Problem Statement Worksheet & Marco SCQ

> **Rol activo:** *Engagement Manager (McKinsey) + Systems Engineering Lead (NASA Ames / MIT AeroAstro)*.

---

## 1. Pregunta Raíz SMART (*Basic Question to be Resolved*)

> **¿Cómo podemos construir en 48 horas, utilizando exclusivamente datos satelitales abiertos y bibliotecas libres globales, un sistema cuantitativo, reproducible e interactivo que (1) evalúe la fidelidad multidimensional y estacional de cualquier coordenada terrestre respecto a los sitios candidatos de base lunar permanente y exploración marciana, (2) demuestre validez científica ubicando $\ge 85\%$ de los sitios análogos de referencia internacional en el percentil $\ge 95$ de su dimensión dominante, y (3) identifique al menos 12 sitios análogos nuevos o sub-caracterizados distribuidos globalmente (con énfasis estratégico local y mundial)?**

---

## 2. McKinsey Problem Statement Worksheet (Hoja Oficial de Definición)

| Componente McKinsey | Especificación Rigurosa para *Hackanasa 2026* |
|---|---|
| **1. Decisor / Audiencia (*Decision Makers*)** | **Corto plazo:** Jurado Local de Space Apps (innovación, claridad, impacto territorial) + Jurado Ejecutivo Global de SMEs de NASA y agencias socias (rigor físico, calidad de uso de datos, utilidad real).<br>**Usuario final simulado:** Directores de campañas análogas (*NASA Analog Missions*, *ESA PANGAEA*, *ISRO HSFC*, *CNSA*, consorcios universitarios de robótica espacial). |
| **2. Contexto y Disparador (*Context*)** | El cambio de paradigma de misiones cortas ecuatoriales (*Apollo*) a **presencia humana sostenida** en el Polo Sur Lunar (*Artemis III–V*, *ILRS*) y latitudes medias con hielo en Marte (*Exploration Zones* / *Starship*). Los catálogos actuales son estáticos, textuales y no permiten consultar cuantitativamente combinaciones nuevas de variables + época del año. |
| **3. Criterios de Éxito (*Success Criteria*)** | 1. **Validez matemática:** Índice libre de unidades arbitrarias con *back-testing* estadístico.<br>2. **Cobertura dual:** Resuelve tanto **Base Lunar Permanente** como **Marte** sin forzar una métrica única engañosa.<br>3. **Descubrimiento verificable:** Encuentra análogos reales fuera del canon clásico (ej. complejos anortosíticos subpolares, glaciares de roca de Andes Áridos, cuencas de Asia Central/Siberia).<br>4. **Experiencia interactiva:** Demo web fluida accesible con un clic sin credenciales. |
| **4. Alcance Incluido (*In Scope*)** | Superficie continental e insular terrestre ($90^\circ\text{N}$ a $90^\circ\text{S}$); 8 dimensiones geofísicas/operativas observables desde órbita o calculables analíticamente; variación estacional de iluminación solar y temperatura; sitios candidatos *Artemis III* (9), *ILRS/Chang'e-7*, *Chandrayaan-3* y 6 *Exploration Zones* marcianas. |
| **5. Alcance Excluido (*Out of Scope*)** | Simulación en campo de microgravedad ($1/6\,g$, $0.38\,g$), vacío ultra-alto o radiación cósmica galáctica ionizante (se modelan como **Brecha Física Irreducible** e indicadores de necesidad de instalaciones complementarias como cámaras TVAC o piscinas de flotabilidad neutra); fondos abisales oceánicos. |
| **6. Restricciones (*Constraints*)** | Ventana de ejecución de 48 h (14–15 nov 2026); presupuesto $0 (100 % open data y open-source); prohibición de llevar código de aplicación pre-escrito al evento; necesidad de tiempos de respuesta en la demo $< 2\text{ s}$ (exige pre-cálculo inteligente de grillas o teselas estáticas). |
| **7. Fuentes Primarias (*Core Sources*)** | NASA PDS (LOLA, Diviner, MOLA, THEMIS), Moon Trek / Mars Trek WMTS, SWIM, Mars Climate Database, Google Earth Engine (Copernicus DEM, MODIS LST, ERA5-Land, WorldCover, AlphaEarth Embeddings), CGIAR Aridity, GLiM, ESA CCI Permafrost, IANIGLA, catálogos Europlanet/CAFE y literatura en 12 idiomas. |

---

## 3. Reencuadre Estratégico del Problema (*Reframing — Pensamiento Stanford d.school + MIT*)

La diferencia entre un proyecto promedio y un **Global Winner** está en cómo reencuadra la pregunta del desafío:

| Supuesto ingenuo del 95 % de los equipos | Nuestro Reencuadre Experto (*MIT / NASA / McKinsey*) |
|---|---|
| *"Busquemos el lugar de la Tierra más parecido a la Luna y el más parecido a Marte."* | **Falacia del promedio:** Promediar temperatura, geología y aridez destruye la señal física. Un análogo se evalúa como un **vector multidimensional condicionado a un ensayo de ingeniería específico** ($\vec{s}(x, y, t \mid \text{ensayo})$). |
| *"La Luna es roca volcánica negra como Hawái o Islandia."* | **Error geológico crítico para el Polo Sur:** Los mares basálticos son oscuros y ecuatoriales, pero el **Polo Sur Lunar (*Artemis III* / *ILRS*) son Tierras Altas antiguas dominadas por Anortosita Ferroana** (rica en plagioclasa cálcica, alto albedo) y brechas de impacto. Nuestro modelo separa **Análogos de Mare (Basalto)** de **Análogos de Highlands (Anortosita)**. |
| *"Un sitio análogo es una coordenada fija $(lat, lon)$."* | **El análogo es espacio-temporal $(lat, lon, \text{día del año})$:** Svalbard o el norte de Escandinavia en julio tienen Sol alto y deshielo; en octubre/febrero tienen **Sol rasante a $1.5^\circ$ sobre el horizonte** idéntico geométricamente a *Mons Mouton* o el borde de *Shackleton*. |
| *"Elegimos 1 sitio ganador."* | **Optimización de Portafolio de Misión:** Ningún sitio cubre el 100 %. Una agencia espacial necesita el **conjunto mínimo de 3–4 sitios complementarios** que cubra el 95 % de los requisitos técnicos de su misión minimizando el costo logístico. |

---

## 4. Mapa de Stakeholders y Necesidades (*Empathy & Value Matrix*)

| Perfil de Usuario | Dolor Actual (*Pain Point*) | Qué necesita ver en 15 segundos en nuestra herramienta |
|---|---|---|
| **Ingeniero de Rovers / Visión (NASA JPL, JAXA, ISRO)** | Sus cámaras fallan con sombras kilométricas y deslumbramiento directo a $1^\circ$ de elevación solar. | Calendario + mapa que le diga: *"Andá a este valle basáltico/anortosítico entre el 18 de octubre y el 2 de noviembre: tendrás 4.5 h diarias de Sol a $0.5^\circ\text{–}2^\circ$ y pendientes de $12^\circ$"*. |
| **Ingeniero de ISRU y Perforación (SpaceX / NASA Marshall)** | Necesita probar extracción de agua en hielo cubierto por escombros secos sin viajar a la Antártida ($500k USD de logística). | Ranking de **gemelos criogénicos accesibles por ruta** (ej. glaciares de roca en San Juan/Mendoza a $4{,}200\text{ m}$ o Ladakh en India) con espesor estimado de capa activa seca y temperatura. |
| **Científico Planetario / Astrobiólogo** | Quiere calibrar espectrómetros (SHERLOC, PIXL, IIRS, Raman) en mineralogías análogas exactas. | Filtro mineralógico directo: *Jarosita* (Matanomadh, Río Tinto), *Sulfatos de Mg / Percloratos* (Dalangtan/Qaidam, Yungay/Atacama), *Carbonatos en basalto* (Svalbard), *Anortosita* (Sittampundi, Lofoten, Groenlandia). |
| **Agencia Espacial Emergente / Universidad Local** | No tiene presupuesto para campañas en Devon Island o McMurdo, y desconoce el valor de su propio territorio. | Modo **"Descubrí los Gemelos Planetarios de tu País"** con ficha científica exportable lista para pedir financiamiento o armar campañas universitarias. |
