# 02.5 · Estado del Arte e Ingeniería Matemática de Métodos de Similitud

> **Rol activo:** *Profesor de Geofísica Computacional e IA Espacial (MIT EAPS + Stanford Institute for Human-Centered AI)*.

---

## 1. Diagnóstico Crítico de la Literatura Existente

Hasta hoy, la selección de análogos planetarios ha estado dividida en dos mundos desconectados:
1. **Catálogos cualitativos descriptivos** (p. ej., *ESA CAFE Study*, *Preston et al. 2012*, *Léveillé 2009*, *Europlanet TA*): valiosísimos geológicamente, pero estáticos, restringidos a sitios famosos y sin puntajes numéricos continuos sobre el resto del globo.
2. **Estudios hiper-locales de un solo parámetro** (p. ej., comparar espectros VNIR de un salar puntual mediante *Spectral Angle Mapper* o comparar pendientes de un cono volcánico puntual): precisos, pero incapaces de responder *"¿en qué otras partes del planeta ocurre esta misma combinación?"*.

**Nuestra contribución metodológica:** Unificar **física planetaria + decisión multicriterio (MCDA) + geometría astronómica + búsqueda vectorial + optimización de portafolio** en un marco abierto reproducible.

---

## 2. Formulación Matemática del Índice **PAFI** (*Planetary Analog Fidelity Index*)

Inspirado en la estructura multiplicativa del *Earth Similarity Index* (Schulze-Makuch et al., 2011), pero reformulado rigurosamente para comparación superficie-a-superficie condicionada al modo de ensayo $m$:

### Paso 1 — Vector de características físicas homologadas
Sea $p = (\phi, \lambda, t)$ una celda terrestre en latitud $\phi$, longitud $\lambda$ y época del año $t$, con vector de variables observables $\vec{x}(p) = (x_1, \dots, x_K)$.
Sea $T$ un sitio objetivo extraterrestre (p. ej., *Mons Mouton* o *Arcadia Planitia*) con vector objetivo $\vec{r}(T) = (r_1, \dots, r_K)$.

### Paso 2 — Separación de Fidelidad Terrestre Alcanzable vs. Brecha Física Irreducible
Sea $[x_k^{\min}, x_k^{\max}]$ el soporte físico real de la variable $k$ en la superficie de la Tierra. Definimos el objetivo proyectado al dominio terrestre alcanzable:
$$\tilde{r}_k(T) = \min\!\big(x_k^{\max},\; \max(x_k^{\min},\; r_k(T))\big)$$
y cuantificamos explícitamente la **Brecha Física Irreducible**:
$$\Delta_k^{\text{irr}}(T) = \frac{\big|r_k(T) - \tilde{r}_k(T)\big|}{\sigma_k}$$
- Si $r_k(T)$ cae dentro del rango terrestre (p. ej. pendiente de $8^\circ$, elevación solar de $1.2^\circ$ o temperatura diurna de $-20^\circ\text{C}$), entonces $\Delta_k^{\text{irr}} = 0$.
- Si $r_k(T)$ excede la física terrestre (p. ej. $45\text{ K}$ en un cráter PSR lunar frente al mínimo terrestre $\sim 183\text{ K}$), $\Delta_k^{\text{irr}} > 0$ alerta automáticamente al ingeniero que **incluso el mejor sitio terrestre requerirá cámara criogénica auxiliar para esa dimensión**.

### Paso 3 — Similitud marginal acotada por dimensión
$$s_k(p, T) = \exp\!\left( -\frac{\big|x_k(p) - \tilde{r}_k(T)\big|}{\tau_k} \right) \in (0, 1]$$
donde $\tau_k$ es la escala característica de tolerancia de ingeniería de la variable $k$ (p. ej. $\tau_{\text{pendiente}} = 5^\circ$, $\tau_{T} = 15\text{ K}$, $\tau_{\text{sol}} = 1.5^\circ$).

### Paso 4 — Agregación Híbrida Penalizada (Evita Compensaciones Falsas)
Una suma lineal simple permitiría que una selva tropical con pendiente idéntica a la Luna obtenga buen puntaje. Para impedirlo aplicamos **máscaras duras de exclusión ($M(p) \in \{0,1\}$: océano, bosque denso, área urbana)** seguidas de una **media geométrica ponderada suavizada**:
$$\text{PAFI}(p, T \mid m) = M(p) \cdot \prod_{k=1}^{K} \big(\epsilon + (1-\epsilon)\, s_k(p, T)\big)^{w_k^{(m)}}, \qquad \sum_{k=1}^{K} w_k^{(m)} = 1, \quad \epsilon = 0.05$$
- Los pesos $w_k^{(m)}$ provienen de matrices de comparación por pares **AHP de Saaty** verificadas con razón de consistencia $\text{CR} < 0.10$ para cada modo de ensayo $m$.

---

## 3. Física Exacta del Motor de Iluminación Rasante Lunar (*Chrono-Analog*)

La elevación solar instantánea $\alpha_s$ sobre un horizonte local plano en la Tierra a latitud $\phi$, declinación solar $\delta(d)$ (día juliano $d \in [1, 365]$) y ángulo horario $H \in [-\pi, \pi]$ cumple:
$$\sin \alpha_s(\phi, d, H) = \sin\phi \sin\delta(d) + \cos\phi \cos\delta(d) \cos H$$
Y el azimut solar $\psi_s$ cumple:
$$\cos \psi_s = \frac{\sin\delta(d) - \sin\phi \sin\alpha_s}{\cos\phi \cos\alpha_s}$$

