# 02.9 · Ingeniería de Datos Multi-Agencia: APIs y Recursos Abiertos Globales para Construir la Solución

> **Rol activo:** *Principal Planetary Data Systems Engineer (NASA PDS4 + USGS Astrogeology Cloud + ESA PSA + ISRO ISSDC + JAXA DARTS + CNSA CLEP)*.
> **Propósito:** Guía accionable de **qué APIs, catálogos STAC, servicios OGC WMTS y archivos abiertos existen hoy en EE.UU., Europa, China, Japón, Rusia, India, Corea, EAU y Chile**, y **cómo conectar cada uno sin fricción** para construir nuestra herramienta durante las 48 horas del hackathon.

---

## 1. Mapa Mundial de Infraestructura Abierta por Agencia Espacial

### 1.1 Estados Unidos (NASA + USGS Astrogeology + NSF PGC)
| Recurso / API Abierta | Endpoint / Portal Oficial | Protocolo Técnico | Qué Dato Exacto Extraemos para el Desafío |
|---|---|---|---|
| **USGS Astrogeology Analysis Ready Data (ARD) STAC API** | `https://stac.astrogeology.usgs.gov/api` | **STAC REST + Cloud-Optimized GeoTIFF (COG)** (`pystac-client` + `rioxarray` por HTTP range requests sin bajar el archivo entero!) | Modelos digitales de elevación (DTMs) y ortomosaicos listos para análisis de **Luna (`LOLA`, `LROC NAC`)** y **Marte (`HiRISE`, `CTX`, `MOLA`, `HRSC`)**. |
| **NASA Solar System Treks (Moon Trek & Mars Trek)** | `https://trek.nasa.gov/tiles/apidoc/trekAPI.html` | **OGC WMTS RESTful** (`{TileMatrix}/{TileRow}/{TileCol}`) | Streaming directo de capas de **LRO Diviner** (temperatura bolométrica y abundancia de rocas), **LOLA Slope/Roughness**, **PSRs**, **MOLA**, **THEMIS Thermal Inertia** y **CRISM minerales** directo a `MapLibre GL` o `CesiumJS`. |
| **NASA PDS Registry API (PDS4)** | `https://pds.nasa.gov/api/search/1/` (`github.com/NASA-PDS/registry-api`) | **OpenAPI 3.0 REST JSON** | Búsqueda programática por coordenadas, instrumento y misión sobre todos los nodos del *Planetary Data System*. |
| **PDS Geosciences Node — Orbital Data Explorer (ODE)** | `https://ode.rsl.wustl.edu` (con **ODE REST API** XML/JSON) | **REST API + Descarga directa GeoTIFF/PDS4** | Mapas polares sur de **LOLA ($5\text{ m/px}$)** en las 9 regiones *Artemis III* y cubos minerales **CRISM** en *Jezero / Oxia Planum*. |
| **NASA SWIM (*Subsurface Water Ice Mapping*)** | `https://swim.psi.edu/data/` | **GeoTIFF directo (CRS marciano IAU2015)** | Consistencia de hielo enterrado marciano ($C_i \in [-1, +1]$) entre $0\text{–}5\text{ m}$ de profundidad para cruzar contra glaciares rocosos y permafrost terrestre. |
| **USGS Unified Geologic Maps (Moon & Mars)** | `https://astrogeology.usgs.gov` (Fortezzo 2020 Luna; Tanaka 2014 Marte) | **GeoPackage / Shapefile / GeoTIFF** | Unidades crono-litológicas oficiales (*Tierras Altas Anortosíticas* vs. *Mare Basáltico*; *Noéico / Hespérico / Amazónico*). |
| **NASA Earthdata Cloud + Google Earth Engine** | `earthaccess` (Python) + GEE (`earthengine-api`) | **STAC + Cloud Compute** | `MODIS LST`, `MOD10A2 Snow`, `NASADEM`, `ASTER GED`, `HLS`, `ArcticDEM 2m` y `REMA Antártida 2m/8m`. |

---

