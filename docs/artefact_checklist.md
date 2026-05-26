# Listas de verificación por tipo de artefacto ISO 19650

> El agente Analyzer usa este documento cuando evalúa un artefacto específico.
> Para cada artefacto, marca cada ítem como: ✅ cumple / ⚠️ parcial / ❌ no cumple / — no aplica.

---

## EIR — Exchange Information Requirements

| # | Criterio de verificación | Notas |
|---|---|---|
| E1 | Define el propósito del activo y las preguntas clave que la información debe responder | |
| E2 | Especifica el LOIN (nivel de información necesario) por hito de entrega, no genérico | |
| E3 | Indica los formatos de intercambio requeridos (IFC, COBie, NWC, PDF, etc.) | |
| E4 | Define criterios de aceptación específicos y verificables para cada entregable | |
| E5 | Establece requisitos del CDE: plataforma, estructura, estados | |
| E6 | Incluye estándares de nomenclatura de contenedores de información | |
| E7 | Especifica un sistema de clasificación (Uniclass u otro) | |
| E8 | Es específico del proyecto (no es una plantilla genérica sin rellenar) | |
| E9 | Tiene versión, fecha y está formalmente aprobado | |
| E10 | Es coherente con el OIR/PIR del que deriva | |

**Clasificación sugerida:**
- 9-10 criterios ✅ → C (Conforme)
- 6-8 criterios ✅ → PC (Parcialmente Conforme)
- <6 criterios ✅ → NC (No Conforme)

---

## Pre-BEP — BIM Execution Plan pre-nombramiento

| # | Criterio de verificación | Notas |
|---|---|---|
| P1 | Describe la estrategia de gestión de la información del equipo | |
| P2 | Demuestra comprensión y respuesta explícita al EIR del cliente | |
| P3 | Define roles BIM propuestos (aunque pueden ser genéricos en esta fase) | |
| P4 | Incluye una Matriz de Responsabilidades por disciplina y tipo de entregable | |
| P5 | Presenta una propuesta de MIDP con al menos los entregables principales | |
| P6 | Presenta propuestas de TIDPs por disciplina o equipo | |
| P7 | Especifica el software y versiones que se emplearán | |
| P8 | Describe el CDE propuesto o compatible con los requisitos del EIR | |
| P9 | Tiene versión, fecha y está firmado por el Lead Appointed Party | |

---

## BEP — BIM Execution Plan post-nombramiento

| # | Criterio de verificación | Notas |
|---|---|---|
| B1 | Es una evolución del pre-BEP, no la misma plantilla sin actualizar | |
| B2 | Está formalmente aprobado por la Appointing Party (firma o evidencia en CDE) | |
| B3 | Define roles BIM con **nombres de personas** asignadas (no solo títulos) | |
| B4 | Incluye Matriz de Responsabilidades completa y actualizada | |
| B5 | Incorpora el MIDP consolidado con todos los entregables | |
| B6 | Incorpora los TIDPs de todos los Appointed Parties | |
| B7 | Especifica software, versiones, formatos, sistemas de coordenadas y unidades | |
| B8 | Documenta los procedimientos de producción colaborativa (WIP→Shared→Published) | |
| B9 | Documenta la naming convention de contenedores de información | |
| B10 | Referencia o incluye el protocolo BIM del contrato | |
| B11 | Es coherente con el EIR: responde a todos los requisitos planteados | |
| B12 | Tiene versión, fecha y control de cambios documentado | |

**Clasificación sugerida:**
- 11-12 criterios ✅ → C
- 7-10 criterios ✅ → PC
- <7 criterios ✅ → NC

---

## MIDP — Master Information Delivery Plan

| # | Criterio de verificación | Notas |
|---|---|---|
| M1 | Lista TODOS los entregables de información del proyecto (modelos, planos, datos, informes) | |
| M2 | Asigna un responsable (equipo o persona) a cada entregable | |
| M3 | Especifica el formato de entrega de cada entregable | |
| M4 | Especifica el LOIN requerido por cada entregable | |
| M5 | Asigna una fecha planificada de entrega a cada entregable | |
| M6 | Asigna un hito de entrega (milestone) a cada entregable | |
| M7 | Está actualizado respecto al programa del proyecto | |
| M8 | Es coherente con los hitos definidos en el EIR | |

---

## TIDP — Task Information Delivery Plan

| # | Criterio de verificación | Notas |
|---|---|---|
| T1 | Cubre los entregables específicos de un único Appointed Party / disciplina | |
| T2 | Es coherente con el MIDP (fechas, LOIN, formatos coinciden) | |
| T3 | Asigna responsables internos del equipo a cada entregable | |
| T4 | Tiene versión, fecha y está firmado por el Appointed Party | |

---

## CDE — Common Data Environment

| # | Criterio de verificación | Notas |
|---|---|---|
| CDE1 | Existe documentación de la plataforma CDE implantada (nombre, versión) | |
| CDE2 | Está documentada la estructura de carpetas / contenedores del CDE | |
| CDE3 | Están definidos los estados: WIP / Shared / Published / Archived | |
| CDE4 | Existe un procedimiento documentado de transición entre estados | |
| CDE5 | La naming convention está documentada y se aplica en los archivos del CDE | |
| CDE6 | Existe trazabilidad de versiones (histórico de revisiones visible) | |
| CDE7 | Los registros de revisión y aprobación están en el CDE | |
| CDE8 | El acceso está controlado por roles (no todo el mundo puede publicar) | |

---

## Roles y nombramientos

| # | Criterio de verificación | Notas |
|---|---|---|
| R1 | Están formalmente designados: Information Manager, BIM Manager, Task Team Managers | |
| R2 | Los nombramientos incluyen información sobre obligaciones de gestión BIM | |
| R3 | El protocolo BIM forma parte del contrato o está referenciado en él | |
| R4 | Las responsabilidades de gestión de la información están claras por rol | |
