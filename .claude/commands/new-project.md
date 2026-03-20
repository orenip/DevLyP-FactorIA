# /new-project — Setup autónomo de proyecto desde brief

Cuando el usuario ejecute `/new-project`, sigue este proceso **sin pedir confirmación en cada paso**, pero **muestra el plan antes de ejecutar**.

## Input esperado
El usuario debe proporcionar en su mensaje:
- Nombre del proyecto
- Qué hace (2-3 frases)
- Usuarios objetivo
- Stack preferido (o "recomienda el mejor")
- Features del MVP (lista)

## Proceso autónomo

### PASO 1 — Analizar y planificar (mostrar al usuario, esperar OK)
```
## Plan de inicialización — [NOMBRE_PROYECTO]

Stack recomendado: [stack con justificación en 1 línea]
Arquitectura: [descripción en 1 línea]
MVP: [N features identificadas]

Archivos que voy a generar:
- CLAUDE_STATE.md (estado del proyecto)
- planning/features/MVP_REQUIREMENTS.md
- docs/architecture/ARCHITECTURE.md
- docs/decisions/ADR-001-architecture.md
- implementation/phases/CURRENT_PHASE.md (actualizar)
- CLAUDE.md (actualizar secciones de estado)

¿Apruebas? (sí / modifica stack / cancela)
```

### PASO 2 — Ejecutar tras aprobación (en este orden exacto)

1. **Actualizar CLAUDE_STATE.md**
   - Nombre, tipo, stack, estado: planning
   - Fecha actual, próximo paso

2. **Generar `planning/features/MVP_REQUIREMENTS.md`**
   - Listar features del MVP con criterios de aceptación
   - Separar MVP de "post-MVP / nice-to-have"
   - Requisitos no funcionales (performance, seguridad, escala)

3. **Generar `docs/architecture/ARCHITECTURE.md`**
   - Diagrama ASCII de la arquitectura
   - Stack elegido con justificación de cada componente
   - Esquema de base de datos (entidades principales + relaciones)
   - Estrategia de autenticación

4. **Generar `docs/decisions/ADR-001-architecture.md`**
   - Decisión: qué stack y por qué
   - Alternativas consideradas y descartadas
   - Consecuencias y trade-offs

5. **Actualizar `implementation/phases/CURRENT_PHASE.md`**
   - Marcar tareas como completadas si ya se hicieron
   - Añadir tareas específicas del proyecto (no genéricas)

6. **Actualizar `CLAUDE.md`** — secciones:
   - IDENTIDAD DEL PROYECTO (nombre, tipo, stack, estado)
   - ARQUITECTURA APROBADA (diagrama + decisiones clave)

### PASO 3 — Verificar y reportar
```
## ✅ Proyecto [NOMBRE] inicializado

Archivos generados: [lista]
Stack: [stack]
MVP: [N features]

Próximo paso: Revisar docs/architecture/ARCHITECTURE.md y dar aprobación
explícita para avanzar a Fase 2 (Setup y scaffolding).

Comandos disponibles:
- /plan → Ver plan detallado de la próxima sesión
- /next-phase → Avanzar a Fase 2 cuando estés listo
```

## Reglas de este comando
- Archivos generados deben ser completos y funcionales, no placeholders
- Si el stack no está claro, recomendar el más apropiado para el caso de uso
- Si hay ambigüedad en el MVP, preguntar ANTES de generar documentos
- Cada feature del MVP debe tener criterios de aceptación claros
