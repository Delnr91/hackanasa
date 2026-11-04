---
name: pafi-analog-engine
description: >-
  Especificación matemática y geoespacial para construir el índice PAFI (Planetary Analog Fidelity Index),
  el cálculo de Brecha Física Irreducible, el motor astronómico Chrono-Luna de luz rasante polar,
  escalamiento gravitacional de cráteres y optimización Set Cover usando Google Earth Engine y datos NASA.
  Activar al diseñar, programar o auditar el pipeline de datos y similitud durante el hackathon.
---

# Skill: Motor PAFI & Chrono-Luna

## Referencias Directas del Proyecto
- Objetivos Lunares (9 regiones Artemis III, ILRS, tubos de lava): [`01_sitios_objetivo_luna.md`](../../../02_investigacion_global/01_sitios_objetivo_luna.md)
- Objetivos Marcianos (Arcadia, Phlegra, Utopia, Jezero, Oxia): [`02_sitios_objetivo_marte.md`](../../../02_investigacion_global/02_sitios_objetivo_marte.md)
- IDs exactos de Earth Engine y APIs planetarias: [`04_datasets_recursos_libres.md`](../../../02_investigacion_global/04_datasets_recursos_libres.md)
- Ecuaciones completas y pesos AHP: [`05_estado_del_arte_metodos.md`](../../../02_investigacion_global/05_estado_del_arte_metodos.md) y [`01_arquitectura_tecnica.md`](../../../05_plan_ejecucion/01_arquitectura_tecnica.md)

## Reglas de Implementación y Verificación
1. **Máscaras duras primero:** Excluir cuerpos de agua permanentes, cobertura urbana y vegetación densa ($\text{NDVI} > 0.12$) antes de agregar puntajes.
2. **No colapsar arquetipos incompatibles:** Evaluar por separado `L1 (Highlands Anortosíticas + Luz Polar)`, `L2 (Cráter/PSR)`, `L3 (Mare/Tubos de Lava)` y `M1–M4 (Marte)`.
3. **Reportar siempre dos números:** $\text{PAFI} \in [0,1]$ (fidelidad terrestre relativa) y $\Delta_k^{\text{irr}}$ (brecha física irreducible fuera del soporte terrestre).
4. **Validación obligatoria:** Correr *back-testing* contra los 35 sitios ✅ de [`03_analogos_terrestres_global.md`](../../../02_investigacion_global/03_analogos_terrestres_global.md) y verificar que la mediana supere el percentil 95 antes de publicar descubrimientos nuevos.
