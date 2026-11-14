# 05.10 · Tierra, Luna y Marte para todos: datos correctos, alfabetización digital y modelo de negocio

> **Decisión del 14-nov-2026:** no hacemos un rover. Hacemos una experiencia de **Tierra · Luna · Marte** con **datos verificados de NASA**, pensada para personas con **poca experiencia digital** y para aprender a cualquier edad. El modelo de negocio va en el pitch local (Nómada y La Araucana lo valoran; NASA no lo puntúa).
> Valores verificados el 14-nov-2026 en las *Planetary Fact Sheets* de NASA (NSSDCA, Goddard).

---

## 1. La idea en una frase

**"Tres mundos en tu mano":** cualquier persona, aunque nunca haya usado una app, toca Tierra, Luna o Marte y descubre con **datos reales de NASA** qué tiene el desierto de Atacama de la Luna y de Marte, y qué no.

**Por qué responde al desafío:** cada tarjeta **caracteriza a Atacama como análogo, dimensión por dimensión** (terreno, aire, gravedad, temperatura, radiación), y dice dónde se rompe la analogía. Es exactamente lo que pide la página oficial, contado para todos.

**Premio global al que apunta:** *Best Use of Data*, que premia el proyecto que **"best makes space data accessible"**. Y *Local Impact*.

---

## 2. Los datos de los tres mundos (verificados)

| Dimensión | 🌍 Tierra | 🌑 Luna | 🔴 Marte | Cómo se explica sin jerga | ¿Atacama se parece? |
|---|---|---|---|---|---|
| **Gravedad** | 9,8 m/s² (1) | 1,6 m/s² (**0,166**) | 3,7 m/s² (**0,377**) | *"Una mochila de 10 kg se siente como de 1,7 kg en la Luna y de 3,8 kg en Marte."* | ❌ No. Ningún lugar de la Tierra la cambia |
| **Aire** (presión en superficie) | 1 bar | casi nada (~3 × 10⁻¹⁵ bar de noche) | ~0,006 bar (6,36 mb), **95,1 % CO₂** | *"El aire de Marte es unas 160 veces más delgado que el nuestro, y casi todo es CO₂. En la Luna prácticamente no hay aire."* | ❌ No. Ni en la cumbre más alta |
| **Temperatura** | promedio 15 °C | en el ecuador, de **−178 °C a +117 °C** (95–390 K) entre noche y día | promedio entre −59 y −65 °C según la ficha; en el sitio Viking 1, de −89 °C a −31 °C en un día | *"En la Luna, del día a la noche la temperatura cambia casi 300 grados."* | ❌ No. Atacama es mucho más templado |
| **Duración del día** | 24 h | **29,5 días terrestres** (708,7 h) | **24,7 h** | *"Un día en Marte dura casi lo mismo que aquí; en la Luna, casi un mes."* | — |
| **Escudo magnético** | sí | no | no | *"La Tierra tiene un escudo invisible que nos protege de la radiación; la Luna y Marte no."* | ❌ No. En Marte, Curiosity midió ~0,64 mSv por día de radiación (Hassler et al., 2014) |
| **Terreno** (pendientes y relieve) | **dato calculado en la app** con NASADEM | (P2) con LRO LOLA | **dato calculado en la app** con el DEM de Jezero (USGS) | *"Comparamos qué tan inclinado es el suelo en Atacama y en el cráter Jezero."* | 🟡 **En parte. Se mide** (ver el [paper de datos](../02_investigacion_global/11_paper_datos_desafio.md)) |
| **Distancia** | — | 384 000 km en promedio (0,384 millones de km) | varía mucho según la posición de los planetas | *"La Luna está a unos tres días de viaje; Marte, a varios meses."* **[verificar tiempos de viaje antes de usarlos]** | — |

**Reglas de los datos:**
- Cada número muestra su **fuente** en pantalla ("Fuente: NASA Planetary Fact Sheet").
- **Discrepancia visible:** la tabla comparativa de NASA da −65 °C de temperatura media para Marte y la ficha de Marte da ~−59 °C. Se muestran ambas o se usa un rango, nunca se elige una a escondidas.
- Los valores de Atacama (terreno) los **calcula la app** con los DEM; no se inventan.
- Atacama aparece como **control conocido**; el aporte es el método y el acceso, no "descubrir" Atacama.

---

## 3. Diseño para baja alfabetización digital

