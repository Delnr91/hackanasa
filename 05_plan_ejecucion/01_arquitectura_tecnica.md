# 05.1 · Arquitectura Técnica de Ingeniería de Sistemas (*TERRA·TWIN 4D*)

> **Rol activo:** *Principal Systems Architect (NASA JPL Operations Lab + MIT Computer Science)*.
> **Principio de diseño para Hackathon:** *"Cómputo pesado offline/cloud durante el Día 1; artefactos estáticos ultra-rápidos (`PMTiles` + `GeoJSON` + `WebGL`) en el navegador durante la evaluación de jueces"*. Cero servidores frágiles que se caigan cuando un juez global abra el link un martes a las 3 a. m.

---

## 1. Diagrama de Arquitectura End-to-End

```mermaid
flowchart TB
    subgraph L1["CAPA 1: FUENTES ABIERTAS MULTI-AGENCIA"]
        EO["Tierra (GEE / Open Data):<br/>Copernicus DEM, MODIS LST & Snow,<br/>ERA5-Land, CGIAR Aridity, WorldCover,<br/>GLiM + Anortositas, ESA CCI Permafrost,<br/>IANIGLA/RGI, AlphaEarth Embeddings, MAP Access"]
        MOON["Luna (NASA PDS / Moon Trek / ISRO / JAXA):<br/>LOLA DEM & Illumination, Diviner Temp,<br/>Kaguya MI Plagioclase, Mini-RF Pits"]
        MARS["Marte (NASA PDS / Mars Trek / ESA / CNSA):<br/>MOLA/HRSC DEM, SWIM Ice Probability,<br/>THEMIS TI, CRISM Minerals, MCD Climate"]
        GT["Catálogo Ground-Truth Multi-Idioma:<br/>35 Sitios Control + 23 Candidatos 💎 (Doc 02.3)"]
    end

    subgraph L2["CAPA 2: PIPELINE CIENTÍFICO (Ejecutado en las 48h)"]
        HARM["Armonizador Físico:<br/>Igualación de escala métrica, máscaras duras<br/>(océano/bosque/urbano) y π-scaling gravitacional"]
        SOLAR["Motor Astronómico Chrono-Luna:<br/>Geometría solar esférica 365 días × latitud<br/>+ cruce con ausencia de nieve MODIS"]
        PAFI["Motor PAFI + Brecha Irreducible:<br/>Similitud marginal por dimensión +<br/>pesos AHP por modo de ensayo"]
        VAL["Módulo de Auditoría Científica:<br/>Back-testing Percentil ≥95 en 35 sitios control<br/>+ Estabilidad Monte Carlo Dirichlet (1,000 runs)"]
        OPT["Optimizador MILP de Portafolio:<br/>Weighted Set Cover por presupuesto y misión"]
    end

    subgraph L3["CAPA 3: EMPAQUETADO SERVERLESS INDESTRUCTIBLE"]
        STATIC["Artefactos Estáticos Estándar:<br/>PMTiles + Terrain-RGB DEMs + GeoJSON enriquecido<br/>+ 3D Tiles / WMTS directo de NASA Moon/Mars Trek"]
        UI["Frontend Mundo Abierto 2D/3D (Single-Canvas Scissor):<br/>Tri-Pantalla Sincronizada (🌑 Luna · 🌍 Tierra · 🔴 Marte)<br/>Conmutable Horizontal (1×3) ↔ Vertical (3×1) ↔ Dual (1×2),<br/>Caminata Rover 1:1, Slider 365 días & Portafolio Carbon-Zero"]
    end

    EO --> HARM
    MOON --> HARM
    MARS --> HARM
    HARM --> PAFI
    SOLAR --> PAFI
    PAFI --> VAL
    GT --> VAL
    PAFI --> OPT
    VAL --> STATIC
    OPT --> STATIC
    STATIC --> UI
```

---

## 2. Especificación de las 8 Capas Operativas del Vector $\vec{x}(p)$

