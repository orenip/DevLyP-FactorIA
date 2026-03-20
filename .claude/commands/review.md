# /review — Revisión de código

Cuando el usuario ejecute `/review [ruta]`, realiza esta revisión:

## Criterios de revisión

### 1. Completitud
- ¿El archivo hace lo que dice que hace?
- ¿Hay TODOs o funciones vacías sin implementar?
- ¿El código maneja todos los casos de error?

### 2. Calidad
- ¿Las funciones tienen una sola responsabilidad?
- ¿Los nombres son descriptivos y consistentes?
- ¿Hay código duplicado que debería abstraerse?
- ¿La complejidad ciclomática es manejable?

### 3. Seguridad
- ¿Hay inputs sin validar?
- ¿Hay credenciales expuestas?
- ¿Los errores exponen información sensible?

### 4. Performance
- ¿Hay queries N+1 en loops?
- ¿Se cachean resultados costosos?
- ¿Hay operaciones bloqueantes innecesarias?

### 5. Tests
- ¿El código es testeable?
- ¿Los casos edge están cubiertos?
- ¿Existe o se necesita test para esta funcionalidad?

## Formato del reporte

```
## Code Review — [ARCHIVO] — [FECHA]

### Resumen
[2-3 líneas sobre el estado general del código]

### Puntos positivos
- ...

### Problemas encontrados

#### 🚨 Críticos (bloquean merge)
- Línea X: [problema] → [solución propuesta]

#### ⚠️ Importantes (deberían resolverse)
- ...

#### 💡 Sugerencias (mejoras opcionales)
- ...

### Veredicto
[ ] ✅ Aprobado
[ ] 🔄 Aprobado con cambios menores
[ ] ❌ Requiere cambios antes de continuar
```

## Instrucciones adicionales
- No hacer cambios durante el review, solo reportar
- Si el usuario aprueba los cambios, entonces implementarlos
- Revisar siempre en contexto del archivo, no de forma aislada
