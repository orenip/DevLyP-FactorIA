# /debug — Protocolo sistemático de debugging

Cuando el usuario ejecute `/debug`, aplica este proceso. El usuario debe pegar el error en su mensaje.

## Proceso

### PASO 1 — Triaje (sin leer código aún)
Analiza el error del usuario e identifica:
```
Tipo de error: [runtime | lógica | configuración | red | DB | auth | tipado]
Capa afectada: [backend | frontend | DB | infra | build]
Severidad: [bloqueante | degradado | cosmético]
Hipótesis más probable: [en 1 línea]
```

### PASO 2 — Leer contexto mínimo
Lee SOLO los archivos necesarios para confirmar la hipótesis:
- Máximo 3 archivos
- Empezar por el archivo que lanza el error, no por los imports

### PASO 3 — Diagnóstico
```
## Diagnóstico

Causa raíz: [descripción exacta]
Línea/función problemática: [ruta:línea]

Por qué ocurre:
[Explicación técnica en 3-5 líneas]

Impacto:
[Qué falla o puede fallar si no se resuelve]
```

### PASO 4 — Fix
- Proponer la corrección mínima (no refactorizar)
- Mostrar el diff exacto antes de aplicar
- Aplicar solo tras confirmación del usuario
- Verificar con el test correspondiente

### PASO 5 — Prevención
```
## Prevención

¿Hay test que debería haber capturado esto? [sí/no]
Si sí: añadir test en [ruta]

¿Está documentado en docs/architecture/? [sí/no]
Si no: ¿vale la pena documentarlo?
```

### PASO 6 — Registro (si es bug recurrente o crítico)
Actualizar `CLAUDE.md` sección "Errores conocidos y soluciones":
```
| [Error resumido] | [Causa] | [Solución aplicada] |
```

## Patrones de error frecuentes

### Backend Python/FastAPI
- `422 Unprocessable Entity` → validación Pydantic fallando, revisar schema
- `IntegrityError` → constraint de DB violado, revisar relaciones y unicidad
- `ImportError circular` → revisar orden de imports, mover a `__init__.py`

### Frontend TypeScript/React
- `hydration error` → diferencia server/client render, revisar uso de `window`/`Date`
- `Cannot read properties of undefined` → verificar loading states antes de renderizar
- `CORS error` → backend no tiene el origin del frontend en `allow_origins`

### Docker/infra
- `connection refused` → verificar que el servicio levantó, revisar `depends_on`
- `permission denied` → volumen con ownership incorrecto, revisar UID en Dockerfile
