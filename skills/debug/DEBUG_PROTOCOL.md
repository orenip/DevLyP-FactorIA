# SKILL: Debug Protocol

> Proceso sistemático para resolver errores. Seguir en orden.

## Paso 1 — Reproducir
- ¿El error es consistente o intermitente?
- ¿En qué entorno ocurre? (dev / staging / prod)
- ¿Cuáles son los pasos exactos para reproducirlo?

## Paso 2 — Leer el error completo
- Copiar el stack trace COMPLETO (no solo la última línea)
- Identificar: ¿qué tipo de error es? ¿en qué archivo? ¿en qué línea?
- ¿El error es nuevo o ya existía?

## Paso 3 — Hipótesis (máx 3)
Antes de tocar código, formular hipótesis ordenadas por probabilidad:
1. La causa más probable es...
2. También podría ser...
3. En casos extremos...

## Paso 4 — Verificar hipótesis
- Añadir logs temporales para confirmar la hipótesis
- NO hacer múltiples cambios a la vez
- Cambiar UNA cosa, verificar, luego la siguiente

## Paso 5 — Fix
- Implementar la solución mínima que resuelve el problema
- No aprovechar para "refactorizar todo" a menos que sea necesario
- Añadir test que hubiera detectado este bug

## Paso 6 — Registrar
- Añadir el error y solución en CLAUDE.md → "Errores conocidos"
- Si fue un error de arquitectura → crear ADR

## Errores frecuentes por stack

### Next.js
- `Hydration mismatch` → Contenido diferente server/client → revisar condiciones con `typeof window`
- `Module not found` → Revisar alias en tsconfig.json y next.config.js

### FastAPI
- `422 Unprocessable Entity` → El payload no cumple el schema Pydantic → revisar tipos
- `DetachedInstanceError` → Acceder a relación lazy fuera de sesión DB → usar `selectinload`

### PostgreSQL
- `too many connections` → Pool de conexiones agotado → revisar `pool_size` y cerrar sesiones
- `deadlock detected` → Orden de locks inconsistente → revisar transacciones

### Docker
- `port already in use` → `docker-compose down` y verificar con `lsof -i :PORT`
- `volume permission denied` → Revisar usuario del contenedor vs permisos del volumen
