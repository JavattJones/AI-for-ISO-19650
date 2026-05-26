# Criterios de riesgo de auditoría — ALTO / MEDIO / BAJO

> El agente Gap Analyst usa este documento para asignar el nivel de riesgo a cada gap.
> El nivel de riesgo evalúa el impacto en una auditoría externa de certificación ISO 19650.

---

## ALTO — Detendría la certificación

Son gaps que un auditor externo clasificaría como No Conformidades Mayores: situaciones en las que la organización no cumple un requisito fundamental de la norma y no hay evidencia de intento de cumplimiento.

**Criterios para asignar riesgo ALTO:**
- El artefacto requerido por la norma directamente NO EXISTE (ausencia total de EIR, BEP, MIDP).
- Existe el documento pero está completamente genérico / en blanco / sin adaptar al proyecto.
- Hay ausencia de aprobación formal en artefactos que la norma exige que estén aprobados.
- Existe una no conformidad que afecta a la integridad del proceso completo (p. ej., el CDE no tiene estados definidos y toda la información está en una sola carpeta sin flujo de revisión).
- El rol obligatorio no ha sido designado (no hay Information Manager nombrado).
- El protocolo BIM no está referenciado en el contrato.

**Ejemplos concretos:**
| Gap | Por qué es ALTO |
|---|---|
| No existe EIR | Sin EIR no hay base para evaluar el cumplimiento de ningún requisito posterior |
| El BEP no tiene nombres de personas, solo títulos | La norma exige designación nominal (§5.4.4) |
| El MIDP no especifica LOIN por entregable | El LOIN es el criterio de aceptación central de ISO 19650 |
| El CDE no tiene estados WIP/Shared/Published documentados | Sin estados no hay flujo de producción colaborativa conforme |
| No hay evidencia de aprobación del BEP por la Appointing Party | La aprobación es requisito explícito de §5.4 |

---

## MEDIO — Observación formal con plazo de corrección

Son gaps que un auditor externo clasificaría como No Conformidades Menores u Observaciones: el proceso existe pero con deficiencias que deben corregirse en un plazo acordado.

**Criterios para asignar riesgo MEDIO:**
- El artefacto existe pero le falta un elemento específico requerido por la norma (ej: el MIDP existe pero no especifica fechas de entrega).
- El proceso existe pero la evidencia documentada es débil (ej: el flujo CDE existe pero no hay procedimiento escrito, solo práctica informal).
- Hay incoherencias entre artefactos que requieren corrección (ej: el EIR especifica IFC 2x3 pero el BEP dice IFC 4).
- El documento existe en versión borrador sin aprobación formal, pero hay proceso en curso.
- Los roles están definidos pero no hay nombres asignados a alguno de ellos.
- La naming convention está documentada pero no se aplica consistentemente en el CDE.

**Ejemplos concretos:**
| Gap | Por qué es MEDIO |
|---|---|
| El BEP existe pero el MIDP está incompleto (falta 30% de entregables) | MIDP existe, corrección es incremental |
| La nomenclatura del CDE difiere de la definida en el EIR | Incoherencia entre artefactos, corregible |
| Los TIDPs no están firmados por los Appointed Parties | Proceso existe, falta formalización |
| El procedimiento WIP→Shared existe en el BEP pero no hay evidencia de aplicación | Gap de evidencia, no de proceso |

---

## BAJO — Oportunidad de mejora

Son gaps que un auditor externo registraría como Observaciones de Mejora: la organización cumple los requisitos básicos pero podría mejorar la madurez del proceso.

**Criterios para asignar riesgo BAJO:**
- El requisito está cubierto pero de forma menos eficiente de lo que la norma recomienda.
- La documentación es correcta pero difícil de mantener o de usar en auditorías futuras.
- Hay elementos recomendados por la norma (no mandatorios) que no están implementados.
- La trazabilidad entre artefactos existe pero es manual y podría automatizarse.
- El proceso funciona pero no está descrito con suficiente detalle para ser replicable por un tercero.

**Ejemplos concretos:**
| Gap | Por qué es BAJO |
|---|---|
| El MIDP usa Excel manual en lugar de estar integrado en el CDE | Funcional, pero frágil |
| El BEP no tiene índice ni control de cambios formal, aunque el contenido es correcto | Presentación, no contenido |
| No se usa un sistema de clasificación estándar (Uniclass), aunque la nomenclatura propia es coherente | Recomendado, no mandatorio en §5.5 |
| Las lecciones aprendidas del proyecto no están documentadas | Buena práctica, no requisito explícito |

---

## Tabla resumen para el agente Gap Analyst

```
¿El artefacto requerido NO EXISTE?          → ALTO
¿El artefacto existe pero está en blanco?   → ALTO
¿Falta aprobación formal mandatoria?        → ALTO
¿Falta un elemento específico del artefacto? → MEDIO
¿Hay incoherencia entre dos artefactos?     → MEDIO
¿El proceso existe pero sin evidencia?      → MEDIO
¿Cumple pero podría mejorar la madurez?     → BAJO
```