### 1.2 Europa (ESA + ECMWF Copernicus + LMD Francia + Europlanet)
| Recurso / API Abierta | Endpoint / Portal Oficial | Protocolo Técnico | Qué Dato Exacto Extraemos para el Desafío |
|---|---|---|---|
| **ESA Planetary Science Archive (PSA)** | `https://psa.esa.int` | **PDAP + EPN-TAP (Table Access Protocol / ADQL SQL)** consultable vía `pyvo` en Python! | Datos de **Mars Express (`HRSC` DTMs estéreo $12.5\text{–}50\text{ m}$, `OMEGA` minerales hidratados, `MARSIS` radar subsuperficial)**, **ExoMars TGO (`CaSSIS` color estéreo, `FREND` hidrógeno/hielo epitérmico)** y **SMART-1** lunar. |
| **Mars Climate Database (MCD v6.1 — ESA/CNRS LMD)** | `https://www-mars.lmd.jussieu.fr` | **Interfaz Web + Datos NetCDF / Tablas CSV por sitio** | Ciclos diarios y estacionales exactos de **temperatura superficial, presión ($\text{Pa}$), viento, polvo y flujo UV marciano** en cualquier coordenada objetivo para normalizar el vector $\mathbf{y}$ de cada *Exploration Zone*. |
| **Copernicus Data Space Ecosystem & GEE** | `dataspace.copernicus.eu` / GEE | **STAC / OpenEO / GEE Assets** | `COPERNICUS/DEM/GLO30` (el mejor DEM global libre uniforme a $30\text{ m}$), `ESA/WorldCover/v200` (máscara de roca/suelo desnudo `clase 60`), `Sentinel-1 SAR` (rugosidad a escala centimétrica) y `Sentinel-2` (óxidos de Fe y arcillas). |
| **ESA CCI Permafrost v3/v4** | `catalogue.ceda.ac.uk` / PANGAEA | **NetCDF / GeoTIFF anual ($1\text{ km}$)** | Temperatura del suelo a $0, 2, 5, 10\text{ m}$ y fracción continua de permafrost (*PFR*) en todo el hemisferio norte y alta montaña. |
| **Europlanet Distributed Planetary Simulation Facility / Catalogue** | `europlanet-society.org` | **Fichas técnicas abiertas** | Sitios europeos y africanos validados (*Río Tinto, Danakil/Dallol, Ibn Battuta/Marruecos, Makgadikgadi, Svalbard*) para nuestro conjunto de control (*back-testing*). |

---

### 1.3 Japón (JAXA / ISAS)
| Recurso / API Abierta | Endpoint / Portal Oficial | Protocolo Técnico | Qué Dato Exacto Extraemos para el Desafío |
|---|---|---|---|
| **JAXA DARTS (*Data ARchives and Transmission System*) — SELENE (Kaguya)** | `https://darts.isas.jaxa.jp/planet/pdap/selene/` | **HTTP / PDAP / GeoTIFF / PDS** | **¡Diferenciador científico clave!** Los mapas globales del **Multiband Imager (MI)** y **Spectral Profiler (SP)** de *Kaguya* entregan **abundancia cuantitativa de plagioclasa (anortositapura $\text{An}>90$), clinopiroxeno, ortopiroxeno, olivino y $\text{FeO}$** en la Luna, más el modelo topográfico fusionado **`SLDEM2015`** (*Kaguya TC + LRO LOLA*). |
| **JAXA SLIM (*Smart Lander for Investigating Moon*)** | `darts.isas.jaxa.jp` (Cráter *Shioli*) | **PDS4 / Imágenes multibanda MBC** | Espectroscopía in situ de rocas con olivino del manto/tierras altas en pendiente pronunciada ($\sim 15^\circ$). |
| **JAXA ALOS World 3D (`AW3D30`)** | `JAXA/ALOS/AW3D30/V3_2` (GEE / JAXA EORC) | **Cloud Asset / GeoTIFF $30\text{ m}$** | Validación cruzada de pendientes abruptas en cráteres, yardangs y volcanes terrestres donde SRTM presenta vacíos de radar. |

---

