# AGENTS.md — Mapa de navegación para agentes de IA

> Punto de entrada para cualquier agente que trabaje en este repositorio.
> NO es una biblia de reglas: es un **mapa**. Lee solo lo que necesites cuando lo necesites.

---

## 1. Antes de empezar (obligatorio)

1. Ejecuta `init.ps1` y verifica que termina sin errores.
   ```powershell
   PowerShell -ExecutionPolicy Bypass -File init.ps1
   ```
   Si falla, **para** y resuelve el entorno antes de analizar nada.
2. Lee `progress/current.md` para entender en qué estado quedó la última sesión.
3. Lee `requirements.json` y confirma qué cláusulas tienen estado `pending`.

---

## 2. Mapa del repositorio

| Archivo / carpeta              | Qué contiene                                                        | Cuándo leerlo              |
|-------------------------------|---------------------------------------------------------------------|----------------------------|
| `requirements.json`           | Requisitos ISO 19650 con estado por cláusula                        | Siempre, al empezar        |
| `progress/current.md`         | Estado de la sesión activa                                          | Siempre, al empezar        |
| `progress/history.md`         | Bitácora append-only de sesiones anteriores                         | Si necesitas contexto histórico |
| `progress/index_artifacts.md` | Índice de artefactos del proyecto auditado (generado por el Indexer) | Antes de analizar          |
| `docs/clauses_19650-2.md`     | Referencia normativa por cláusula                                   | Antes de clasificar evidencia |
| `docs/artefact_checklist.md`  | Listas de verificación por tipo de artefacto (EIR, BEP, MIDP...)   | Durante el análisis        |
| `docs/gap_severity.md`        | Criterios de riesgo ALTO / MEDIO / BAJO                             | Durante análisis de gaps   |
| `CHECKPOINTS.md`              | Criterios objetivos de "auditoría completa"                         | Para auto-evaluarte        |
| `.claude/agents/`             | Definiciones de Leader, Indexer, Analyzer, Gap Analyst, Reporter    | Si orquestas trabajo       |

---

## 3. Flujo de auditoría en una línea

```
Documentos del proyecto + Excel requisitos
  └─→ Indexer    → progress/index_artifacts.md
        └─→ Analyzer (por cláusula) → progress/analysis_clause_X_X.md
              └─→ Gap Analyst (NC/PC) → progress/gaps_nc_pc.md
                    └─→ Reporter → SALIDA_1_trazabilidad.md + SALIDA_2_informe.md
```

---

## 4. Fases de la auditoría

| Fase | Agente responsable | Output en disco |
|------|-------------------|-----------------|
| 1 — Indexación de artefactos | `indexer` | `progress/index_artifacts.md` |
| 2 — Análisis por cláusula | `analyzer` | `progress/analysis_clause_X_X.md` (uno por cláusula) |
| 3 — Análisis de gaps | `gap_analyst` | `progress/gaps_nc_pc.md` |
| 4 — Generación de outputs | `reporter` | `SALIDA_1_trazabilidad.md` + `SALIDA_2_informe.md` |

---

## 5. Reglas duras

- **Una cláusula a la vez.** El Analyzer no mezcla cláusulas en un solo archivo.
- **No declares un requisito `complete` sin evidencia documentada.** Un BEP existe ≠ el requisito está cubierto.
- **Documenta en `progress/current.md` mientras trabajas**, no al final.
- **Cada clasificación cita la cláusula exacta.** Nunca emitas un juicio sin referencia normativa.
- **La coherencia entre artefactos es un requisito.** Un EIR y un BEP que se contradicen es una NC aunque cada documento por separado parezca correcto.
- **Si no tienes acceso al CDE real o a los metadatos de archivos**, marca los requisitos correspondientes como `PR`. No inventes conformidad.
- **Multi-proyecto:** no extrapoles evidencias entre proyectos distintos.

---

## 6. Cómo elegir una cláusula a analizar

```
1. Abre requirements.json
2. Filtra por status == "pending"
3. Agrupa por clause (trabaja por cláusula completa, no por requisito suelto)
4. Cambia el status de los requisitos del bloque a "analyzing" y guarda
5. Anota en progress/current.md: cláusula, hora de inicio, plan breve
```

---

## 7. Cierre de sesión

Antes de terminar:
1. Ejecuta `init.ps1` — todo verde.
2. Si la auditoría está completa: todos los requisitos con status `complete` en `requirements.json`.
3. Mueve el resumen de `progress/current.md` al final de `progress/history.md`.
4. Vacía `progress/current.md` dejando solo la plantilla.
5. No dejes requisitos en estado `analyzing` si la sesión se cierra.

---

## 8. Si te bloqueas

- Relee la sección relevante de `docs/`.
- Si un documento del proyecto es ilegible, incompleto o contradictorio, documenta el bloqueo en `progress/current.md` con `status: blocked` y marca el requisito como `PR`.
- No inventes conformidad que no puedas verificar documentalmente.
