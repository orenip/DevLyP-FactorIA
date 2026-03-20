# /checkpoint — Guardar estado de sesión

Cuando el usuario ejecute `/checkpoint`, ejecuta lo siguiente:

## Proceso

1. **Genera el resumen de sesión:**

```markdown
# Checkpoint — [FECHA Y HORA]

## Completado en esta sesión
- [Lista de lo que se terminó]

## Estado de archivos modificados
- `ruta/archivo.ext` — [qué cambió y por qué]

## Próxima tarea pendiente
[Descripción exacta de dónde continuar]

## Contexto crítico a recordar
[Cualquier decisión, truco o contexto que NO está en el código]

## Comando para continuar
Pega este mensaje en la próxima sesión:
"Lee CLAUDE.md y implementation/phases/CURRENT_PHASE.md. 
Continúa desde: [DESCRIPCIÓN EXACTA DEL PUNTO DE CONTINUACIÓN]"
```

2. **Actualiza estos archivos:**
   - `implementation/phases/CURRENT_PHASE.md` → marca tareas completadas
   - `CLAUDE.md` sección "Notas de sesión" → actualiza la última sesión
   - `docs/decisions/SESSION_LOG.md` → añade entrada con el checkpoint

3. **Confirma al usuario:**
   "✅ Checkpoint guardado. Puedes cerrar la sesión con seguridad."

## Cuándo usar /checkpoint
- Cuando el contexto empieza a llenarse (>70%)
- Antes de cerrar Claude Code
- Al completar una fase completa
- Antes de un cambio de enfoque importante