| Eje | Código | Rango / Unidades | Transformación de Normalización | Fuente Primaria |
|---|---|---|---|---|
| 1 | `topo_slope_tri` | Pendiente ($^\circ$) y TRI ($\text{m}$) | Diferencia absoluta a escala homologada ($\tau_{\text{slope}} = 5^\circ$) | `COPERNICUS/DEM/GLO30` / `GLO90` |
| 2 | `litho_affinity` | Afinidad $[0, 1]$ al arquetipo | Matriz petrológicaexperta (Anortosita $\to$ L1; Basalto $\to$ L3/M4; Evaporita/Sulfato $\to$ M3) | `GLiM` + complejos anortosíticos + `ASTER GED` |
| 3 | `thermal_regime` | $T_{\min}, T_{\text{mean}}, \Delta T_{\text{diurna}}$ ($\text{K}$) | Proyección a soporte terrestre $\tilde{r}_T$ + cálculo de $\Delta_T^{\text{irr}}$ ($\tau_T = 15\text{ K}$) | `MODIS/061/MOD11A2` + `ERA5_LAND` |
| 4 | `hyper_aridity` | $\text{AI} = P / \text{PET}$ (adimensional) | Transformación $\log_{10}(\text{AI} + 10^{-4})$ ($\text{AI} < 0.05$ hiperárido) | `CGIAR Global Aridity v3` |
| 5 | `bare_sterility` | Fracción desnuda $[0,1]$ y $\text{NDVI}$ | Penalización exponencial si $\text{NDVI}_{p90} > 0.12$ | `ESA/WorldCover/v200` + Sentinel-2/MODIS |
| 6 | `cryo_subsurface` | Fracción permafrost + glaciar detrítico | Coincidencia con probabilidad de hielo somero `SWIM` | `ESA CCI Permafrost` + `IANIGLA` / `RGI` |
| 7 | `solar_uv_4d` | Horas/día con $\alpha_s \in [0.2^\circ, 2.5^\circ]$ sin nieve pesada + índice UV | Exacta por día del año $d \in [1..365]$ | Ecuación esférica + `MOD10A2` + `TROPOMI`/altitud |
| 8 | `ops_isolation` | Tiempo a ciudad ($\text{min}$) y estatus legal | Modo *Hábitat* premia aislamiento alto; Modo *Ingeniería Universitaria* premia acceso vial $<8\text{ h}$ | `Oxford/MAP/accessibility_to_cities` + `WDPA` |

---

## 3. Matrices de Pesos por Modo de Ensayo (AHP Consistente, $\text{CR} < 0.05$)

| Modo de Ensayo de Misión ($m$) | `topo` | `litho` | `thermal` | `aridity` | `sterility` | `cryo` | `solar_uv` | `ops` |
|---|---|---|---|---|---|---|---|---|
| **M-L1 · Rover & EVA Cresta Polo Sur Lunar** (*Mons Mouton / Shackleton*) | 0.20 | **0.22** | 0.10 | 0.06 | 0.12 | 0.02 | **0.23** | 0.05 |
| **M-L2 · Perforación de Volátiles en Cráter Frío Lunar** (*Cabeus / Haworth*) | 0.12 | 0.10 | **0.22** | 0.10 | 0.10 | **0.26** | 0.05 | 0.05 |
| **M-L3 · Hábitat Subterráneo en Tubo de Lava / Mare** (*Tranquillitatis*) | 0.18 | **0.32** | 0.08 | 0.10 | 0.15 | 0.00 | 0.05 | 0.12 |
| **M-M1 · ISRU Hielo Somero para Starship / Marte** (*Arcadia / Phlegra*) | 0.12 | 0.08 | 0.18 | 0.14 | 0.10 | **0.30** | 0.03 | 0.05 |
| **M-M3 · Astrobiología, Sulfatos y Paleolagos** (*Jezero / Oxia / Meridiani*) | 0.08 | **0.28** | 0.08 | **0.22** | 0.12 | 0.02 | **0.15** | 0.05 |
| **M-H · Aislamiento Psicológico y Operaciones Humanas EVA** | 0.10 | 0.05 | 0.18 | 0.10 | 0.12 | 0.05 | 0.10 | **0.30** |

*(Cada suma de fila $= 1.00$ exacta).*

---

## 4. Diseño de Experiencia de Usuario (UX) y Motor de Mundo Abierto Tri-Pantalla

> 🔗 **Especificación profunda del motor 3D:** Ver [`05_motor_mundo_abierto_tri_pantalla.md`](05_motor_mundo_abierto_tri_pantalla.md) para el detalle del pipeline `Single-WebGL Scissor`, generación instantánea de terreno `Martini/3DTilesRendererJS` y sincronización cinemática en los 3 astros.

