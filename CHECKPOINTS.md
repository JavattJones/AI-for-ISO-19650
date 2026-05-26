# CHECKPOINTS — Evaluación del estado final de la auditoría

> En sistemas multi-agente no se evalúa el camino, se evalúa el destino.
> Estos checkpoints son objetivos y verificables por un humano o por el agente Reporter.

---

## C1 — El harness está completo

- [ ] Existen los archivos base: `AGENTS.md`, `init.ps1`, `requirements.json`, `progress/current.md`.
- [ ] Existen los 3 docs: `docs/clauses_19650-2.md`, `docs/artefact_checklist.md`, `docs/gap_severity.md`.
- [ ] `init.ps1` termina con exit code 0.

## C2 — La indexación está completa

- [ ] `progress/index_artifacts.md` existe y lista todos los documentos proporcionados.
- [ ] Cada artefacto indexado tiene: nombre, tipo ISO 19650, versión/fecha, rol del emisor, contenido principal.
- [ ] Los artefactos esperados no aportados están listados explícitamente en el índice como "NO APORTADO".

## C3 — El análisis cubre todos los requisitos

- [ ] Ningún requisito de `requirements.json` tiene status `pending` o `analyzing`.
- [ ] Existe al menos un archivo `progress/analysis_clause_X_X.md` por cada cláusula presente en `requirements.json`.
- [ ] Cada requisito tiene estado asignado: C, PC, NC, NA o PR. Sin estados vacíos.

## C4 — Los gaps están documentados con precisión

- [ ] `progress/gaps_nc_pc.md` existe y recoge todos los requisitos con estado PC, NC o PR.
- [ ] Cada gap cita la cláusula ISO exacta incumplida (no genérico: "falta documentación").
- [ ] Cada gap tiene nivel de riesgo asignado: ALTO, MEDIO o BAJO.
- [ ] Cada gap tiene una acción correctiva concreta (qué documento crear/modificar y qué sección).

## C5 — Los outputs son completos y coherentes

- [ ] `SALIDA_1_trazabilidad.md` tiene una fila por cada requisito del Excel, sin omisiones.
- [ ] `SALIDA_2_informe.md` incluye: resumen numérico, índice de madurez, tabla por cláusula, artefactos evaluados, NC críticas, observaciones, plan de acción.
- [ ] El índice de madurez está calculado correctamente: `(C×100 + PC×50) / total requisitos aplicables`.
- [ ] Las fortalezas y gaps del informe son coherentes con la tabla de trazabilidad.

## C6 — La coherencia entre artefactos está verificada

- [ ] Se ha comprobado que el EIR y el BEP son coherentes en LOIN, nomenclatura y CDE.
- [ ] Se ha comprobado que el MIDP recoge los hitos especificados en el EIR.
- [ ] Si hay incoherencias entre artefactos, están registradas como NC en la tabla de trazabilidad.

## C7 — La sesión se cerró bien

- [ ] `progress/history.md` tiene una entrada con la sesión completada.
- [ ] `requirements.json` no tiene requisitos en estado `analyzing`.
- [ ] `progress/current.md` está vacío (solo la plantilla).

---

**Cómo usar este archivo:** el agente Reporter recorre cada checkbox al generar los outputs finales.
Si quedan boxes vacíos en C1-C6, los outputs no pueden marcarse como finales.
