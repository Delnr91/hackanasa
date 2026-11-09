# 05.5 · Especificación del Motor Web de Mundo Abierto Tri-Pantalla (`🌑 Luna · 🌍 Tierra · 🔴 Marte` en Horizontal y Vertical)

> **Rol activo:** *Principal Graphics & Mission Simulation Architect (NASA JPL Operations Lab — autoría conceptual de `3DTilesRendererJS` / `Mars 2020 Ops` + MIT Media Lab + Consultoría McKinsey 80/20)*.
> **Veredicto Ejecutivo (Pirámide de Minto):** **SÍ, es 100 % factible construir en 48 horas un explorador web de "Mundo Abierto" con pantalla dividida en 3 (`Luna · Tierra · Marte`) conmutable en tiempo real entre modo Horizontal (`1×3`), Vertical (`3×1`) y Táctico (`1+2`)**, alimentado íntegramente por datos topográficos y orbitales abiertos de **NASA, ESA, JAXA, CNSA, ISRO, KARI, IKI-RAS y Chile**. Más aún: ejecutado sobre un **único lienzo WebGL/WebGPU con partición `gl.scissor` y renderizado bajo demanda**, se convierte en el diferenciador visual más potente del hackathon (*Presentation 5.0 + Creativity 5.0 + Best Use of Technology*) sin romper la regla de **Carbono Digital Día 0 (`ISO/IEC 21031`)**.

---

## 1. Marco Estratégico McKinsey (SCQ): ¿Por Qué una Tri-Pantalla de Mundo Abierto Gana el Hackathon?

- **Situación (*Situation*):** El desafío oficial pide identificar y caracterizar nuevos análogos terrestres para **tanto bases lunares permanentes como misiones a Marte**, usando datos abiertos de Tierra, Luna y Marte, y presentarlos como mapa, visualización u otra herramienta interactiva.
- **Complicación (*Complication*):** El 98 % de los equipos presenta un mapa 2D plano con chinchetas estáticas. Por otro lado, quienes intentan meter 3 globos 3D tradicionales en una página web suelen instanciar **3 motores pesados independientes (`3 × WebGLContext`)**, lo que colapsa la memoria de video (VRAM) en laptops de jueces, impide comparar el relieve a escala humana (modo rover/astronauta) y carece de rigor físico al mezclar Luna y Marte sin separar qué dimensión física aplica a cada astro.
- **Resolución (*Resolution*):** Diseñamos el **Motor `TERRA·TWIN Tri-World Open-Engine`**:
  1. **Exploración Continua Multi-Escala (De Órbita a Caminata 1:1 en Superficie):** El usuario vuela desde el globo planetario hasta posarse a $1.7\text{ m}$ del suelo (altura de ojos de un astronauta o mástil de cámara *Perseverance/VIPER*) y recorrer en **mundo abierto** cualquier coordenada.
  2. **Sincronización Tripartita Conmutable (`Horizontal 1×3` ↔ `Vertical 3×1`):** Las 3 cámaras (`🌑 Luna`, `🌍 Tierra`, `🔴 Marte`) comparten posición relativa, rumbo ($\psi$), cabeceo ($\theta$), campo visual ($\text{FOV}$) y geometría solar.
  3. **Rigor Físico Tri-Cuerpo (*Validity*):** Cada panel calcula y muestra por separado su **afinidad dimensional $\text{PAFI}_{\text{Luna}}$ vs. $\text{PAFI}_{\text{Marte}}$** y su **Brecha Física Irreducible específica** ($\Delta^{\text{irr}}_{\text{Luna}}: 0.16\,g, 0\text{ Pa}, 40\text{ K}$ vs. $\Delta^{\text{irr}}_{\text{Marte}}: 0.38\,g, 610\text{ Pa CO}_2, -63^\circ\text{C}$).

---

## 2. Arquitectura Visual: Modos Horizontal (`1×3`), Vertical (`3×1`) y Táctico (`1+2`)

El usuario o juez puede alternar instantáneamente con la tecla `L` (o un selector superior) entre **3 disposiciones geométricas**, cada una diseñada para responder una pregunta científica distinta:

```text
================================================================================
MODO A: HORIZONTAL (1×3 Columnas) — Ideal para Desktop / War Room / Escala en Planta
================================================================================
+-------------------------+-------------------------+-------------------------+
| 🌑 LUNA (Objetivo)      | 🌍 TIERRA (Gemelo Vivo) | 🔴 MARTE (Objetivo)     |
| Shackleton / Mons Mouton| Glaciar Unión / Gorbea  | Arcadia / Jezero / Oxia |
|                         |   / Fiskenæsset / Maipo |                         |
| • LRO LOLA DEM (5m)     | • Copernicus GLO-30/2m  | • MOLA + HRSC + HiRISE  |
| • Luz Rasante 1.4°      | • Chrono-Luna 1.4° Real | • Hielo SWIM + CRISM    |
| • Cielo Negro (0 Pa)    | • Visor Casco / Cielo   | • Cielo Polvo Mie (MCD) |
| • PAFI_Luna: 89/100     | • Rover/Avatar Central  | • PAFI_Marte: 84/100    |
| • Δ_irr: 0.16g | TVAC   | • Custodio Local & CO₂  | • Δ_irr: 0.38g | 6 mbar |
+-------------------------+-------------------------+-------------------------+

================================================================================
MODO B: VERTICAL (3×1 Filas Apiladas) — Ideal para Horizonte 360°, Luz Rasante y Móvil
================================================================================
+-----------------------------------------------------------------------------+
| 🌑 LUNA · Horizonte Anortosítico en Vacío (Sombras kilométricas a 1.5° Sol) |
+-----------------------------------------------------------------------------+
| 🌍 TIERRA · Horizonte del Análogo Terrestre (Comparación exacta de crestas) |
+-----------------------------------------------------------------------------+
| 🔴 MARTE · Horizonte Marciano con Dispersión de Polvo y Subsuelo Radar GPR  |
+-----------------------------------------------------------------------------+
```

### ¿Por qué tener AMBOS modos (Horizontal y Vertical) es una jugada maestra?
1. **Ventaja del Modo Horizontal (`1×3`):** Permite comparar en planta y oblicuo el **diámetro de cráteres**, la **pendiente de aterrizaje ($<7^\circ$)**, las rutas de travesía EVA/Rover y los mapas de calor mineralógicos (`Kaguya MI` en Luna ↔ `Sentinel-2/ASTER` en Tierra ↔ `CRISM/SWIM` en Marte).
2. **Ventaja del Modo Vertical (`3×1`):** Cuando bajas la cámara al nivel del suelo (caminata en mundo abierto mirando al horizonte), una columna estrecha recorta la visión periférica. En cambio, **3 franjas horizontales anchas apiladas verticalmente (`3×1`)** actúan como **tres parabrisas panorámicos widescreen (`21:9` cada uno)**:
   - Permite ver de un vistazo cómo una misma cadena montañosa o borde de cráter proyecta **sombras negras absolutas en la Luna (arriba)**, **sombras rasantes equivalentes durante la ventana *Chrono-Luna* en la Tierra (centro)** y **penumbra difusa anaranjada por polvo en suspensión en Marte (abajo)**.
   - En **smartphones y tablets verticales** (clave para nuestro **Modo Explorador / Comunidad Rural P9**), el modo `3×1` aprovecha el $100\%$ de la pantalla sin obligar a girar el teléfono.

---

## 3. ¿Con Qué Datos Abiertos Reales Alimentamos los 3 Mundos Abiertos? (Árbol MECE de Datos)

Para que el "Mundo Abierto" no sea un videojuego ficticio sino un **gemelo científico auditable por jueces de NASA**, cada uno de los 3 paneles consume datos abiertos multi-escala en 3 niveles de detalle (*Levels of Detail — LoD*):

