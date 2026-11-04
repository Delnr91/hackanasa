# 00.1 · Brief Estratégico del Desafío (NASA Space Apps Challenge 2026)

> **Rol activo:** *Chief Scientist Office (NASA HQ) + Lead Challenge Architect (Space Apps Executive Panel)*.

---

## 1. Ficha Oficial del Evento y del Desafío
| Atributo | Detalle Verificado |
|---|---|
| **Evento** | NASA International Space Apps Challenge 2026 |
| **Fechas globales** | **14 y 15 de noviembre de 2026** (48 horas) |
| **Lema anual (*Theme*)** | **"The Next Frontier"** (*La Próxima Frontera*) |
| **Título del Desafío** | *Identify Earth Locations that Analog the Permanent Moon Base Locations and Mars* |
| **Dominio técnico** | Ciencias Planetarias · Observación de la Tierra (EO) · GIS Multicriterio · IA Geoespacial · Ingeniería de Sistemas de Misión |
| **Regla de oro pre-hackathon** | Se permite llegar con **investigación, papers, catálogos documentales, marcos metodológicos, agentes y skills**. El código del prototipo y activos finales se construyen durante las 48 h del evento. |

---

## 2. Texto Oficial Exacto del Desafío (Confirmado) y Desglose Quirúrgico

> **Prompt Oficial NASA Space Apps 2026:**
> *"Selecting future landing sites and lunar base locations depends on many factors, including topography, geology, environment, and available resources, to name a few. Places on Earth that have analogous characteristics to the Moon or Mars – the Atacama Desert, Haughton Crater, Death Valley – allow mission teams to test equipment and methods before they fly; however, such terrestrial analog sites are not entirely well characterized. Your challenge is to use open Earth, Moon, and Mars data from NASA and other space agencies to identify and characterize new terrestrial analogs for future bases or landing sites, drawing on deserts, polar regions, volcanic and arid terrains, caves, and other environments that share conditions with the lunar or Martian surface, then present your findings as a map, visualization, or other tool."*

### Desglose palabra por palabra de los requisitos obligatorios del prompt
| Frase exacta del prompt | Qué nos exige demostrar sí o sí ante el jurado |
|---|---|
| *"topography, geology, environment, and available resources"* | Nuestro vector **PAFI** debe mostrar explícitamente esos **4 pilares** (Topografía, Geología, Ambiente/Clima/Luz y Recursos ISRU como hielo/regolito/refugio). |
| *"Atacama Desert, Haughton Crater, Death Valley"* | **Deben ser nuestros 3 sitios ancla de validación (*Benchmark Control Trio*)** visibles en la pantalla de bienvenida para demostrar que el algoritmo reproduce lo que NASA ya conoce. |
| *"not entirely well characterized ... identify and characterize new terrestrial analogs"* | No basta con listar sitios famosos: debemos **descubrir sitios nuevos** y generar una **ficha cuantitativa completa de caracterización** para cada uno. |
| *"deserts, polar regions, volcanic and arid terrains, caves, and other environments"* | Nuestra herramienta debe incluir filtros explícitos para los **5 biomas/entornos nombrados en el prompt**: (1) Desiertos hiperáridos, (2) Regiones polares, (3) Terrenos volcánicos, (4) Terrenos áridos/periglaciales (glaciares de roca, salares altos) y (5) Cuevas / tubos de lava. |
| *"open Earth, Moon, and Mars data from NASA and other space agencies"* | Cruzar explícitamente los **3 cuerpos** (Tierra + Luna + Marte) con datos multi-agencia (NASA, ESA, JAXA, ISRO, CNSA, CONICET/IANIGLA). |
| *"map, visualization, or other tool"* | Libertad total para entregar un **Atlas Web Multiplataforma 2D/3D + Herramienta Educativa/Operativa Carbon-Zero**. |

---

## 3. Límites Físicos Irreducibles (Credibilidad ante Jueces de NASA/MIT)

> **Regla de oro científica:** El equipo que pretende haber encontrado "la Luna o Marte en la Tierra" pierde puntos en **Validity**. El equipo que cuantifica exactamente **qué dimensiones se imitan y cuál es la Brecha Física Irreducible ($\Delta_{\text{física}}$)** gana el respeto inmediato de los SMEs (*Subject Matter Experts*) de NASA.

