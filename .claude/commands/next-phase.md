# /next-phase — Verificar y avanzar a la siguiente fase

Cuando el usuario ejecute `/next-phase`, verifica el checklist de salida y avanza la fase si todo está en orden.

## Proceso

### PASO 1 — Verificar checklist de salida
Lee `implementation/phases/CURRENT_PHASE.md` y verifica cada ítem del checklist de salida.

Para cada ítem:
- ✅ Completado — verificado en el código/archivos
- ❌ Pendiente — describe qué falta exactamente
- ⚠️ Parcial — qué parte falta

```
## Checklist Fase [N] — [Nombre]

[ítem 1]: ✅/❌/⚠️ [verificación]
[ítem 2]: ✅/❌/⚠️ [verificación]
...

Resultado: [PUEDE AVANZAR | BLOQUEADO]
```

### PASO 2A — Si PUEDE AVANZAR
Actualizar automáticamente:

1. `implementation/phases/CURRENT_PHASE.md`:
   - Marcar todos los ítems como completados
   - Cambiar estado a "✅ Completado"
   - Añadir fecha de completado en el log

2. `implementation/phases/ALL_PHASES.md`:
   - Cambiar estado de la fase actual a "✅ Completado"
   - Cambiar estado de la siguiente fase a "🔄 En progreso"

3. Generar el nuevo `CURRENT_PHASE.md` con las tareas de la siguiente fase (específicas del proyecto, no genéricas)

4. `CLAUDE_STATE.md`:
   - Actualizar número y nombre de fase activa

5. `CLAUDE.md`:
   - Actualizar tabla de fases

```
## ✅ Avanzado a Fase [N+1] — [Nombre]

Fase [N] completada el [fecha].
Siguiente fase: [descripción de objetivos]

Primer paso de la nueva fase:
[tarea concreta y accionable]
```

### PASO 2B — Si BLOQUEADO
```
## ❌ No se puede avanzar a Fase [N+1]

Ítems pendientes:
1. [descripción exacta de lo que falta]
2. [...]

Acción requerida: [qué hacer para desbloquear]
¿Necesitas ayuda con alguno de estos ítems?
```

## Reglas
- NUNCA avanzar si hay ítems del checklist sin verificar en el código real
- Si un ítem no se puede verificar automáticamente, preguntar al usuario
- Siempre confirmar con el usuario antes de escribir los archivos de la nueva fase
- La transición de fase requiere un commit (recordar al usuario)