| Nivel de Escala (LoD) | 🌑 Panel 1: LUNA (Datos Abiertos) | 🌍 Panel 2: TIERRA (Datos Abiertos) | 🔴 Panel 3: MARTE (Datos Abiertos) |
|---|---|---|---|
| **LoD 1: Globo Planetario y Regional** ($100\text{ km} \to 100\text{ m}$) | • **Terreno 3D:** `Cesium Moon Terrain` (3D Tiles oficiales de `LRO LOLA` + `SLDEM2015` JAXA/NASA a $59\text{ m}$).<br>• **Texturas WMTS:** `NASA Moon Trek` (`LROC WAC`, `Diviner` T° bolométrica, `Kaguya MI` Plagioclasa, `IKI LEND` $\text{WEH}\%$). | • **Terreno 3D:** `Copernicus DEM GLO-30` ($30\text{ m}$ global) servido vía `AWS Terrain Tiles` / `Mapterhorn PMTiles`.<br>• **Texturas:** `Sentinel-2 Cloudless`, `ESA WorldCover 10m`, `MODIS LST/Snow` y capa global `PAFI`. | • **Terreno 3D:** `Cesium Mars Terrain` (`MGS MOLA` + `ESA Mars Express HRSC` 3D Tiles a $50\text{–}200\text{ m}$).<br>• **Texturas WMTS:** `NASA Mars Trek` (`CTX 5m` Murray Lab, `THEMIS` inercia térmica, `NASA SWIM` hielo, `FREND`). |
| **LoD 2: Zona de Base / Cráter Local** ($100\text{ m} \to 1\text{–}5\text{ m}$) | • **Polos Artemis III ($5\text{ m/px}$):** COGs directos de `LOLA Polar DEM` vía `stac.astrogeology.usgs.gov/api`.<br>• **Interior de PSRs ($1.7\text{ m/px}$):** Mosaicos de **`KARI/NASA ShadowCam`** + radar polarimétrico **`ISRO DFSAR`**. | • **Polos ($2\text{ m/px}$):** `ArcticDEM 2m` (*Fiskenæsset / Svalbard*) y `REMA 2m/8m` (*Glaciar Unión $79.8^\circ\text{S}$, Chile*).<br>• **Andes / Atacama:** `GLO-30` + polígonos vectoriales **DGA IPG2022** y radiación $1\text{ km}$ **MinEnergía Chile**. | • **Sitios Diana ($1\text{ m/px}$):** DTMs estéreo **`MRO HiRISE`** y **`CaSSIS`** vía `USGS STAC API` en *Jezero, Oxia Planum, Arcadia y Phlegra*.<br>• **Mallas de Rover:** 3D Tiles de *Perseverance/Curiosity* (`NASA-AMMOS`). |
| **LoD 3: Superficie 1:1 ("Ground Walk" Micro-Detalle)** ($<1\text{ m}$) | • **Micro-relieve sintético físicamente calibrado:** Desplazamiento procedural (normal/bump map) gobernado por el dato real de **Abundancia de Rocas `LRO Diviner`** + granulometría de **`NIST 3D Lunar Regolith Particles`** y perfiles GPR de **`Chang'e-4/6`**. | • **Micro-relieve calibrado por radar:** Rugosidad superficial modulada en tiempo real por la retrodispersión **`Sentinel-1 SAR (VV/VH)`** + parámetros geotécnicos del simulante homólogo (`LHS-1`, `NAO-1`, `VI-T`, `MGS-1`). | • **Micro-relieve y Subsuelo:** Abundancia de rocas de **`THEMIS Rock Abundance`** + corte estratigráfico subterráneo ($0\text{–}80\text{ m}$) basado en el radar **`Zhurong RoPeR` (CNSA)** y **`SHARAD/SWIM`**. |

> **Honestidad Científica ante el Jurado (*Red Team Shield*):** Ningún satélite civil tiene resolución de $1\text{ cm/px}$ sobre toda la Tierra, la Luna y Marte. Por eso, cuando el usuario camina a nivel del suelo (LoD 3), la interfaz muestra una etiqueta transparente: **`[Geometría Base: DEM Orbital Real 1m–30m] + [Micro-Rugosidad <1m: Síntesis Física Paramétrica desde Radar SAR / Diviner Rock Abundance]`**. ¡Los jueces de NASA JPL valoran enormemente esta precisión técnica porque es exactamente como se construyen los simuladores de aterrizaje de *Artemis* y *Mars 2020*!

---

## 4. Cómo Funciona la "Tríada Planetaria" sin Violar el Rigor Físico

Un juez científico preguntará: *"¿Acaso están diciendo que un mismo lugar de la Tierra es idéntico a la Luna y a Marte al mismo tiempo?"*
Nuestra respuesta en la pantalla dividida en 3 es **matemáticamente impecable** y opera en **dos modos de comparación tripartita**:

### Modo Tripartito 1: "Puente de Misión Luna → Tierra → Marte" (*Artemis-to-Mars Proving Ground*)
La estrategia oficial *Moon-to-Mars* de la NASA usa el Polo Sur Lunar como banco de pruebas para Marte, y los análogos terrestres como banco de pruebas para ambos. En este modo, al elegir un **Análogo Terrestre Polivalente** (por ejemplo, el corredor **Atacama / Ojos del Salado / Glaciares Rocosos** en Chile, o **Qaidam / Tíbet** en China, o **Devon Island / Haughton** en Canadá):
- **Panel Izquierdo (🌑 Luna — ej. *Cabeus / Shackleton*):** Muestra qué subsistemas lunares se validan en ese terreno terrestre (ej. `Topografía de cráter: 91%`, `Tracción en regolito seco: 88%`, `Visión con Sol rasante: 85%`) y su brecha lunar ($\Delta^{\text{irr}}_{\text{Luna}}$: vacío y $0.16\,g$).
- **Panel Central (🌍 Tierra — ej. *Cráter Monturaqui / Glaciar Rocoso Andino*):** Muestra el terreno terrestre real donde el equipo universitario o agencia instala el campamento.
- **Panel Derecho (🔴 Marte — ej. *Arcadia Planitia / Jezero*):** Muestra qué subsistemas marcianos se validan en ese mismo sitio (ej. `Perforación ISRU en hielo con detritos SWIM: 94%`, `Hiperaridez y percloratos/sulfatos: 92%`) y su brecha marciana ($\Delta^{\text{irr}}_{\text{Marte}}$: $6\text{ mbar CO}_2$ y $0.38\,g$).

### Modo Tripartito 2: "Desacoplamiento por Especialidad" (*Best Lunar Twin + Earth Hub + Best Martian Twin*)
Si el usuario selecciona un arquetipo puramente lunar (ej. **Anortosita pura en Fiskenæsset, Groenlandia**), el sistema permite fijar a la izquierda el objetivo lunar (*Mons Mouton*), en el centro el gemelo lunar #1 (*Fiskenæsset*), y a la derecha comparar cómo contrasta con el paisaje marciano (*Phlegra Montes*), evidenciando visualmente por qué la litología y la atmósfera cambian las reglas de ingeniería entre la Luna y Marte.

---

## 5. Arquitectura de Software Ligera: Cómo Renderizar 3 Mundos Abiertos a 60 FPS sin Quemar la GPU

Para cumplir nuestra promesa de **Accesibilidad Universal + Carbono Digital Día 0 (`ISO/IEC 21031`)**, **prohibimos crear 3 instancias pesadas separadas**. Implementamos el patrón **`Single-WebGL Scissor Pipeline`** junto con el motor open-source **`NASA-AMMOS/3DTilesRendererJS`** (creado por NASA JPL bajo licencia Apache-2.0):

```mermaid
flowchart TB
    subgraph INPUT["1. Controles Unificados de Mundo Abierto (1 Sola Entrada)"]
        CTRL["Controles orbitales / WASD / Gamepad / Giroscopio Móvil<br/>+ Slider Temporal Chrono-Luna (Día 1–365, Hora UTC)<br/>+ Selector de Layout: [ 1×3 Horizontal ] · [ 3×1 Vertical ] · [ 1+2 Bento ]"]
    end

    subgraph SYNC["2. Sincronizador Físico y de Cámara (π-Sync Kinematics)"]
        CAM[" Estado Maestro de Cámara (Δx, Δy, Δz, Yaw ψ, Pitch θ, FOV)<br/>Opción A: Escala Métrica 1:1 (misma distancia en metros)<br/>Opción B: Escala Gravitacional π-Scaling (D_E = D_p · g_p / g_E)"]
        LIGHT["Motor de Luz e Iluminación Física Diferenciada:<br/>• Luna: BRDF Hapke/Lommel-Seeliger, Cielo #000000, Sombras Duras 1.5°<br/>• Tierra: Rayleigh Sky (o Visor Casco Lunar), Sol Efemérides Reales<br/>• Marte: Dispersión Mie Ocre (Polvo τ_dust MCD), Sol 43% Irradiancia"]
    end

    subgraph ENGINE["3. Único Lienzo WebGL2/WebGPU con Partición gl.viewport / gl.scissor"]
        V1["Viewport 1: 🌑 LUNA<br/>3DTilesRendererJS / MapLibre Terrain<br/>COG LOLA 5m + Kaguya + ShadowCam"]
        V2["Viewport 2: 🌍 TIERRA<br/>3DTilesRendererJS / MapLibre Terrain<br/>GLO-30 / ArcticDEM 2m / REMA + PAFI"]
        V3["Viewport 3: 🔴 MARTE<br/>3DTilesRendererJS / MapLibre Terrain<br/>MOLA/HRSC + HiRISE 1m + SWIM Ice"]
    end

    subgraph ECO["4. Guardián Carbon-Zero (ISO/IEC 21031)"]
        IDLE["Render-on-Demand (0 FPS cuando el usuario no mueve la cámara)<br/>+ Frustum & Tile LoD Culling estricto + Caché local IndexedDB/PMTiles"]
    end

    CTRL --> CAM & LIGHT
    CAM & LIGHT --> V1 & V2 & V3
    V1 & V2 & V3 --> IDLE
```