1. **Vista Principal — Mundo Abierto Tri-Pantalla Sincronizado (`🌑 Luna · 🌍 Tierra · 🔴 Marte`):**
   - **Conmutador de Disposición en Tiempo Real:**
     - **Modo Horizontal (`1×3` Columnas — Desktop / War Room):** Izquierda **🌑 Luna** (`LRO LOLA 5m` + `Kaguya MI` + `ShadowCam` + `DFSAR`), Centro **🌍 Tierra** (`Copernicus GLO-30` / `ArcticDEM 2m` / `REMA 2m` + capa `PAFI` + polígonos `DGA Chile`), Derecha **🔴 Marte** (`MOLA/HRSC` + `HiRISE 1m` + `NASA SWIM` + `CRISM`).
     - **Modo Vertical (`3×1` Filas Apiladas — Horizonte Panorámico 21:9 & Móvil):** Apila verticalmente el horizonte lunar (arriba, cielo negro en vacío y sombras de $1.5^\circ$), el horizonte del análogo terrestre (centro) y el horizonte marciano (abajo, atmósfera ocre con dispersión Mie de polvo), ideal para comparar perfiles de cordilleras/cráteres al caminar a nivel de superficie y para uso nativo en smartphones.
     - **Modo Espejo Focalizado (`1×2` Dual):** Permite aislar un solo par (`Luna ↔ Tierra` o `Marte ↔ Tierra`) cuando el usuario evalúa un ensayo monoespecífico.
   - **Exploración Continua Multi-Escala (Órbita $\to$ Caminata de Rover/Astronauta 1:1):** Las 3 cámaras comparten rumbo ($\psi$), cabeceo ($\theta$), avance y escala ($\text{métrica } 1:1$ o $\pi\text{-scaling gravitacional}$) sobre un **único contexto WebGL con `gl.scissor` y `requestRenderMode: true`** (cero consumo de GPU en reposo).
2. **Barra Inferior — Línea de Tiempo *Chrono-Luna* (Día 1 al 365):**
   - Al arrastrar la fecha, se iluminan en tiempo real las franjas polares y subpolares libres de nieve pesada que ese día tienen elevación solar máxima de $0.2^\circ\text{–}2.5^\circ$, proyectando sombras topográficas exactas en las 3 pantallas.
3. **Panel Lateral — Ficha Científica Comparativa Tri-Cuerpo (*Tri-Twin Card*):**
   - Gráfico radar superpuesto ($\text{PAFI}_{\text{Luna}}$ vs. Sitio Terrestre vs. $\text{PAFI}_{\text{Marte}}$).
   - Alerta clara de **Brecha Física Irreducible diferenciada** ($\Delta^{\text{irr}}_{\text{Luna}}: 0.16\,g, 0\text{ Pa}, 40\text{ K}$ vs. $\Delta^{\text{irr}}_{\text{Marte}}: 0.38\,g, 610\text{ Pa CO}_2$) + prueba visual interactiva de caída gravitatoria ($0.16g \cdot 1.00g \cdot 0.38g$), corte subterráneo de radar ISRU y simulante recomendado (`LHS-1`, `NAO-1`, `VI-T`, `MGS-1`, `TJ-M1`).
4. **Pestaña "Armar Mi Campaña" (*Mission Portfolio & Carbon-Zero Calculator*):**
   - Checkboxes de subsistemas + ubicación de origen del equipo $\to$ devuelve la ruta óptima de 2 a 4 sitios en el mapa **más las toneladas de $\text{CO}_2\text{e}$ aeronáutico evitadas** al entrenar en gemelos regionales cercanos.
5. **Conmutador Superior Dual + PWA Offline-First + Carbono Digital Día 0:**
   - **`[🔬 Modo Misión NASA]` ↔ `[🧑‍🚀 Modo Explorador Universal (8–99 años, Voz + Micro-Retos)]`**: sobre el mismo JSON satelital, activa lectura por voz nativa (*Web Speech API*, cero costo de servidor, apto para baja alfabetización digital y zonas rurales), micro-desafíos cognitivos de 15 s (*Retrieval Practice* + *Dual Coding*), filtros por los **5 entornos oficiales del prompt** (*Desiertos, Polos, Volcanes, Áridos, Cuevas*) y la tarjeta de **Inclusión Laboral Comunitaria (Custodios de Análogos) + UNOOSA Space4SDGs**.
   - **Telemetría Carbon-Zero Día 0 (`ISO/IEC 21031 SCI`)**: tema oscuro OLED `#05070D`, carga inicial $<500\text{ KB}$ sin GPUs ociosas, caché Service Worker offline y medidor transparente de $\text{gCO}_2\text{e}$ por sesión en barra inferior.