### 1.4 China (CNSA / NAOC / Academia China de Ciencias)
| Recurso / API Abierta | Endpoint / Portal Oficial | Protocolo Técnico | Qué Dato Exacto Extraemos para el Desafío |
|---|---|---|---|
| **China Lunar and Planetary Data Release System (CLEP / NAOC)** | `https://moon.bao.ac.cn` (interfaz bilingüe Chino/Inglés, registro académico libre) + espejos suplementarios en Zenodo/Figshare de papers *Nature/Science* | **PDS4-compatible (`.2B`, `.2C`, `.xml`) legible con `pdr`** | 1. **Chang'e-2:** DOM y DEM global lunar a **$7\text{ m/px}$**.<br>2. **Chang'e-4 (*Yutu-2*, Cráter Von Kármán — Cuenca SPA):** perfiles de radar de penetración terrestre (**LPR** a $60\text{ MHz}$ y $500\text{ MHz}$) que revelan espesor real de regolito y capas de eyección del Polo Sur–Aitken.<br>3. **Chang'e-5 & Chang'e-6:** mineralogía in situ LMS y propiedades geotécnicas del lado cercano y oculto.<br>4. **Tianwen-1 & Rover Zhurong (*Utopia Planitia*):** radar subsuperficial **RoPeR** (capas poligonales enterradas y ausencia de agua líquida superficial en $0\text{–}80\text{ m}$) + cámara multiespectral **MSCam**. |
| **National Tibetan Plateau Data Center (TPDC)** | `https://data.tpdc.ac.cn/en/` | **Descarga abierta GeoTIFF / NetCDF / Shapefile** | Mapas de alta resolución de permafrost, salares de sulfatos en **Qaidam (Dalangtan)**, yardangs de **Lenghu** y desierto frío de **Ngari (Tíbet)**. |

---

### 1.5 India (ISRO / ISSDC / PRL)
| Recurso / API Abierta | Endpoint / Portal Oficial | Protocolo Técnico | Qué Dato Exacto Extraemos para el Desafío |
|---|---|---|---|
| **ISRO PRADAN (*Policy Based Data Retrieval, Analytics, Dissemination And Notification*)** | `https://pradan.issdc.gov.in` (registro libre inmediato) | **PDS4 estándar (`.xml` + `.img`/`.tif`)** | 1. **Chandrayaan-2 `DFSAR` (Dual-Frequency Synthetic Aperture Radar, bandas L $1.25\text{ GHz}$ y S $2.5\text{ GHz}$):** polarimetría completa dentro de los cráteres **PSRs del Polo Sur Lunar** para separar **hielo de agua limpio vs. bordes rocosos frescos** (resuelve la ambigüedad de radares de una sola banda!).<br>2. **Chandrayaan-2 `IIRS` ($0.8\text{–}5.0\,\mu\text{m}$):** absorción real de $\text{OH}/\text{H}_2\text{O}$ a $3.0\,\mu\text{m}$ sin saturación térmica.<br>3. **Chandrayaan-3 `ChaSTE` & `APXS` (*Shiv Shakti Point*, $69.37^\circ\text{S}$):** gradiente térmico real de los primeros $10\text{ cm}$ de regolito polar sur ($\Delta T \approx 60\text{ K}$ en milímetros!) y química elemental de tierras altas. |
| **ISRO Bhuvan Open Data Archive** | `https://bhuvan.nrsc.gov.in` | **WMS / Descarga abierta** | Geomorfología y DEM Cartosat de **Ladakh (*Tso Kar / Puga*)**, **Matanomadh (jarosita)** y **Cráter Lonar**. |

---

### 1.6 Rusia (IKI RAS / GEOKHI RAS / Roscosmos)
| Recurso / API Abierta | Endpoint / Portal Oficial | Protocolo Técnico | Qué Dato Exacto Extraemos para el Desafío |
|---|---|---|---|
| **ExoMars TGO `FREND` & LRO `LEND` (Desarrollados por IKI RAS, Moscú)** | Hospedados abiertamente en **ESA PSA (`psa.esa.int`)** y **NASA PDS (`ode.rsl.wustl.edu`)** | **PDS3 / PDS4 GeoTIFF / Tablas** | **¡Puente científico ruso-occidental clave!** Los detectores colimados de neutrones epitérmicos **LEND** (en LRO, Luna) y **FREND** (en ExoMars TGO, Marte), creados por Igor Mitrofanov e IKI RAS, proveen los **mapas globales abiertos de equivalente en peso de agua ($\text{WEH}\%$) en el primer metro del subsuelo** tanto en el Polo Sur Lunar (*Cabeus, Shoemaker, Shackleton*) como en Marte (*Valles Marineris, Arcadia, Phlegra*)! |
| **Repositorios Científicos Abiertos Rusos (*CyberLeninka, GeoKniga, IVS FEB RAS*)** | `cyberleninka.ru` · `ivs.dvo.ru` | **Acceso abierto sin paywall (PDF/Tablas)** | Parámetros físico-mecánicos (densidad aparente, ángulo de fricción interna, cohesión, granulometría) de los escoriales de **Tolbachik (Kamchatka)** usados para calibrar el tren de rodaje de *Lunokhod 1/2*, más perfiles criogénicos de **Yakutia (*Batagaika*)** y el cráter ártico **Popigai**. |