### 5.1 El Secreto Técnico: `gl.scissor` y `3DTilesRendererJS` / `MapLibre GL 3D`
En lugar de abrir 3 contextos WebGL (límite duro de muchos navegadores móviles es 8 contextos y cada uno duplica buffers), usamos **un solo `<canvas id="tri-world-canvas">`** que ocupa toda la ventana:
1. En cada cuadro activo (*frame*), cuando el diseño es **Horizontal (`1×3`)**, dividimos el ancho $W$ en tres tercios:
   - Panel Luna: `renderer.setViewport(0, 0, W/3, H)` y `renderer.setScissor(0, 0, W/3, H)`
   - Panel Tierra: `renderer.setViewport(W/3, 0, W/3, H)` y `renderer.setScissor(W/3, 0, W/3, H)`
   - Panel Marte: `renderer.setViewport(2*W/3, 0, W/3, H)` y `renderer.setScissor(2*W/3, 0, W/3, H)`
2. Cuando el usuario pulsa **"Cambiar a Modo Vertical (`3×1`)"**, la transición ocurre en **0 milisegundos sin recargar ningún dato ni textura**, simplemente cambiando las coordenadas de recorte a tercios de la altura $H$:
   - Panel Luna (Arriba): `(0, 2*H/3, W, H/3)`
   - Panel Tierra (Centro): `(0, H/3, W, H/3)`
   - Panel Marte (Abajo): `(0, 0, W, H/3)`
3. **Generación Instantánea de Terreno 3D desde DEMs Abiertos (`Martini` / `Terrain-RGB`):**
   - Para cualquier sitio de los 64 del catálogo (incluso donde no haya 3D Tiles pre-empaquetados), convertimos en el pre-procesamiento un recorte de $10\text{ km} \times 10\text{ km}$ del DEM real de **LOLA ($5\text{ m}$)**, **Copernicus/REMA ($2\text{–}30\text{ m}$)** y **HiRISE/HRSC ($1\text{–}50\text{ m}$)** a una imagen **PNG `Terrain-RGB` de $<150\text{ KB}$** por mundo.
   - En el navegador, la librería open-source **`@mapbox/martini`** (RTIN — *Right-Triangulated Irregular Networks*, licencia ISC) construye las 3 mallas 3D de mundo abierto en **$<12\text{ milisegundos}$** en JavaScript puro! Esto garantiza que el modo de mundo abierto funcione **incluso 100 % offline** en escuelas rurales y sin depender de tokens pagos.

---

## 6. Las 4 Experiencias Interactivas de "Mundo Abierto" que Enamoran al Jurado

1. **Caminata Sincronizada de Rover / Astronauta (*Tri-Rover Drive & Walk*):**
   - Soltás un rover virtual (modelo oficial `.glb` de `NASA-3D-Resources`) en el panel central (**Tierra**: ej. *Salar de Gorbea* o *Glaciar Unión*). En ese mismo instante aterrizan sus gemelos en la **Luna** (*Shackleton*) y **Marte** (*Arcadia Planitia*).
   - Al avanzar con las flechas o el dedo, ves en vivo el **inclinómetro en los 3 mundos** ($\theta_{\text{Luna}} = 11.2^\circ$, $\theta_{\text{Tierra}} = 10.8^\circ$, $\theta_{\text{Marte}} = 9.5^\circ$), el consumo de batería proyectado y la tracción sobre el regolito.