### Principios
1. **Sin barreras de entrada:** sin cuenta, sin escribir, sin descargar una app (web que se abre con un código QR).
2. **Una idea por pantalla** y un solo botón grande para avanzar.
3. **Imagen + palabra + voz** siempre juntas. Nunca un ícono solo.
4. **Analogías con objetos cotidianos** (mochila, termo, un día de trabajo) y con lugares de la región.
5. **Toques simples:** nada de pellizcar, arrastrar ni gestos ocultos.
6. **Funciona sin internet** después de abrirla una vez (PWA) y en celulares básicos.
7. **Se puede usar acompañado:** modo para que una persona guía (docente, monitor) la proyecte en grupo.
8. **Existe en papel:** las mismas tarjetas, imprimibles, para quien no tiene celular. Encaja con la identidad de capas de papel.

### Tres niveles con los mismos datos ("de todo aprendizaje")
| Nivel | Para quién | Qué ve |
|---|---|---|
| **1 · Mirar** | primer contacto, cualquier edad | imagen del mundo + una frase + botón "Escuchar" |
| **2 · Comparar** | curiosidad | los tres mundos lado a lado con la analogía cotidiana y "¿Atacama se parece? sí / en parte / no" |
| **3 · Investigar** | estudiantes, docentes, jurado | números exactos, unidades, fuentes, histograma de pendientes Atacama vs. Jezero, descarga de datos |

### Pantalla tipo (celular)
```
┌─────────────────────────┐
│  🔊 Escuchar      ES EN ZH│
│                         │
│   [imagen real: Marte]  │
│                         │
│  En Marte, tu mochila   │
│  de 10 kg se siente     │
│  como de 3,8 kg.        │
│                         │
│  ¿Atacama se parece?    │
│  ❌ No: la gravedad no  │
│  cambia en la Tierra.   │
│                         │
│  Fuente: NASA           │
│ ┌─────────────────────┐ │
│ │     SIGUIENTE  ▶    │ │
│ └─────────────────────┘ │
│ [🌍] [🌑] [🔴]  nivel 2 │
└─────────────────────────┘
```

### Accesibilidad concreta
- Texto de al menos 18 px; botones de al menos 48 × 48 px; contraste WCAG AA o mejor.
- Lectura en voz con la síntesis de voz del propio dispositivo (`speechSynthesis`), en español, inglés y chino. Se declara en `AI_DISCLOSURE.md` si alguna voz se genera con IA.
- Lenguaje claro según la norma **ISO 24495-1:2023** (lenguaje claro) y las guías de accesibilidad cognitiva del **W3C**.
- Sin animaciones automáticas; con `prefers-reduced-motion`, todo estático.
- **Prueba con personas durante el hackathon:** tres pruebas cortas con adultos de distintas edades y experiencia digital. Se anotan solo observaciones, **sin nombres, fotos ni voces**.

---

## 4. Modelo de negocio (para el pitch local)

**Principio:** el contenido y el código son **abiertos y gratuitos** para quien aprende (Space Apps exige licencia OSI). Se cobra por **servicios** a instituciones, no por el acceso.

| Bloque | Contenido |
|---|---|
| **Problema** | La ciencia espacial y los datos de NASA son públicos, pero quedan lejos de quien tiene poca experiencia digital (adultos mayores, zonas rurales, familias sin computador) |
| **Usuarios (no pagan)** | Estudiantes, familias, adultos mayores, comunidades de la región |
| **Clientes (pagan o financian)** | Cajas de compensación y sus programas para afiliados · municipios y bibliotecas · colegios · centros de divulgación y turismo astronómico · programas de relación comunitaria de empresas · universidades |
| **Propuesta de valor (usuarios)** | Aprender ciencia real de la Luna y Marte sin saber usar tecnología, en el celular o en papel |
| **Propuesta de valor (clientes)** | Un programa de ciencia listo para usar, con datos de NASA citados, accesible, en 3 idiomas, alineado con ODS 4.3, 4.4 y 9.5, y medible **sin recolectar datos personales** |
| **Canales** | Sucursales y programas de La Araucana (ya tiene un plan de sucursales inclusivas para afiliados con discapacidad visual) · bibliotecas (Quemchi es sede 2026) · American Spaces · colegios · sedes de Space Apps en Chile |
| **Fuentes de ingreso** | 1) Talleres guiados y formación de personas guías · 2) Kits de tarjetas impresas · 3) **Nodos patrocinados:** una institución financia caracterizar un sitio nuevo de su territorio, con crédito transparente y sin publicidad dentro del contenido científico · 4) Fondos: CORFO Semilla Inicia, fondos concursables de La Araucana, programas de divulgación del Ministerio de Ciencia **[verificar bases y plazos]** |
| **Costos** | Publicación casi gratis (sitio estático) · revisión científica · traducción · impresión · horas de las personas guías |
| **Métricas sin datos personales** | Talleres realizados · kits entregados · encuesta anónima en papel antes y después (3 preguntas) · nodos nuevos caracterizados |
| **Ventaja** | Datos abiertos de NASA + método replicable + identidad local + diseño para quien menos acceso tiene |

