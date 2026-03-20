# SKILL: Code Review

> Claude Code usa este archivo cuando ejecuta `/review` o cuando se le pide revisar código.
> Revisar en este orden exacto — no saltar categorías.

---

## 1. Seguridad (bloquea el merge si falla)
- [ ] Sin credenciales, tokens o secretos hardcodeados
- [ ] Inputs del usuario validados en backend (Pydantic / Zod)
- [ ] Sin SQL raw con interpolación de strings (usar ORM)
- [ ] Auth middleware presente en rutas protegidas
- [ ] Uploads validados (tipo MIME + tamaño)
- [ ] Sin `eval()`, `exec()`, `dangerouslySetInnerHTML` sin sanitizar

## 2. Correctitud (bloquea el merge si falla)
- [ ] La lógica cumple los criterios de aceptación de la feature
- [ ] Manejo de errores en todas las operaciones async
- [ ] Sin `catch(e) {}` vacíos
- [ ] Edge cases cubiertos (null, empty, límites)
- [ ] Sin race conditions obvias en async

## 3. Tests
- [ ] Hay test para cada función de negocio nueva
- [ ] Los tests no mockean lo que deberían probar realmente
- [ ] Tests de errores, no solo happy path
- [ ] Coverage >70% en servicios (no en controllers/routes)

## 4. Calidad de código
- [ ] Funciones < 50 líneas (si no, dividir)
- [ ] Nombres descriptivos (sin abreviaciones crípticas)
- [ ] Sin código duplicado (DRY donde tenga sentido)
- [ ] Imports organizados (externos → internos → tipos)
- [ ] Sin imports sin usar

## 5. Rendimiento (advertencia, no bloquea)
- [ ] Sin N+1 queries (usar joins o eager loading)
- [ ] Paginación en endpoints que devuelven listas
- [ ] Imágenes/assets optimizados
- [ ] Sin re-renders innecesarios en React (useCallback, useMemo donde aplique)

## 6. Documentación
- [ ] Funciones públicas con docstring si la lógica no es obvia
- [ ] ADR creado si hay decisión de arquitectura nueva
- [ ] CLAUDE_STATE.md actualizado si cambia el estado del proyecto

---

## Formato de informe de review

```
## Code Review — [ruta/archivo.ext]

### Bloqueantes (deben resolverse antes de merge)
- [línea X]: [descripción del problema]

### Advertencias (resolver si es posible)
- [línea X]: [descripción]

### Sugerencias (opcional, bajo impacto)
- [sugerencia]

### Veredicto: APROBADO / RECHAZADO
```
