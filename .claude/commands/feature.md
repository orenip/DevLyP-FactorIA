# /feature — Implementar una feature completa

Cuando el usuario ejecute `/feature [nombre]`, sigue este pipeline completo.

## Proceso

### PASO 1 — Spec (mostrar, esperar aprobación)
Lee `CLAUDE_STATE.md` y `implementation/phases/CURRENT_PHASE.md`.

Genera el spec en `planning/features/[FEATURE_SLUG].md`:
```markdown
# Feature: [Nombre]

## Descripción
[Qué hace en 2-3 frases]

## Criterios de aceptación
- [ ] [criterio verificable 1]
- [ ] [criterio verificable 2]

## Diseño técnico
Backend:
- Endpoint: [METHOD /ruta] → [qué hace]
- Modelo DB: [si aplica]
- Servicio: [lógica de negocio]

Frontend:
- Página/componente: [nombre]
- Estado: [qué gestiona]
- API call: [endpoint que consume]

## Tests requeridos
- Unit: [qué testear]
- Integration: [qué testear]
- E2E: [flujo a testear]

## Estimación de archivos a tocar
- [ruta/archivo] — [qué cambia]
```

Muestra el spec al usuario. Espera aprobación antes de escribir código.

### PASO 2 — Implementar (tras aprobación)
Orden obligatorio:
1. **Backend primero** — modelo → servicio → endpoint → tests unitarios
2. **Frontend segundo** — componente → página → integración API → tests
3. **Tests de integración** — verificar flujo completo
4. **Actualizar** `planning/features/BACKLOG.md` → marcar feature como completada

### PASO 3 — Verificar
```
## ✅ Feature [nombre] implementada

Archivos creados/modificados:
- [lista]

Tests: [X unit | Y integration]
Criterios de aceptación: [N/N completados]

Para deployar esta feature: /deploy
```

## Reglas
- Nunca implementar sin spec aprobado
- Backend antes que frontend (siempre)
- Cada endpoint debe tener test unitario
- Actualizar `CLAUDE_STATE.md` al terminar