**No se inventan** precios, ingresos, usuarios ni convenios. En el pitch se dice: *"los precios y acuerdos se validan con instituciones después del hackathon"*.

**Encaje con La Araucana (objetivos oficiales):**
| Objetivo | Cómo lo cumple |
|---|---|
| Democratizar el acceso a ciencia de frontera | Datos de NASA para quien no usa tecnología, también en papel |
| Competencias STEAM y empleabilidad | Personas guías formadas en la región; los tres niveles de aprendizaje |
| Soluciones con aplicación local | Atacama y Antofagasta como protagonistas |
| Red interregional de innovación | Cada sede o comunidad suma su "nodo" y sus tarjetas |

---

## 5. Cómo se cuenta en cada pitch

| | Local (3 min, formato Nómada) | Global (página en inglés + video de 30 s) |
|---|---|---|
| Problema (20 %) | La ciencia espacial está en internet, pero no para todos | Space data is open, but not accessible to people with low digital literacy |
| Solución (30 %) | Tierra, Luna y Marte en tu mano, con voz, en papel y en 3 idiomas | Earth, Moon and Mars compared with NASA data, one dimension at a time |
| Prototipo (20 %) | Demo en vivo en un celular + una tarjeta de papel en la mano | Captura del nivel 3 con fuentes y el histograma Atacama vs. Jezero |
| Modelo (20 %) | Gratis para quien aprende; servicios para instituciones | — (no se evalúa) |
| Comunicación (10 %) | La mochila de 10 kg que pesa 3,8 kg en Marte | Same analogy, with subtitles |

---

## 6. Pedidos listos para los agentes

1. *"Crea `src/data/worlds.json` con los valores de la §2 (Tierra, Luna, Marte), cada uno con `value`, `unit`, `source_url` y `verified_at`. Agrega un test que falle si un valor no tiene fuente."*
2. *"Con prototype, crea la pantalla 'Tres mundos' mobile-first: tres botones grandes (Tierra, Luna, Marte), una idea por pantalla, botón Escuchar con speechSynthesis, botón Siguiente, selector de nivel 1-2-3 e idiomas es/en/zh con react-i18next."*
3. *"Genera una versión imprimible (CSS de impresión) de las mismas tarjetas, en tamaño carta, en blanco y negro legible."*
4. *"Revisa con better-accessibility y webapp-testing en 375×812: botones ≥ 48 px, contraste AA, todo usable solo con toques y con lector de pantalla."*

---

## Fuentes
- NASA NSSDCA. *Planetary Fact Sheet* (métrico y razón respecto de la Tierra), *Moon Fact Sheet* y *Mars Fact Sheet*. https://nssdc.gsfc.nasa.gov/planetary/factsheet/ (consultado el 14-nov-2026).
- Hassler, D. M. et al. (2014). *Mars' Surface Radiation Environment Measured with the Mars Science Laboratory's Curiosity Rover.* *Science*, 343(6169).
- ISO 24495-1:2023. *Plain language — Part 1: Governing principles and guidelines.*
- W3C. *Web Content Accessibility Guidelines (WCAG) 2.2* y *Making Content Usable for People with Cognitive and Learning Disabilities.*
- Caja La Araucana: objetivos de Space Apps ([Pacto Global Chile · Conecta](https://conecta.pactoglobal.cl/casos-de-empresas/nasa-space-apps-challenge-chile-ciencia-innovacion-y-colaboracion-global-desde-el-territorio/)) y plan de sucursales inclusivas (titular publicado en laaraucana.cl, citado en la misma página).