2. **Prueba de Gravedad y Polvo en Vivo (*Drop Test $0.16g \cdot 1.00g \cdot 0.38g$*):**
   - Para que cualquier persona (desde un juez de NASA hasta un niño de 10 años en el *Modo Explorador*) entienda visualmente qué es la **Brecha Física Irreducible ($\Delta^{\text{irr}}$)**, un botón **"Soltar Sonda / Levantar Polvo"** lanza simultáneamente una roca o penacho de regolito en las 3 pantallas:
     - En la **Luna ($1.62\text{ m/s}^2$, vacío)** sigue una parábola balística perfecta sin fricción y tarda $2.47\times$ más en caer que en la Tierra.
     - En la **Tierra ($9.81\text{ m/s}^2$, $101\text{ kPa}$)** cae rápido y el viento dispersa una nube turbulenta.
     - En **Marte ($3.71\text{ m/s}^2$, $0.6\text{ kPa}$)** cae a velocidad intermedia y el polvo fino queda suspendido en la atmósfera tenue de $\text{CO}_2$.
3. **Corte Subterráneo de Rayos X (*Subsurface Radar Slice*):**
   - Al activar la vista **"Ver Bajo Tierra (ISRU)"**, el suelo de los 3 mundos se abre en corte transversal mostrando los primeros $10\text{ metros}$ de profundidad con datos reales:
     - **Luna:** Perfil de radar polarimétrico `ISRO DFSAR` + GPR `Chang'e-4/6` + gradiente térmico `ChaSTE`.
     - **Tierra:** Espesor de capa activa detrítica y núcleo de hielo del **Glaciar Rocoso (DGA Chile / IANIGLA)** o permafrost `ESA CCI`.
     - **Marte:** Consistencia de hielo `NASA SWIM` ($0\text{–}5\text{ m}$) + estratos poligonales del radar `Zhurong RoPeR` + neutrones `FREND`.
4. **Conmutador de Orientación Adaptativa (`Horizontal 1×3` ↔ `Vertical 3×1`):**
   - En un solo clic, el usuario pasa de comparar mapas topográficos en 3 columnas verticales a comparar **3 horizontes planetarios apilados en formato panorámico**, sincronizados con el reloj astronómico **Chrono-Luna 4D**.

---

## 7. Plan de Implementación Pareto (80/20) para las 48 Horas

Para asegurar que este módulo de Mundo Abierto Tri-Pantalla esté **100 % terminado y libre de bugs el domingo al mediodía**, aplicamos un recorte de alcance disciplinado:

| Fase del Hackathon | Qué Construimos Exactamente (Alcance 80/20 Seguro) | Tiempo Estimado |
|---|---|---|
| **Sábado Mañana (H04–H10)** | Pre-empaquetar **10 "Tríadas Planetarias Estrella"** (5 enfocadas en Chile + 5 globales: *Gorbea, Monturaqui, Glaciar Unión, Cajón del Maipo, Rapa Nui, Fiskenæsset, Lofoten, Qaidam, Ladakh, Lanzarote*) como teselas `Terrain-RGB` / `PMTiles` estáticas listas para cargar en $<200\text{ ms}$ + streaming WMTS global para el resto del planeta. | $4\text{ h}$ |
| **Sábado Tarde (H10–H18)** | Implementar el componente `TriWorldCanvas` con soporte para **Layout Horizontal (`1×3`)** y **Layout Vertical (`3×1`)** vía CSS Grid / `gl.scissor`, sincronizando la cámara `(x, y, z, yaw, pitch)` y el vector solar $(\alpha_s, \gamma_s)$ entre los 3 paneles. | $6\text{ h}$ |
| **Domingo Mañana (H24–H32)** | Añadir los shaders de cielo diferenciados (`#000000` Luna, Cielo/Visor Tierra, Polvo Mie `#C87D55` Marte), el modelo `.glb` de rover/base de `NASA-3D-Resources`, la animación de gravedad comparada ($0.16g / 1g / 0.38g$) y el corte subterráneo ISRU. | $5\text{ h}$ |
| **Domingo Tarde (H32–H40)** | Conectar el interruptor **Modo Ingeniero ↔ Modo Explorador (Voz + Reto Cognitivo de 15 s sobre las 3 pantallas)** y grabar las tomas del video de 30 segundos mostrando el cambio en vivo de Horizontal a Vertical y el vuelo desde el espacio hasta caminar por Atacama, Shackleton y Jezero a la vez. | $4\text{ h}$ |