---

### 1.7 Corea del Sur (KARI), EAU (MBRSC) y Chile (Infraestructura Pública Nacional)
| Agencia / País | Recurso Abierto | Endpoint Oficial | Valor Directo en la Arquitectura |
|---|---|---|---|
| **KARI (Corea) + ASU/NASA** | **Danuri (KPLO) `ShadowCam`** | `https://shadowcam.ser.asu.edu` / PDS | Imágenes $200\times$ más sensibles que LROC NAC que revelan **bloques, deslaves y trazas de rocas rodantes dentro de la oscuridad perpetua** de *Shackleton* y *Faustini*. |
| **MBRSC (Emiratos Árabes)** | **Emirates Mars Mission (`Hope`)** | `https://sdc.emiratesmarsmission.ae` | Ciclos diurnos completos de polvo y temperatura (`EMIRS`) sobre toda la esfera marciana. |
| **Chile — MinEnergía / U. de Chile** | **API Explorador Solar & Eólico** | `https://solar.minenergia.cl` / `api.minenergia.cl` | Series horarias abiertas ($1\text{ km}$) de **irradiancia directa/difusa, UV, nubosidad y temperatura** para caracterizar Atacama, Gorbea, Monturaqui y Ojos del Salado. |
| **Chile — DGA (MOP)** | **Inventario Público de Glaciares (IPG2022)** | `https://dga.mop.gob.cl` / IDE Chile | **$>26{,}000$ polígonos abiertos** con clasificación explícita de **Glaciares Rocosos** (altitud, pendiente, orientación, superficie detrítica) para cruzar con Marte `SWIM`. |
| **Chile — IDE Chile / SERNAGEOMIN / CR2 / INACH** | **Geoportal & Explorador Climático** | `geoportal.cl` · `explorador.cr2.cl` · `inach.cl` | Litología nacional, fallas/volcanes/cuevas, series pluviométricas hiperáridas ($<1\text{ mm/año}$) y metadatos polares de **Glaciar Unión ($79.77^\circ\text{S}$)**. |

---

## 2. Receta de Integración Rápida para el Hackathon (Cómo Unir Todo en $<6$ Horas)

Para no ahogar al equipo en formatos incompatibles durante las 48 horas, la regla de oro de ingeniería es **estandarizar todo a un Vector Físico Común de 12 variables ($\mathbf{x}$ en Tierra, $\mathbf{y}$ en Luna/Marte) antes del sábado a las 16:00**:

1. **Sitios Objetivo en Luna y Marte ($\mathbf{y}_m$, solo 20–25 polígonos diana):**
   - Extraer estadísticas zonales una sola vez vía `stac.astrogeology.usgs.gov/api` + `JAXA Kaguya MI` + `ISRO ChaSTE/DFSAR` + `NASA SWIM` + `IKI LEND/FREND` y guardarlas en un archivo limpio `targets_moon_mars.json` ($<100\text{ KB}$).
2. ** Búsqueda Global Terrestre ($\mathbf{x}_i$, millones de celdas):**
   - Ejecutar un único script en **Google Earth Engine** que combine `GLO-30` + `WorldCover (bare rock)` + `MODIS LST` + `MOD10A2 Snow` + `ERA5` + `GLiM` + `Sentinel-1 SAR` + `AlphaEarth Embeddings`, enriquecido regionalmente con los polígonos abiertos **DGA IPG2022 (Chile)**, **IANIGLA (Argentina)** y **ESA CCI Permafrost**.
3. **Visualización en Tiempo Real sin Servidor Costoso:**
   - Servir nuestras capas descubiertas como archivo estático **`PMTiles`** en Cloudflare/GitHub Pages y superponer en el navegador las teselas planetarias oficiales de **NASA Moon Trek / Mars Trek WMTS** para que el jurado compare cara a cara cada cráter/ladera lunar o marciana con su gemelo terrestre descubierto.