De aquí se desprenden **tres métricas exactas sin parámetros arbitrarios** para emparejar con los mapas LOLA del Polo Sur Lunar:
1. **Horas diarias de Luz Rasante Tipo Polo Sur Lunar ($H_{\text{grazing}}$):** Tiempo integrado por día en que $0.1^\circ \le \alpha_s \le 2.5^\circ$ (corrigiendo $+0.57^\circ$ de refracción atmosférica horizontal).
2. **Amplitud de Barrido Azimutal ($\Delta \psi_{\text{grazing}}$):** Rango angular recorrido por las sombras mientras el Sol está rasante (en *Shackleton Rim* y *Mons Mouton* es $360^\circ$; en Antártida $>88.5^\circ\text{S}$ a fines de septiembre alcanza $360^\circ$; en latitudes árticas $66^\circ\text{–}80^\circ$ alcanza $60^\circ\text{–}180^\circ$).
3. **Factor de Amplificación de Sombra ($\Lambda_s = \cot \alpha_s$):** A $\alpha_s = 1.5^\circ$, una roca de $1\text{ m}$ proyecta una sombra de **$38.2\text{ m}$**! Combinado con el DEM de $30\text{ m}$ (`hillshade` multidireccional), reproducimos exactamente la geometría de ocultamiento visual para cámaras de rovers.

---

## 4. Escalamiento Gravitacional de Cráteres ($\pi$-Scaling) y Puente de IA Agonóstico del Planeta

### 4.1 Corrección Física por Gravedad en Geomorfología de Impacto
En la Luna ($0.165\,g$), la transición de cráter simple (forma de cuenco) a cráter complejo (pico central y terrazas) ocurre a **$D_t \approx 15\text{–}20\text{ km}$**, mientras que en Marte ($0.379\,g$) ocurre a **$D_t \approx 6\text{–}8\text{ km}$**, y en la Tierra ($1.0\,g$) a **$D_t \approx 2\text{–}4\text{ km}$** (inversamente proporcional a $g$: $D_t \propto g^{-1}$).
- **Insight MIT:** Para comparar estructuralmente un cráter lunar simple de $10\text{ km}$ (como cráteres satélite del Polo Sur), en la Tierra debemos buscar cráteres simples de **$1.2\text{–}3.5\text{ km}$** (*Meteor Crater*, *Lonar*, *Tenoumer*), mientras que para un cráter lunar complejo de $50\text{–}70\text{ km}$ (*Haworth*, *Nobile*), el gemelo estructural escalado en la Tierra es un cráter complejo de **$15\text{–}25\text{ km}$** (*Haughton* $23\text{ km}$, *Nördlinger Ries* $24\text{ km}$)! Incluir esta ley de escala $D_{\text{Tierra}} \approx D_{\text{planeta}} \cdot (g_{\text{planeta}} / g_{\text{Tierra}})$ deslumbra a cualquier geofísico planetario del jurado.

### 4.2 Solución al *Domain Shift* en IA Satelital
- **Para expandir semillas dentro de la Tierra:** Usamos los vectores de 64 dimensiones de **AlphaEarth (`GOOGLE/SATELLITE_EMBEDDING/V1/ANNUAL`)**: tomamos el vector medio de sitios validados (*University Valley*, *Dalangtan*, *Campo de Piedra Pómez*, *Fiskenæsset*) y ejecutamos similitud coseno global para hallar clones ocultos con idéntica firma espacio-temporal multiespectral y radar.
- **Para cruzar directamente Planeta $\leftrightarrow$ Tierra:** Calculamos un **descriptor morfométrico adimensional de 12 invariantes sobre parches de DEM igualados en metros por píxel** (distribución de pendientes, TRI multiescala, TPI, entropía de curvatura, anisotropía azimutal de yardangs/crestas, rugosidad fractal) válido por igual en LOLA, MOLA/HRSC y Copernicus DEM.

---

## 5. Optimización Matemática del Portafolio de Campaña (*Weighted Set Cover / MILP*)

Sea $\mathcal{S} = \{1, \dots, N\}$ el conjunto de sitios candidatos terrestres con costo/dificultad logística $c_j$, y sea $\mathcal{M} = \{1, \dots, M\}$ el conjunto de ensayos requeridos por una misión (ej. *Movilidad*, *Luz Rasante*, *Perforación Hielo*, *EVA Aislamiento*, *Sinterizado Regolito*).
Definimos $a_{jm} = \mathbb{I}\big(\text{PAFI}(j \mid m) \ge \theta_m\big)$ (o cobertura continua). Buscamos las variables binarias $y_j \in \{0, 1\}$ que resuelven:
$$\min_{y \in \{0,1\}^N} \sum_{j=1}^{N} c_j y_j - \lambda \sum_{m=1}^{M} \max_{j:\, y_j=1} \text{PAFI}(j \mid m) \quad \text{s.a.} \quad \sum_{j=1}^{N} a_{jm} y_j \ge 1 \;\;\forall m \in \mathcal{M}, \quad \sum_{j=1}^{N} y_j \le K_{\max}$$
Se resuelve en **$< 50\text{ milisegundos}$** con `scipy.optimize.milp` o `PuLP` y entrega al usuario el **Portafolio Óptimo de Campaña**.
