# /status — Dashboard de salud del proyecto

Cuando el usuario ejecute `/status`, genera un resumen en <30 segundos leyendo solo 2 archivos.

## Archivos a leer (solo estos 2)
1. `CLAUDE_STATE.md`
2. `implementation/phases/CURRENT_PHASE.md`

## Output esperado

```
## Estado del proyecto — [PROJECT_NAME] — [fecha]

### Fase actual: [N]/7 — [Nombre]
Progreso: [X/Y tareas completadas]
[████████░░] 80%

### Tareas pendientes (esta fase)
- [ ] [tarea 1]
- [ ] [tarea 2]

### Bloqueantes
[ninguno | descripción]

### Última actividad
[resumen de última sesión]

### Comandos disponibles ahora
- /plan → Planificar próxima sesión
- /feature [nombre] → Implementar feature
- /next-phase → Verificar y avanzar fase (si checklist ok)
- /checkpoint → Guardar estado antes de cerrar
```

## Reglas
- No leer más archivos que los 2 indicados
- Si CLAUDE_STATE.md tiene información insuficiente, indicarlo (no leer más archivos)
- Output máximo: 30 líneas
