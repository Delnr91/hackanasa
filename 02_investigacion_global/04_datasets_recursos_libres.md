# 02.4 · Catálogo Maestro de Datasets Abiertos, APIs y Bibliotecas Libres Globales

> **Rol activo:** *Chief Data Architect (NASA Earthdata Cloud + Planetary Data System + ESA Copernicus)*.
> **Garantía de elegibilidad Space Apps:** 100 % datos abiertos, gratuitos y bibliotecas de código abierto (*MIT / BSD / Apache-2.0 / GPL*).

---

## 1. Capas de Observación de la Tierra (Con IDs Exactos en Google Earth Engine / Cloud)

Para procesar todo el planeta en minutos durante las 48 h sin bajar terabytes al disco local, listamos los **Asset IDs exactos**:

| Dimensión Física | Dataset / Sensor | Resolución | ID en Google Earth Engine (GEE) o Fuente Directa | Licencia / Agencia |
|---|---|---|---|---|
| **Topografía Global** | Copernicus DEM GLO-30 / GLO-90 | $30\text{ m}$ / $90\text{ m}$ | `COPERNICUS/DEM/GLO30` · `COPERNICUS/DEM/GLO90` | Abierta — ESA / Airbus |
| **Topografía Polar Ártica** | ArcticDEM Mosaic (PGC) | $2\text{ m}$ / $32\text{ m}$ | `UMN/PGC/ArcticDEM/V4/2m_mosaic` | Abierta — NSF / NGA |
| **Topografía Antártica** | REMA (*Reference Elevation Model of Antarctica*) | $2\text{ m}$ / $8\text{ m}$ / $32\text{ m}$ | `UMN/PGC/REMA/V1_1/8m` | Abierta — NSF / PGC |
| **Topografía NASA clásica** | NASADEM / SRTM Plus | $30\text{ m}$ | `NASA/NASADEM_HGT/001` | Dominio Público — NASA JPL |
| **Topografía Japón** | ALOS World 3D (AW3D30) | $30\text{ m}$ | `JAXA/ALOS/AW3D30/V3_2` | Abierta — JAXA |
| **Temperatura Superficial (LST)** | MODIS Terra & Aqua LST (Día y Noche) | $1\text{ km}$, cada 8 días | `MODIS/061/MOD11A2` · `MODIS/061/MYD11A2` | Dominio Público — NASA LP DAAC |
| **Clima, Viento, Nieve y Suelo** | ERA5-Land Reanalysis | $\sim 9\text{ km}$, horario/mensual | `ECMWF/ERA5_LAND/MONTHLY_AGGR` · `ECMWF/ERA5_LAND/DAILY_AGGR` | Abierta — Copernicus / ECMWF |
| **Cobertura de Nieve Estacional** | MODIS Snow Cover | $500\text{ m}$, 8 días | `MODIS/061/MOD10A2` | Dominio Público — NASA NSIDC |
| **Índice de Aridez Global** | Global Aridity Index & PET v3 | $\sim 1\text{ km}$ ($30\text{ arcsec}$) | `projects/sat-io/open-datasets/global_ai/global_ai_yearly` / Figshare CGIAR-CSI | CC-BY 4.0 — CGIAR / Zomer et al. |
| **Esterilidad / Suelo Desnudo** | ESA WorldCover 10m v200 (clase `60: Bare / sparse vegetation`) | $10\text{ m}$ | `ESA/WorldCover/v200` | CC-BY 4.0 — ESA |
| ** reflectancia / Minerales Ópticos** | Harmonized Landsat Sentinel-2 (HLS) / Sentinel-2 SR | $10\text{–}30\text{ m}$ | `COPERNICUS/S2_SR_HARMONIZED` · `LANDSAT/LC09/C02/T1_L2` | Abierta — NASA / USGS / ESA |
| **Emisividad Térmica / Sílice** | ASTER Global Emissivity Dataset (GED) | $100\text{ m}$ | `NASA/ASTER_GED/AG100_003` | Dominio Público — NASA JPL |
| **Mapa Litológico Global** | GLiM (*Global Lithological Map*) | Vectorial global | PANGAEA (`doi:10.1594/PANGAEA.788537`) / Community Catalog GEE | Abierta académica — Hartmann & Moosdorf |
| **Permafrost Global** | ESA CCI Permafrost (Fracción PFR y Temperatura a $0\text{–}10\text{ m}$) | $1\text{ km}$ | CEDA Archive / PANGAEA (`ESA Climate Change Initiative Permafrost`) | CC-BY 4.0 — ESA / AWI |
| **Glaciares y Glaciares de Roca** | Randolph Glacier Inventory (RGI 7.0) + **DGA IPG2022 (Chile, $>26{,}000$ glaciares)** + **IANIGLA (Argentina)** | Polígonos detallados | `glims.org/RGI` · `dga.mop.gob.cl` / IDE Chile · `glaciaresargentinos.gob.ar` (separan hielo descubierto vs. **glaciar rocoso / de escombros**!) | Datos Públicos Abiertos |
| **Solar / UV de Alta Resolución (Chile)** | **Explorador Solar MinEnergía / U. de Chile** | $1\text{ km}$, serie horaria | `solar.minenergia.cl` / `api.minenergia.cl` + `explorador.cr2.cl` + SERNAGEOMIN / INACH | Datos Públicos Abiertos (Chile) |
| **Radiación UV / Ozono** | Sentinel-5P TROPOMI / Aura OMI | $\sim 5\text{–}13\text{ km}$ | `COPERNICUS/S5P/OFFL/L3_O3` + altitud DEM | Abierta — ESA / NASA |
| **Rugosidad Radar (SAR)** | Sentinel-1 C-band GRD (polarización VV/VH sensible a bloques y humedad) | $10\text{ m}$ | `COPERNICUS/S1_GRD` | Abierta — ESA |
| **Embeddings IA Pre-calculados** | AlphaEarth Foundations (*Google Satellite Embedding V1*) | $10\text{ m}$ ($64$ dim.) | `GOOGLE/SATELLITE_EMBEDDING/V1/ANNUAL` / Source Cooperative | Abierta — Google DeepMind / EO |
| **Accesibilidad Logística** | Tiempo de viaje a ciudades / puertos | $1\text{ km}$ | `Oxford/MAP/accessibility_to_cities_2015_v1_0` | CC-BY 4.0 — Weiss et al. |
| **Áreas Protegidas** | World Database on Protected Areas (WDPA) | Polígonos | `WCMC/WDPA/current/polygons` | Uso no comercial — UNEP-WCMC |
| **Cráteres e Impactos** | PASSC Earth Impact Database + Global Volcanism Program | Puntos verificados | `passc.net/EarthImpactDatabase` · `volcano.si.edu` | Abierta — UNB / Smithsonian |