| Variable Física | Tierra (Extremo Natural) | Base Polo Sur Lunar | Base Humana en Marte (Lat. Media) | ¿Imitable en campo abierto? | Cómo se compensa en ingeniería |
|---|---|---|---|---|---|
| **Gravedad superficial ($g$)** | $9.81\text{ m/s}^2$ ($1.00\,g$) | $1.62\text{ m/s}^2$ ($0.165\,g$) | $3.72\text{ m/s}^2$ ($0.379\,g$) | ❌ **No** | Sistemas de descarga activa (*ARGOS* NASA), flotabilidad neutra (*NEEMO*), vuelos parabólicos o leyes de escalamiento dimensional ($\pi$-scaling). |
| **Presión atmosférica** | $31\text{–}101\text{ kPa}$ ($\text{N}_2/\text{O}_2$) | $\sim 3 \times 10^{-15}\text{ bar}$ (ultra-alto vacío) | $\sim 0.6\text{ kPa}$ ($95\%\text{ CO}_2$) | ❌ **No** | Cámaras termovacío (TVAC) / cámaras marcianas; en campo se corrige transferencia convectiva vs. radiativa. |
| **Temperaturas criogénicas PSR** | Mín. terrestre $\approx 183.9\text{ K}$ ($-89.2^\circ\text{C}$, Vostok / $\sim 180\text{ K}$ Dome A) | **PSRs:** $40\text{–}90\text{ K}$ ($-233^\circ\text{C}$ a $-183^\circ\text{C}$)<br>**Cimas iluminadas:** $\sim 210\text{–}290\text{ K}$ | Media $\sim 210\text{ K}$ ($-63^\circ\text{C}$); rango $150\text{–}293\text{ K}$ | ⚠️ **Parcial** | Las cimas iluminadas lunares y el verano/día marciano **sí** solapan con Antártida/Ártico/Andes altos; las PSR de $40\text{ K}$ exigen criostatos de $\text{LN}_2/\text{LHe}$. |
| **Radiación ionizante (GCR + SEP)** | Protegida por magnetosfera + $1{,}000\text{ g/cm}^2$ de atmósfera | $\sim 300\text{–}400\text{ mSv/año}$ + eventos solares letales sin blindaje | $\sim 200\text{–}250\text{ mSv/año}$ en superficie | ❌ **No** (solo UV-B/C parcial en Puna/Tíbet) | Aceleradores de haces (NSRL Brookhaven); en campo se simula geometría de blindaje (tubos de lava / cobertura de regolito). |
| **Abrasividad y electrostática del regolito** | Granos redondeados por agua/viento; humedad disipa carga | Esquirlas vítreas (*agglutinates*) sin meteorización acuosa, cargadas por viento solar/UV | Polvo rico en óxidos de hierro, percloratos tóxicos, triboelectricidad eólica | ⚠️ **Parcial** | Cenizas basálticas jóvenes / anortositas trituradas + simulantes certificados (`LHS-1`, `LSS-ISAC-1`, `CAS-1`, `MGS-1`). |
| **Iluminación solar rasante ($0^\circ\text{–}2^\circ$)** | Latitudes polares en ventanas estacionales exactas (con dispersión Rayleigh) | Continua/cuasi-continua en picos con Sol a $\le 1.54^\circ \pm \text{relieve}$, cielo negro | Oblicuidad $25.19^\circ$ muy similar a la Tierra ($23.44^\circ$) | ✅ **Sí (geométricamente)** | En latitudes $>65^\circ$ en fechas específicas + filtro/corrección de luz difusa atmosférica. |

---

## 4. Usuarios Reales y Decisiones que Resuelve nuestra Solución
1. **Arquitectos de Campañas Análogas (NASA JETT / CHAPEA / BASALT, ESA PANGAEA, ISRO HOPE, CNSA, agencias emergentes):** Decidir *dónde* y *en qué mes* desplegar una campaña de campo maximizando fidelidad técnica por dólar logístico.
2. **Ingenieros de Robótica, Navegación Visual (SLAM) y Energía:** Encontrar terrenos con la combinación exacta de pendiente, distribución de bloques y **ángulo solar rasante** para entrenar visión por computadora antes de volar al Polo Sur Lunar.
3. **Equipos de Perforación e ISRU Criogénico:** Ubicar reservorios terrestres accesibles de **hielo cementado o masivo bajo sobrecarga detrítica seca** (permafrost seco y glaciares de roca) para validar taladros térmicos/mecánicos destinados a *Arcadia Planitia*, *Phlegra Montes* o cráteres polares lunares.
4. **Astrobiólogos y Equipos de Instrumentación Espectral (Raman, LIBS, VNIR/SWIR):** Seleccionar sitios con ensamblajes minerales homólogos (jarosita, sulfatos de Mg, percloratos, filosilicatos, estromatolitos bajo alto UV) para calibrar cargas útiles.
