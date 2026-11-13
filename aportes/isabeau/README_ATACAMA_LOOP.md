# ATACAMA LOOP 🚀
**README para el programador | NASA Space Apps Challenge Antofagasta 2026**

## 1. ¿Qué es y para qué sirve?
**ATACAMA LOOP** es una plataforma web científica y educativa que compara una zona de **Marte** (inicialmente el cráter **Jezero**) con sectores de **Atacama**, usando datos espaciales abiertos de NASA y USGS.

**Problema:** dos paisajes pueden parecerse en una foto y ser muy diferentes en sus propiedades. Queremos identificar **qué características del relieve son comparables, cuáles no y para qué ensayo preliminar de exploración robótica podría interesar cada lugar**.

**Idea central:** *Comparar con evidencia → aprender con los resultados → planificar un ensayo*. Es una herramienta de **preselección**, no un sistema que certifique lugares o rutas seguras para rovers.

**Estado:** MVP **por construir y validar**. No tenemos todavía resultados calculados ni pruebas de impacto educativo; los diseños de las pantallas son ilustrativos.

## 2. Tres funciones, cinco pantallas

| Función | Pantalla | Lo que debe mostrar o permitir |
|---|---|---|
| **P1: Comparar** (núcleo científico) | **1. Comparar terrenos** | Selector Jezero–Atacama, mapas lado a lado, histogramas de pendientes, perfiles/relieve local, indicadores calculados, fuentes, escala y limitaciones. |
| **P1: Comparar** | **2. Atlas de candidatos** | Hasta tres sectores terrestres en un mapa, cada uno con ficha, ubicación comprobada, características y utilidad **potencial** para un ensayo. |
| **P9: Aprender** (educación y accesibilidad) | **3. Aprender** | Micro-reto «¿Dónde probarías un rover?»: el estudiante elige un terreno usando **datos del análisis** y recibe retroalimentación científica. |
| **P5: Planificar** (versión sencilla) | **4. Planificar ensayo** | Objetivo, terreno candidato, equipos necesarios, opciones de préstamo/reutilización, condiciones de acceso, costos por cotizar y riesgos. |
| **Transparencia** | **5. Evidencia científica** | Referencias NASA/USGS, archivos usados, resoluciones, método, fecha de procesamiento, incertidumbres y código disponible. |

**Para ahorrar desarrollo:** Atlas y Evidencia pueden ser pestañas dentro de **Comparar**. Así el MVP mantiene **tres funciones principales**, sin crear cinco módulos complejos.

**Recorrido mínimo de la demo:** escoger Jezero y un sector terrestre → visualizar **una comparación realmente calculada** → explicar semejanzas y límites → resolver el micro-reto → mostrar la ficha del ensayo y las fuentes.

## 3. Tecnologías y funcionamiento

| Tecnología | Responsabilidad |
|---|---|
| **React + Vite + TypeScript** | Pantallas, navegación y ejercicio educativo. |
| **Python + NumPy + Rasterio** | Procesar DEM (elevación), calcular pendientes, relieve y estadísticas. |
| **QGIS** | Revisar coordenadas, cobertura y calidad del terreno. |
| **MapLibre GL JS** | Mapa interactivo de **lugares terrestres**; Marte puede tener un visor raster separado. |
| **Plotly.js** | Histogramas y perfiles topográficos. |
| **JSON / GeoJSON + GitHub + Vercel** | Resultados, sectores, documentación y publicación. |

**Flujo:** `NASADEM + CTX DEM Jezero → Python/QGIS → JSON, GeoJSON y mapas preparados → React/MapLibre/Plotly`.

**Clave:** el procesamiento de los modelos de elevación será **previo a la presentación**, no en un servidor Python en tiempo real. La aplicación muestra archivos estáticos para evitar fallos. **No necesitamos IA ni mundos 3D** para esta primera versión.

## 4. Ciencia que debemos demostrar