---

## 2. Conjuntos de Datos Planetarios Abiertos (Luna y Marte — Multi-Agencia)

### 2.1 Portales y APIs de NASA y USGS
- **NASA Solar System Treks (`trek.nasa.gov` — Moon Trek & Mars Trek):**
  - Exponen cientos de mosaicos co-registrados mediante protocolo estándar **OGC RESTful WMTS** (`GetCapabilities` XML), consumibles directamente desde **QGIS, MapLibre GL, Leaflet o CesiumJS** sin servidor propio.
- **NASA PDS Geosciences Node — Orbital Data Explorer (`ode.rsl.wustl.edu`):**
  - **Luna (LRO):** Altímetro láser **LOLA** (DEM polar $5\text{ m/px}$, pendiente, rugosidad, mapas de fracción de iluminación media y máscara de PSRs), radiómetro **Diviner** (temperatura bolométrica mín/máx/media y abundancia de rocas en `diviner.ucla.edu`), cámaras **LROC NAC/WAC** (`quickmap.lroc.asu.edu`) y radar **Mini-RF**.
  - **Marte:** Altímetro **MOLA** ($463\text{ m/px}$), cámara térmica **THEMIS** (inercia térmica global de $100\text{ m/px}$), espectrómetro **CRISM** (mapas de índices minerales de arcillas, sulfatos, carbonatos y olivino), **CTX Global Mosaic** ($5\text{ m/px}$ del *Bruce Murray Lab*, Caltech) y DEMs estéreo **HiRISE** ($1\text{ m/px}$).
- **Proyecto SWIM (*Subsurface Water Ice Mapping* — `swim.psi.edu`):**
  - Rásters GeoTIFF listos para SIG con ecuación de consistencia de hielo subsuperficial en Marte ($0\text{–}1\text{ m}$, $1\text{–}5\text{ m}$ y $>5\text{ m}$) integrando radar SHARAD, neutrones MONS, térmica TES/THEMIS y geomorfología.
- **USGS Astrogeology Science Center (`astrogeology.usgs.gov` / STAC API):**
  - Mapas geológicos unificados globales de la Luna (Fortezzo et al., 2020) y de Marte (Tanaka et al., 2014) descargables en Shapefile/GeoPackage!

