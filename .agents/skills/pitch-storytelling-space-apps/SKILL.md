---
name: pitch-storytelling-space-apps
description: >-
  Construye y afina la historia del proyecto para NASA Space Apps 2026 con los patrones de los 10
  ganadores globales 2025 (dispositivo narrativo, enemigo claro, índice con nombre propio, dataset
  NASA exacto, demo pública). Produce el Summary de 3 golpes para la página de proyecto (inglés),
  el guion del video de 30 s, el deck de máx. 7 slides, el pitch local de 3 min + 2 min de Q&A
  (formato tipo Nómada/Demo Day La Araucana) y la diapositiva de créditos sin logos prohibidos.
  Úsala para escribir, reescribir o ensayar cualquier pitch o texto de presentación del hackathon.
---

# Skill · Pitch & Storytelling Space Apps (versión local y global)

Fuentes de verdad:
- [`00_desafio/07_pitch_storytelling_ganadores_y_logos.md`](../../../00_desafio/07_pitch_storytelling_ganadores_y_logos.md): disección de los 10 ganadores 2025 y política de logos.
- [`00_desafio/03_rubrica_oficial_global_2026.md`](../../../00_desafio/03_rubrica_oficial_global_2026.md): límites duros (30 s / 7 slides / inglés / menores / IA).
- [`00_desafio/06_rubrica_nomada_usqai_y_cruce.md`](../../../00_desafio/06_rubrica_nomada_usqai_y_cruce.md): formato y pesos del pitch local.
- [`05_plan_ejecucion/06_dos_partes_stack_motion_identidad.md`](../../../05_plan_ejecucion/06_dos_partes_stack_motion_identidad.md): Parte A (Explorador) y Parte B (Misión).

## Principios
1. **Una historia, cuatro cortes:** Summary escrito, video de 30 s, deck de ≤7 slides y pitch de 3 min cuentan **lo mismo**, a distinta resolución.
2. **Prueba > adjetivos.** Cada afirmación lleva dataset NASA exacto, cifra con fuente o demo. Nada de "revolucionario" sin evidencia.
3. **Honradez física:** nunca "idéntico a Marte"; decir qué es análogo, cuánto y qué no.
4. **Personas adultas** en imágenes y voces; ningún menor reconocible.
5. **Logos:** ninguno de NASA. Créditos en texto. Logos de La Araucana, UCN o Nómada solo con permiso escrito y solo en la versión local.

## Paso 1 · Elegir el dispositivo narrativo (uno solo)
| Dispositivo | Ganador 2025 que lo usó | Versión para nosotros |
|---|---|---|
| Narrador no humano | A Solar Tale (el Sol narra) | La Luna, Marte o una roca de Atacama cuenta en qué se parece y en qué no |
| Protagonista con viaje | Henry's Farm Adventure | Un personaje de papel (adulto) que viaja Antofagasta → Luna → Marte |
| Pregunta-amenaza | PureFlow ("¿Sobreviviría tu hábitat…?") | "¿Sobreviviría tu rover a este lugar… hoy?" |
| Índice con nombre propio | Astro Sweepers (ASRI) | Índice de fidelidad bautizado (p. ej. PAFI) con antes/después |
| Brecha del statu quo | SpaceGenes+ ("todos lo miran aislado") | "Los análogos se eligen por parecido visual o por costumbre; nadie mide dimensión por dimensión" |
| Cifra brutal local | QUEÑARIS (14 L/s → 0) | Un número verificable del territorio (con fuente) |
| Enemigo = error | Resonant (falsos positivos) | El "falso análogo": se parece en la foto, falla en la física |

Recomienda **uno** para la Parte A y verifica que la Parte B lo sostenga con datos.

## Paso 2 · Summary de 3 golpes (inglés, 120–180 palabras)
1. *We developed **[Name]**, a [tool type] that [verb + outcome] using [exact NASA datasets].*
2. *It addresses the challenge by [mechanism]; unlike [status quo], it [difference], and it states where the analogy breaks down.*
3. *This matters because [human/mission consequence + one sourced number].*

Comprueba: nombra el desafío, nombra los datasets exactos, incluye un límite físico y no promete lo que la demo no muestra.

## Paso 3 · Video de 30 s (guion oficial)
| Seg. | Contenido | Plano sugerido |
|---|---|---|
| 0:00 | Nombre + equipo | Logo propio de papel |
| 0:02 | Desafío + inspiración | Capas de papel Antofagasta → Luna |
| 0:05 | Título + tagline | Texto grande |
| 0:10 | Cómo funciona + datos NASA/socios | Captura real de la demo con rótulos de fuente |
| 0:20–0:30 | Futuro: personas, mundo y más allá | Capas que se abren a Marte |
Subtítulos en inglés quemados; voz adulta; marca de agua en cualquier toma generada con IA; duración final ≤ 30,0 s.

## Paso 4 · Deck de ≤7 slides (si se usa slides en vez de video)
1. Título + tagline + equipo, miembros y desafío · 2. Problema (persona + cifra) · 3. Solución (imagen del producto) · 4. Experiencia de usuario · 5. Datos NASA y de agencias socias (cómo lo hacen posible) · 6. Prueba: back-testing / límites · 7. Futuro + **Data & Credits** en texto.

## Paso 5 · Pitch local de 3 min + 2 min de Q&A
Pesos de referencia (Nómada, ya ganado por el equipo): problema 20 %, solución 30 %, modelo 20 %, prototipo 20 %, comunicación 10 %. Mapéalos a los 5 criterios NASA.
| Tiempo | Bloque |
|---|---|
| 0:00–0:15 | Gancho (dispositivo elegido) |
| 0:15–0:45 | Problema: persona de la región + cifra con fuente + problema de misión |
| 0:45–1:45 | Demo en vivo Parte A → salto a Parte B (dato NASA + límites) |
| 1:45–2:15 | Por qué ahora + prototipo (diapositiva de arquitectura) |
| 2:15–2:40 | Sostenibilidad: abierto, gratuito, costo ≈ 0, alianzas; ODS 8, 9, 10 (+4, 13) |
| 2:40–3:00 | Equipo + pedido concreto + cierre que vuelve al gancho |
Prepara 8 preguntas probables del jurado con respuesta de ≤20 s (por ejemplo: "¿por qué no Atacama?", "¿qué no reproduce la Tierra?", "¿cómo se sostiene?", "¿qué dato NASA es el núcleo?", "¿cómo protegen la privacidad?").

## Paso 6 · Revisión final
- Corre la skill `validador-space-apps-2026` en modo **"valida el video"** o **"pitch local"**.
- Cronometra: 30 s del video y 3:00 del pitch, ambos con margen de ±2 s.
- Lee el Summary en voz alta: si una frase no se entiende sin contexto, reescríbela.

## Salida esperada
1. Dispositivo narrativo elegido + por qué.
2. Summary en inglés (y su traducción al español para el equipo).
3. Guion de 30 s con tiempos y planos.
4. Esquema de 7 slides o del pitch de 3 min, según se pida.
5. Lista de preguntas del jurado con respuestas cortas.
6. Diapositiva "Data & Credits" en texto.
