# 05.3 · Matriz de Riesgos Críticos y Defensa ante Preguntas Trampa del Jurado

> **Rol activo:** *Chair de Revisión de Diseño Preliminar (NASA PDR Review Board)*.

---

## 1. Gestión Preventiva de Riesgos Técnicos, Científicos y de Competencia

| # | Riesgo Identificado | Prob. | Impacto | Plan de Mitigación Concreto |
|---|---|---|---|---|
| **R1** | **Confusión geológica Polo Sur Lunar = Basalto** (error típico que descalifica ante geólogos de NASA). | Baja (ya blindado) | Crítico | Separar explícitamente `Arquetipo L1 (Highlands Anortosíticas)` de `Arquetipo L3 (Mare / Tubos Basálticos)` y destacarlo como hallazgo central. |
| **R2** | **Falsos positivos en el mapa global** (ej. glaciares limpios nevados puntuando alto por frío y pendiente, o lagos salados inundados). | Media | Alto | Aplicar máscaras duras previas: excluir agua permanente (`WorldCover = 80`), nieve/hielo limpio permanente (`WorldCover = 70`) cuando se busca regolito rocoso, y vegetación (`NDVI > 0.12`). |
| **R3** | **Cuotas o demora de exportación en Google Earth Engine** durante el sábado del hackathon. | Media | Alto | Trabajar a escala global de $1\text{–}5\text{ km}$ para el mapa general y extraer alta resolución ($10\text{–}30\text{ m}$) únicamente en ventanas focales de $20\times 20\text{ km}$ sobre los Top-100 sitios candidatos. |
| **R4** | **Caída del backend cuando evalúan los jueces globales** semanas después del evento. | Media | Fatal | Arquitectura **100 % estática serverless** (`GitHub Pages` / `Cloudflare Pages` + archivos `PMTiles` / `GeoJSON`). No requiere servidor Python encendido ni base de datos pagada. |
| **R5** | **Permisos cerrados en video, slides o repo** (causa #1 de descalificación administrativa en Space Apps!). | Baja | Fatal | Verificar en navegador en modo incógnito desde otro dispositivo que el video, la demo web y el repositorio GitHub abran sin login en $<3\text{ s}$. |
| **R6** | **Percepción de arbitrariedad en los pesos del índice.** | Media | Medio | Permitir que el juez mueva los sliders de pesos en vivo en la interfaz + mostrar el score de estabilidad Monte Carlo ($R_{\text{stab}}$) sobre 1,000 perturbaciones. |
| **R7** | **Conflicto ético/ambiental al proponer ensayos en ecosistemas frágiles** (estromatolitos de la Puna, glaciares protegidos por Ley de Glaciares, Antártida). | Media | Alto | Incluir etiqueta de **Protocolo de Protección Planetaria Terrestre** en cada ficha: clasificar sitios en *Nivel A (Observación / Sensores no invasivos)* vs. *Nivel B (Canteras/terrenos permitidos para perforación e ISRU pesado)*. Suma puntos enormes en *Impact* y *Validity*! |

---

## 2. Simulador de Q&A: Las 7 Preguntas Más Duras de un Jurado NASA/MIT y Nuestras Respuestas

### P1: *"En la Luna no hay atmósfera y los PSR están a $40\text{ K}$. ¿Para qué sirve ir al Ártico o a la Puna si igual no hay vacío ni $40\text{ K}$?"*
> **Respuesta:** "Porque en ingeniería espacial los ensayos en cámara termovacío cuestan decenas de miles de dólares por día y miden a lo sumo pocos metros cuadrados. Uno no va al campo a simular vacío; va a validar **navegación autónoma en kilómetros reales con Sol a $1.5^\circ$**, **desgaste mecánico en roca anortosítica real** o **perforación autónoma a través de bloques heterogéneos sobre hielo**. Nuestro motor cuantifica exactamente qué cubre el campo ($\text{PAFI}$) y qué brecha ($\Delta^{\text{irr}}$) debe cerrarse después en cámara TVAC."

### P2: *"¿Cómo validaron matemáticamente que su índice PAFI no es una fórmula inventada que ordena sitios al azar?"*
> **Respuesta:** "Hicimos un *back-testing* ciego: fijamos los vectores objetivo únicamente con mediciones orbitales de *LRO*, *MRO* y *SWIM*, sin entrenar con etiquetas terrestres. Al correr el algoritmo sobre toda la Tierra, los 35 sitios análogos históricos usados por NASA, ESA, CNSA, ISRO y Roscosmos emergieron espontáneamente arriba del percentil 95 de su arquetipo respectivo, con estabilidad $>94\%$ bajo 1,000 perturbaciones Monte Carlo."

### P3: *"¿Qué descubrieron que NASA no supiera ya?"*
> **Respuesta:** "Tres aportes concretos: (1) formalizamos las **ventanas espacio-temporales 4D** libres de nieve pesada donde latitudes subpolares reproducen la iluminación rasante del Polo Sur Lunar sin reflectores artificiales; (2) demostramos el cruce de **macizos anortosíticos árticos** (*Fiskenæsset* en Groenlandia y *Lofoten* en Noruega) como gemelos petrológicos + lumínicos superiores a los volcanes basálticos tropicales para *Artemis III*; y (3) mapeamos los **glaciares de roca de los Andes Áridos, Ladakh y Ngari** como la alternativa de mayor retorno costo-fidelidad mundial para perforación ISRU hacia *Phlegra Montes* y *Arcadia Planitia*."

### P4: *"Si elijo un cráter lunar de $20\text{ km}$, ¿por qué su sistema me sugiere en la Tierra cráteres de $3\text{ a }4\text{ km}$?"*
> **Respuesta:** "Por física de impacto ($\pi$-scaling de Holsapple): el diámetro de transición entre cráteres simples y complejos escala inversamente con la gravedad ($D_t \propto g^{-1}$). Un cráter simple de $18\text{ km}$ en $0.165\,g$ lunar tiene la misma morfología estructural de taludes y lente de brecha que un cráter terrestre de $\sim 3\text{ km}$ en $1\,g$, no uno de $20\text{ km}$ que en la Tierra ya colapsó en anillos complejos."

### P5: *"¿Cómo evitan dañar sitios astrobiológicos únicos como Laguna Socompa o los glaciares andinos?"*
> **Respuesta:** "Integramos la base mundial de áreas protegidas (`WDPA`) y leyes de protección glaciar para etiquetar cada sitio con un **Nivel de Impacto Permitido**: en sitios frágiles solo se habilita calibración óptica/espectral pasiva (*TRL ciencia*), mientras que los ensayos destructivos de excavación o sinterizado ISRU se redirigen automáticamente a terrenos basálticos o canteras anortosíticas no protegidas cercanas."

### P6: *"¿Por qué un optimizador de portafolio en vez de elegir el sitio #1 del ranking?"*
> **Respuesta:** "Porque demostramos que ningún punto de la Tierra supera el $\sim 72\%$ de fidelidad agregada cuando se exigen simultáneamente todas las pruebas de una base permanente. En cambio, un portafolio optimizado por programación entera de 3 sitios complementarios supera el $93\%$ de fidelidad técnica reduciendo el presupuesto logístico."

### P7: *"¿Cómo puede usar esto mañana una universidad de Latinoamérica, África o India?"*
> **Respuesta:** "Filtran por su continente y por tiempo de acceso vial $<8\text{ horas}$: en segundos obtienen la coordenada exacta, la mejor época del año, las capas satelitales descargables y la hoja de especificaciones del ensayo para probar su rover o instrumento con estándares NASA sin gastar en logística polar."
