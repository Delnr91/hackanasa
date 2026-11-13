# 00.6 · Rúbrica Nómada (USQAI-UCN) Evaluada y Cruce con NASA y La Araucana

> **Contexto:** el equipo ganó **1er lugar regional** en el programa de preincubación **Nómada: Muévete con tu emprendimiento 2026** (Laboratorio de Emprendimiento USQAI, Universidad Católica del Norte). Este documento evalúa sus bases y su rúbrica (leídas el 13-nov-2026) para **reutilizar lo que ya funcionó** en el Demo Day local de Space Apps.
> **Privacidad:** no copiamos nombres, correos ni teléfonos de personas del programa; solo la estructura y los criterios.
> **Pendiente:** la "skill Nómada" que GPT generó está en la carpeta grupal de Drive, que **requiere inicio de sesión**. Para integrarla, exportarla (o copiar su texto) a `.agents/skills/nomada-gpt/SKILL.md` y correr el validador sobre ella (ver §5).

---

## 1. Qué es Nómada y cómo evalúa (hechos de las bases)

- **Foco:** emprendimiento **dinámico, tecnológico, sostenible y de alto crecimiento**; objetivos explícitos en **ODS**, **descarbonización justa** y **liderazgo femenino**.
- **Ruta:** exploratoria (ecosistema, **ODS**) → avanzada (problema y usuario, ideación y propuesta de valor, prototipo, bootcamp, modelo de negocio y pitch, financiamiento CORFO Semilla Inicia).
- **Formato de pitch:** **3 min de pitch + 2 min de preguntas** (preselección online: 3 min + hasta 10 min de preguntas). Presenta **una sola persona**; en las preguntas responde cualquiera. Jurado de **5** (híbrido interno/externo) en Pitch Day y Demo Day.
- **Cálculo:** Pitch Day regional = **60 % pitch + 40 % desempeño** acumulado. Demo Day interregional = **100 % pitch**.
- **Bonus:** **+10 puntos por equidad de género** en el equipo; hasta +20 por desafíos sorpresa del bootcamp.

### Rúbrica de pitch (10 = logrado · 5 = parcial · 1 = no logrado)
| Criterio | Peso | Qué es un 10 (paráfrasis) |
|---|---|---|
| 1. Claridad del problema | **20 %** | Comunica el problema con solidez, alcance y relevancia |
| 2. Solución | **30 %** | Sólida, innovadora y efectiva frente al problema |
| 3. Modelo de negocios | **20 %** | Fuentes de ingreso, propuesta de valor y segmento de clientes coherentes |
| 4. Prototipo | **20 %** | La diapositiva de prototipo muestra con claridad el diseño técnico y cómo responde a la necesidad |
| 5. Comunicación efectiva | **10 %** | Dicción, ritmo y expresión que mantienen la atención todo el tiempo |

### Rúbrica de desempeño (40 % del Pitch Day regional)
Asistencia a talleres (5/3/0 por ruta), entrega de 3 tareas (5/0 c/u), checkpoints I y II (10/0 c/u) y bootcamp (asistencia, tarea, participación activa, presentación del proyecto y encuesta: 10/5/0 c/u).

---

## 2. Evaluación: qué sirve para Space Apps y qué no

| Elemento Nómada | ¿Transferible? | Por qué |
|---|---|---|
| Pitch de 3 min + 2 min de preguntas, un solo expositor | ✅ **Sí** | Es el formato más probable del Demo Day local (no publicado); ensayar exactamente así |
| Claridad del problema (20 %) | ✅ | Equivale a *Impact* + *Presentation* NASA |
| Solución innovadora (30 %) | ✅ | Equivale a *Creativity* + *Validity* |
| Prototipo (20 %) con diapositiva de diseño técnico | ✅ **Muy útil** | Space Apps premia la demo funcionando; añadir la diapositiva de arquitectura |
| Comunicación (10 %) | ✅ | NASA da a *Presentation* el mismo peso que a los demás (≈20 %) → **subirle el esfuerzo** |
| Modelo de negocios (20 %) | ⚠️ **Parcial** | NASA no lo puntúa. Para La Araucana sirve como **modelo de sostenibilidad** (abierto, gratuito, financiamiento institucional/educativo, alianzas), no como venta a usuarios |
| ODS y descarbonización | ✅ | No es criterio NASA, pero suma ante La Araucana (que declara ODS 8, 9 y 10) |
| Equidad de género (+10) | ✅ como valor | No es criterio NASA; La Araucana financia becas STEM para mujeres y niñas → mostrar un equipo diverso suma narrativa |
| Desempeño acumulado (40 %) | ❌ | Space Apps no tiene puntaje de proceso |
| Uso de imagen UCN/USQAI | ❌ sin permiso | Bases 11.d: prohibido sin autorización previa |
| Restricción de categoría (media/superior/comunidad) | ↔ | Space Apps Chile usa niveles Principiante/Intermedio/Avanzado (2024–2025) |

---

## 3. Cruce de las tres rúbricas (MECE)

| Dimensión | NASA (1–5, todos los niveles) | La Araucana (inferida) | Nómada (pitch) | Pieza única que cubre las tres |
|---|---|---|---|---|
| Problema | Impact | Personas, brechas, territorio | Claridad del problema 20 % | Persona adulta de la región + cifra local + problema de misión |
| Solución | Creativity + Validity | Innovación con propósito | Solución 30 % | Motor de análogos por dimensión + modo educativo |
| Prueba técnica | Validity + Relevance (datos NASA en el núcleo) | Que funcione en vivo | Prototipo 20 % | Demo pública + diapositiva de arquitectura con datasets NASA |
| Sostenibilidad | — | ODS, sostenibilidad | Modelo de negocios 20 % | Modelo abierto: gratis para usuarios; costos ≈ 0 (sitio estático); alianzas educativas |
| Comunicación | Presentation | Pitch emocionante | Comunicación 10 % | Historia SCR con dispositivo narrativo (ver doc 07) |

---

## 4. Qué reusar tal cual del método Nómada
1. **Problema → usuario → propuesta de valor → prototipo → modelo → pitch**: es el mismo orden que necesita la página de proyecto.
2. **Lienzo de propuesta de valor** para cada uno de los dos públicos (Parte A educativa y Parte B científica).
3. **Ensayo cronometrado** con jurado simulado de 5 personas y preguntas de 2 min.
4. **Diapositiva de prototipo** con diseño técnico (arquitectura + flujo de datos).

---

## 5. Cómo integrar la skill de GPT cuando esté disponible
1. Exportar el archivo desde la carpeta "Mi ruta nómada" (Drive) y guardarlo en `.agents/skills/nomada-gpt/SKILL.md`.
2. Correr: *"usa la skill validador-space-apps-2026 para revisar `.agents/skills/nomada-gpt/SKILL.md` contra la rúbrica Nómada de este documento"*.
3. Conservar solo lo que no se contradiga con [`03_rubrica_oficial_global_2026.md`](03_rubrica_oficial_global_2026.md) (por ejemplo, el modelo de negocios no puede desplazar a los datos NASA del núcleo) y quitar cualquier dato personal antes de subirlo a un repo público.

---

## Fuentes
- *Bases Generales Programa de Preincubación Nómada: Muévete con tu Emprendimiento 2026* (USQAI-UCN), PDF compartido en la guía de ruta formativa del programa.
- *Rúbrica de evaluación Nómada 2026, sede Antofagasta* (Canva, 8 páginas).
- *Guía ruta formativa Nómada* (Google Docs del programa).