- **Tierra:** NASADEM, espaciamiento de **1 segundo de arco** (aprox. 30 m en dirección norte-sur, según latitud).
- **Marte:** **USGS CTX DEM Jezero de 20 m/píxel**. No confundir con la resolución de las fotografías de CTX.
- **Método:** delimitar zonas de extensión física comparable; verificar proyecciones, unidades y datos faltantes; armonizar escalas efectivas; calcular **pendientes y relieve local**; comparar distribuciones y explicar incertidumbres.
- **Lugares preliminares:** estudiar **Yungay** y **Cordillera de la Sal**, más un terreno de contraste si es posible. **Monturaqui** es opcional: su cráter (~350 m) tiene detalles que NASADEM no resuelve bien.
- **Mínimo suficiente:** **una comparación Tierra–Marte real, reproducible y con limitaciones visibles**. Tres candidatos son un objetivo adicional.

**Nunca inventar** porcentajes de semejanza, resultados de aprendizaje, ahorro de carbono, empleos, permisos o alianzas. No usar una pendiente de 15° como regla universal de seguridad para rovers. La Tierra no reproduce la gravedad, atmósfera ni radiación marcianas.

## 5. Conexión con NASA, Caja La Araucana y ODS

**NASA Space Apps:** el proyecto identifica y caracteriza **análogos terrestres con datos abiertos**, explica sus semejanzas y diferencias y propone un uso para la exploración. La comparación científica es la prueba principal.

**Caja La Araucana:** la iniciativa declara objetivos de **acceso a ciencia, competencias STEAM, soluciones locales y redes regionales**. ATACAMA LOOP responde con una plataforma comprensible, un ejercicio para jóvenes y un caso centrado en Antofagasta. Es una **alineación fundamentada**, no garantía de obtener una puntuación o un premio.

| Impacto propuesto | Evidencia que se debe conseguir |
|---|---|
| **ODS 4: Educación** | Micro-reto implementado y respuestas de estudiantes. |
| **ODS 9: Innovación** | Método reproducible, código y demo funcional. |
| **Desarrollo regional** | Retroalimentación documentada de usuarios locales. |
| **Economía circular (ODS 12, potencial)** | Inventario o plan de préstamo/reutilización, sin ahorros inventados. |

## 6. Prioridades para el equipo de cuatro

1. **Estudiante informático + apoyo técnico:** procesar NASADEM y Jezero; entregar estadísticas y gráficos reales.
2. **Programador:** desarrollar la pantalla Comparar en React, integrar los archivos y publicar en Vercel.
3. **Estudiante ingeniería civil + mentor especializado:** revisar la lógica del ensayo, escala y límites de los cálculos.
4. **Coordinación / información y control de gestión:** micro-reto, accesibilidad, fichas, fuentes, validación y pitch.

**Principales riesgos:** no descargar/procesar DEM; comparar resoluciones incompatibles; perder tiempo en animaciones sin evidencia. Si se atrasan, **reducir el alcance**, nunca inventar datos.

**Estética aprobada:** interfaz espacial estilo **capas de papel**, azul oscuro/celeste y naranja Atacama. Navegación clara: `Comparar · Atlas · Aprender · Planificar · Evidencia`. Priorizar legibilidad y accesibilidad por encima de los efectos visuales.

## 7. Referencias oficiales

- [Desafío NASA 2026](https://www.spaceappschallenge.org/2026/challenges/permanent-moon-base-locations-and-mars/)
- [NASADEM — NASA Earthdata](https://search.earthdata.nasa.gov/search?q=NASADEM)
- [CTX DEM Jezero — USGS (20 m/píxel)](https://astrogeology.usgs.gov/search/map/mars_2020_science_investigation_ctx_dem_mosaic)
- [Objetivos Space Apps de Caja La Araucana](https://conecta.pactoglobal.cl/whq_objetivo/educacion-de-calidad/)

**Mensaje para el jurado:** *«ATACAMA LOOP no dice que Atacama sea Marte. Demuestra qué aspectos de ciertos terrenos pueden compararse mediante datos y convierte esa evidencia en aprendizaje y planificación de futuros ensayos».*