### 2.2 Archivos Planetarios Abiertos Internacionales (Europa, China, India, Japón, Corea, EAU)
| Agencia | Portal Oficial | Joyas de Datos Abiertos Relevantes |
|---|---|---|
| **ESA + LMD (Francia)** | **PSA (`psa.esa.int`)** & **Mars Climate Database (`www-mars.lmd.jussieu.fr`)** | DEMs color y estéreo **HRSC** (*Mars Express*), mineralogía **OMEGA**, radar **MARSIS**, y el simulador climático **MCD v6.1** (temperatura superficial, presión, flujo UV y polvo en cualquier lat/lon marciana). |
| **CNSA / NAOC (China)** | **Lunar & Planetary Data Release System (`moon.bao.ac.cn`)** | Ortofotos y DEM global de *Chang'e-2* ($7\text{ m}$), radar GPR de regolito de *Chang'e-3/4/5*, muestras del lado oculto (*Chang'e-6*) y radar/cámara de *Tianwen-1 / Zhurong* en Utopia Planitia. |
| **ISRO (India)** | **PRADAN — ISSDC (`pradan.issdc.gov.in`)** | Espectrómetro de hidratación **IIRS** y radar polarimétrico **DFSAR** (banda L+S capaz de penetrar metros en PSRs lunares!) de *Chandrayaan-2*, más perfil térmico in situ **ChaSTE** de *Chandrayaan-3*. |
| **JAXA (Japón)** | **DARTS (`darts.isas.jaxa.jp`)** | DEM global combinado *SELENE (Kaguya) + LOLA* (`SLDEM2015`, $\sim 59\text{ m}$) y mapas mineralógicos del *Multiband Imager* (abundancia global de plagioclasa/anortosita, piroxeno, olivino y FeO!). |
| **KARI (Corea) + NASA** | **KPDS / PDS ShadowCam** | Imágenes ópticas ultra-sensibles de **ShadowCam** a bordo de *Danuri (KPLO)* mostrando por primera vez el relieve y rocas **adentro** de las PSRs del Polo Sur Lunar. |
| **UAESA / MBRSC (EAU)** | **EMM Science Data Center (`sdc.emiratesmarsmission.ae`)** | Mapas globales de polvo, nubes de hielo y temperatura marciana de la sonda *Hope (Al-Amal)*. |

---

## 3. Arsenal de Bibliotecas Open-Source Listas para Usar en las 48 Horas

| Dominio | Paquetes / Bibliotecas Libres Recomendadas | Uso Específico en el Hackathon |
|---|---|---|
| **Geoespacial & Rásters** | `earthengine-api`, `geemap`, `xarray`, `rioxarray`, `rasterio`, `gdal`, `geopandas`, `shapely`, `pyproj`, `exactextract` | Procesamiento en la nube sin descargas masivas, reproyección polar estereográfica (`EPSG:3031` Antártida / `EPSG:3995` Ártico) y muestreo zonal. |
| **Datos Planetarios PDS** | `pdr` (*Planetary Data Reader*), `planetarypy`, `isis` / `gdal` (soporta proyecciones IAU2015 de Luna y Marte) | Lectura directa de etiquetas `.lbl` / `.xml` PDS3 y PDS4 en dos líneas de Python. |
| **Astrodinámica e Iluminación** | `skyfield`, `astropy`, `pvlib`, `spiceypy` (kernels NAIF SPICE de JPL) | Cálculo exacto de elevación/azimut solar en cualquier latitud terrestre y comparación contra efemérides lunares (`DE440` + `MOON_ME`). |
| **IA, Embeddings y Búsqueda** | `faiss-cpu`, `scikit-learn`, `umap-learn`, `torchgeo`, `huggingface_hub` (`ibm-nasa-geospatial/Prithvi-EO-2.0`, `made-with-clay/clay`) | Búsqueda instantánea de vecinos más cercanos por similitud coseno y clustering no supervisado de terrenos. |
| **Decisión Multicriterio y Optimización** | `scipy.optimize` (`milp`), `pulp`, `ortools`, `salib` (análisis de sensibilidad de Sobol/Monte Carlo) | Cálculo de pesos AHP, análisis de robustez de rankings y optimización exacta *Set Cover* del portafolio de campaña. |
| **Visualización Web 2D/3D Ganadora** | `MapLibre GL JS`, `CesiumJS` (soporta elipsoides de Tierra, Luna y Marte en 3D!), `deck.gl`, `PMTiles` (teselas estáticas sin servidor backend!), `Plotly` / `ECharts` | Globo dual interactivo 2D/3D (Luna/Marte a la izquierda ↔ Tierra a la derecha) alojado gratis en GitHub Pages / Cloudflare Pages / Vercel sin riesgo de caída de servidor. |

---

> 🔗 **Siguiente nivel de ingeniería:** Consulta [`09_apis_multiagencia_recursos_construccion.md`](09_apis_multiagencia_recursos_construccion.md) para ver los endpoints programáticos exactos (`STAC API`, `OGC WMTS`, `PDS4 Registry`, `ESA EPN-TAP`, `JAXA DARTS`, `CNSA CLEP`, `ISRO PRADAN`, `IKI LEND/FREND` y `APIs Chile`).
