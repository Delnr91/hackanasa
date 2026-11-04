# 05.2 · Roadmap Táctico de 48 Horas (14–15 de Noviembre de 2026)

> **Rol activo:** *Scrum Master de Misión Rápida (JPL A-Team / Stanford d.school Sprint)*.

---

## Fase 0 — "Afilar el Hacha" Antes del 14 de Noviembre (100 % Permitido por Reglas)

Todo lo que está en esta carpeta `hackanasa/` es preparación legítima de investigación y estrategia:
- [x] Marco McKinsey completo, árbol MECE e hipótesis falsables (`01_mckinsey/`).
- [x] Parámetros físicos y coordenadas de 12 objetivos lunares y 8 objetivos marcianos (`02.1`, `02.2`).
- [x] Catálogo global de 58 sitios terrestres (35 de control + 23 descubrimientos) en 8 regiones (`02.3`).
- [x] IDs exactos de colecciones abiertas en Google Earth Engine y APIs de NASA Trek/PDS (`02.4`).
- [x] Fórmulas matemáticas cerradas de **PAFI**, **Chrono-Luna**, **$\pi$-scaling** y **Set Cover** (`02.5`).
- [x] Diccionario en 12 idiomas y dossier de 34 papers científicos clave (`02.6`, `02.7`).
- [x] Agentes y Skills listos en `.agents/` + tu skill de pitch.
- [ ] **Acción administrativa tuya antes del viernes 13 nov:** Verificar cuenta activa de Google Earth Engine (no comercial), cuenta GitHub Pages/Vercel y confirmar el texto literal final de la página del desafío cuando abran los detalles completos.

---

## Día 1 — Sábado 14 de Noviembre (Ciencia, Datos y Motor Validado)

| Bloque Horario | Foco Táctico | Entregable Verificable (*Gate*) |
|---|---|---|
| **H 00 – H 02** | **Lectura literal del desafío + Alineación McKinsey:** Contrastar cada línea oficial del prompt 2026 contra nuestro `00_desafio/` y fijar alcance congelado P0/P1. | *Scope Freeze* firmado por el equipo. |
| **H 02 – H 07** | **Frente Datos (Pista A):** Cargar en GEE las 8 capas terrestres, aplicar máscara dura (océano/bosque/urbano) y muestrear tanto una grilla global ligera como los 58 sitios del catálogo + candidatos nuevos.<br>**Frente Física (Pista B):** Implementar la ecuación solar esférica *Chrono-Luna* ($365\text{ días} \times \text{latitud}$) cruzada con ausencia de nieve. | Tablas limpias `sites_metrics.json` + matriz `chrono_luna_365.json`. |
| **H 07 – H 11** | **Motor PAFI + Brecha Irreducible:** Calcular puntajes para los 6 modos de ensayo (`M-L1` a `M-H`) y correr el **Back-testing ciego** sobre los 35 sitios de control. | Tabla de validación: mediana de sitios oficiales en percentil $\ge 95$. |
| **H 11 – H 15** | **Caza de Descubrimientos + Caso Local:** Filtrar píxeles/regiones de alto PAFI fuera de los análogos clásicos (verificar visualmente top candidatos en Sentinel-2: Fiskenæsset, Lofoten, Glaciares de Roca de San Juan/Mendoza, Puna/Socompa, Campo de Piedra Pómez, Payunia, Yakutia, Ngari, Kunene). | 12+ fichas de descubrimiento con coordenadas exactas e imagen satelital. |
| **H 15 – H 19** | **Esqueleto Frontend Indestructible:** Levantar app web estática con `MapLibre GL` / `Cesium`, conectando capas WMTS de NASA Moon/Mars Trek a la izquierda y mapa terrestre a la derecha. | URL pública en vivo (`v0.1` funcional en la nube antes de dormir!). |
| **H 19 – H 24** | Descanso rotativo obligatorio (mínimo 5 h de sueño para no destruir la claridad del Día 2). | Mente fresca para UX y Pitch. |

---

## Día 2 — Domingo 15 de Noviembre (UX Wow, Optimización y Pitch Ganador)

| Bloque Horario | Foco Táctico | Entregable Verificable (*Gate*) |
|---|---|---|
| **H 24 – H 29** | **Momentos Wow Visuales:** Integrar el deslizador de 365 días de *Chrono-Luna*, el gráfico radar comparativo de 8 ejes con alerta de **Brecha Física Irreducible**, y el **Optimizador de Portafolio** (*Set Cover*). | Demo interactiva `v1.0` completa. |
| **H 29 – H 33** | **Robustez Científica + Modo Sede Local:** Correr simulación Monte Carlo (1,000 corridas de sensibilidad de pesos) y habilitar el botón destacado **"Corredor Análogo Local (Andes / Puna / Payunia)"** junto al modo **"Global Atlas"**. | Gráficos de validación exportados en alta resolución. |
| **H 33 – H 37** | **Auditoría del Abogado del Diablo:** Invocar al agente `.agents/agents/abogado-del-diablo` sobre la demo, las cifras y el README para cazar cualquier inconsistencia física o link roto. | Checklist de *Validity* y *Relevance* 100 % verde. |
| **H 37 – H 43** | **Activación de tu Skill de Pitch:** Construir guion SCR, presentación visual, página oficial de entrega Space Apps y video de demostración (30 s / 2–3 min según reglamento de sede) mostrando la herramienta real en acción desde el segundo 3. | Video renderizado y subido con permisos públicos verificados en ventana incógnito. |
| **H 43 – H 46** | **Envío Temprano (*Soft Submission*):** Cargar todo en la plataforma de Space Apps **2 horas antes del cierre** para evitar saturación de servidores. | Proyecto enviado oficialmente. |
| **H 46 – H 48** | **Pulido final y ensayo de Q&A en vivo** usando la tabla de preguntas difíciles de jueces (`05.3`). | 🏆 Listos para defender en Sede Local y evaluación Global. |
