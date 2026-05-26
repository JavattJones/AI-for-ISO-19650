# Referencia normativa — ISO 19650-2 por cláusula

> Documento de referencia para el agente Analyzer.
> Cada cláusula lista: qué exige la norma, qué artefactos produce y quién es el responsable.

---

## Cláusula 5.1 — Evaluación y necesidades de la Parte Contratante

**Qué exige la norma:**
- Definir los requisitos de información organizativos (OIR): qué preguntas necesita responder la organización con la información del activo.
- Derivar del OIR los requisitos de información del proyecto (PIR): qué preguntas son específicas de este proyecto.
- Desarrollar los Exchange Information Requirements (EIR): qué información se solicitará, con qué nivel de detalle (LOIN), en qué formato y en qué hitos.

**Artefactos resultantes:** OIR, PIR, EIR
**Responsable:** Appointing Party
**Preguntas clave de auditoría:**
- ¿Existe un OIR formal y aprobado, o solo es declarado verbalmente?
- ¿El PIR es específico del proyecto o es una plantilla genérica sin adaptar?
- ¿El EIR define el LOIN por hito de entrega (no solo "LOD 300" genérico)?
- ¿El EIR especifica formatos de intercambio (IFC, COBie, NWC, etc.)?
- ¿El EIR define criterios de aceptación para cada entregable?

---

## Cláusula 5.2 — Invitación a licitar

**Qué exige la norma:**
- Incluir el EIR en la documentación de licitación.
- Establecer criterios de evaluación de la capacidad BIM de los licitadores.
- Solicitar al licitador un pre-BEP como parte de la oferta.

**Artefactos resultantes:** EIR publicado, criterios de evaluación BIM
**Responsable:** Appointing Party
**Preguntas clave de auditoría:**
- ¿Hay evidencia de que el EIR fue parte de los pliegos de licitación?
- ¿Existe una lista de preguntas o criterios de evaluación BIM para los licitadores?
- ¿Se solicitó explícitamente el pre-BEP como documento obligatorio de la oferta?

---

## Cláusula 5.3 — Respuesta a la licitación

**Qué exige la norma:**
- El Lead Appointed Party presenta un pre-BEP con: estrategia de gestión de la información, capacidades del equipo, roles BIM propuestos.
- El pre-BEP incluye una propuesta de MIDP y TIDPs.
- El pre-BEP incluye una Matriz de Responsabilidades (RM).
- El pre-BEP demuestra alineación con el EIR del cliente.

**Artefactos resultantes:** pre-BEP, propuesta MIDP/TIDP, Matriz de Responsabilidades
**Responsable:** Lead Appointed Party
**Preguntas clave de auditoría:**
- ¿El pre-BEP responde explícitamente a los requisitos del EIR?
- ¿La Matriz de Responsabilidades asigna responsables por disciplina y tipo de entregable?
- ¿La propuesta MIDP lista al menos los entregables principales con fechas y formatos?
- ¿El pre-BEP está firmado/fechado o es un borrador sin estado formal?

---

## Cláusula 5.4 — Nombramiento

**Qué exige la norma:**
- Tras el nombramiento, el Lead Appointed Party entrega el BEP post-nombramiento (BEP definitivo).
- El BEP post-nombramiento incorpora: MIDP consolidado, TIDPs de todos los Appointed Parties, acuerdos de CDE, protocolo BIM.
- El protocolo BIM debe ser parte del contrato o documento de nombramiento.
- El BEP debe ser aprobado por la Appointing Party.

**Artefactos resultantes:** BEP post-nombramiento, MIDP consolidado, TIDPs, protocolo BIM
**Responsable:** Lead Appointed Party
**Preguntas clave de auditoría:**
- ¿El BEP es post-nombramiento o es el mismo pre-BEP sin actualizar?
- ¿Los roles BIM tienen nombres de personas asignadas (no solo títulos genéricos)?
- ¿El MIDP lista TODOS los entregables o solo los principales?
- ¿El MIDP especifica LOIN por entregable?
- ¿El protocolo BIM está referenciado en el contrato o en el nombramiento?
- ¿El BEP está formalmente aprobado (firmado o con evidencia de aprobación en el CDE)?

---

## Cláusula 5.5 — Movilización

**Qué exige la norma:**
- Configurar el CDE antes de iniciar la producción de información.
- Documentar la estructura del CDE: plataforma, carpetas, naming convention, estados de los contenedores.
- Establecer y documentar estándares de producción: software, formatos, sistemas de coordenadas, unidades.
- Implantar los métodos y procedimientos de gestión de la información definidos en el BEP.

**Artefactos resultantes:** CDE configurado y documentado, estándares de producción, procedimientos
**Responsable:** Lead Appointed Party / IT
**Preguntas clave de auditoría:**
- ¿Existe documentación del CDE implantado (no solo la plataforma contratada)?
- ¿Están documentados los estados: WIP / Shared / Published / Archived con criterios de transición?
- ¿La naming convention está documentada y es coherente con el EIR?
- ¿Se usa un sistema de clasificación (Uniclass, OmniClass u otro) documentado en el BEP?
- ¿Los software y versiones están especificados en el BEP?

---

## Cláusula 5.6 — Producción colaborativa de información

**Qué exige la norma:**
- La información se genera en el estado WIP dentro del CDE.
- Antes de compartir, el Task Team Manager verifica que el contenedor cumple el LOIN requerido.
- La información pasa a Shared para revisión interdisciplinar.
- Tras aprobación, la información se publica (Published) en el CDE.
- Se mantiene trazabilidad de versiones y control de cambios.

**Artefactos resultantes:** contenedores de información en CDE con estados correctos, registros de revisión y aprobación
**Responsable:** Lead Appointed Party / Appointed Parties / Task Team Managers
**Preguntas clave de auditoría:**
- ¿Existe un procedimiento documentado del flujo WIP → Shared → Published?
- ¿Hay evidencia de verificación LOIN antes de la publicación (checklists, registros)?
- ¿El CDE muestra trazabilidad de versiones (histórico de revisiones)?
- ¿Los registros de aprobación están en el CDE o son externos/verbales?
- ¿Las interferencias o comentarios de revisión están registrados en el CDE?

---

## Cláusula 5.7 — Hito de entrega de información

**Qué exige la norma:**
- En cada hito de entrega, verificar que los entregables cumplen los requisitos del EIR.
- Al cierre del proyecto, verificar que el PIM está completo y cumple todos los requisitos.
- Facilitar la transición del PIM al AIM si aplica (ISO 19650-3).

**Artefactos resultantes:** actas/informes de verificación EIR, PIM final, transición al AIM
**Responsable:** Lead Appointed Party (verificación) / Appointing Party (aceptación)
**Preguntas clave de auditoría:**
- ¿Existe un informe de verificación de cada hito de entrega?
- ¿La verificación comprueba el LOIN, el formato, la nomenclatura y la completitud?
- ¿La Appointing Party ha firmado la aceptación de los entregables?
- ¿Si el proyecto tiene fase de operación, existe un plan de transición PIM→AIM?
