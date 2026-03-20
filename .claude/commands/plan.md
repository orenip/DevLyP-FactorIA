# /plan — Comando de planificación

Cuando el usuario ejecute `/plan`, sigue estos pasos:

## Proceso

1. **Lee el contexto mínimo necesario:**
   - `CLAUDE.md` (sección "Estado actual de fases")
   - `implementation/phases/CURRENT_PHASE.md`

2. **Evalúa la situación:**
   - ¿En qué fase estamos?
   - ¿Qué está completado?
   - ¿Qué está bloqueado?

3. **Genera el plan de la sesión:**
   ```
   ## Plan de sesión — [FECHA]
   
   Fase actual: [X]
   Estado: [descripción breve]
   
   Próximos pasos (ordenados por prioridad):
   1. [Tarea específica y accionable]
   2. [Tarea específica y accionable]
   3. [Tarea específica y accionable]
   
   Archivos que voy a tocar:
   - [ruta/archivo.ext] — [motivo]
   
   Estimación: [X tareas, aprox Y min de trabajo]
   
   ¿Apruebas este plan? (sí / modifica / cancela)
   ```

4. **Espera aprobación antes de ejecutar cualquier código**

## Reglas del comando /plan
- Nunca ejecutar sin aprobación explícita
- Si el plan tiene más de 5 pasos, dividir en sub-sesiones
- Incluir siempre los archivos que se van a modificar
- Si hay dependencias bloqueantes, identificarlas claramente
