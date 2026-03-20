# SESSION_LOG — Historial de sesiones

> Actualizado automáticamente por `/checkpoint`.
> Permite recuperar contexto en sesiones futuras sin releer todo el código.
> Entradas más recientes primero.

---

## Formato de entrada

```
### [FECHA] — Sesión [N]
**Fase:** [N] — [Nombre]
**Completado:**
- [tarea completada]

**Decisiones tomadas:**
- [decisión y razón — lo que NO está en el código]

**Próximo paso:**
[descripción exacta del punto de continuación]

**Contexto crítico:**
[cualquier cosa que Claude necesita saber al retomar]
```

---

## Log

(vacío — se llena automáticamente con `/checkpoint`)
