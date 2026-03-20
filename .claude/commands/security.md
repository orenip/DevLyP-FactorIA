# /security — Auditoría de seguridad

Cuando el usuario ejecute `/security`, realiza esta auditoría:

## Checklist de seguridad

### 🔐 Secretos y credenciales
- [ ] No hay credenciales hardcodeadas en ningún archivo
- [ ] `.env` está en `.gitignore`
- [ ] `.env.example` tiene SOLO placeholders, nunca valores reales
- [ ] Las API keys se leen desde variables de entorno
- [ ] No hay tokens en comentarios de código

### 🛡️ Autenticación y autorización
- [ ] Todas las rutas protegidas tienen middleware de auth
- [ ] Los tokens JWT tienen expiración configurada
- [ ] Refresh tokens tienen rotación implementada
- [ ] Las rutas de admin verifican rol, no solo autenticación
- [ ] Rate limiting en endpoints de auth (login, register, reset)

### ✅ Validación de inputs
- [ ] Todos los inputs del usuario se validan en backend (no solo frontend)
- [ ] Se usa un schema de validación (Pydantic, Zod, Joi, etc.)
- [ ] Los parámetros de URL/query se sanitizan
- [ ] Uploads de archivos tienen validación de tipo y tamaño
- [ ] No hay SQL raw sin parametrizar

### 🌐 Headers y CORS
- [ ] CORS configurado con dominios específicos (no `*` en producción)
- [ ] Headers de seguridad activos: CSP, HSTS, X-Frame-Options
- [ ] Cookies con `HttpOnly`, `Secure`, `SameSite`

### 🗄️ Base de datos
- [ ] El usuario de DB tiene solo los permisos necesarios
- [ ] Queries parametrizadas en todas las consultas
- [ ] No se exponen IDs internos de DB en la API (usar UUIDs)
- [ ] Datos sensibles encriptados en reposo (passwords con bcrypt/argon2)

### 📝 Logging
- [ ] No se loguean datos sensibles (passwords, tokens, tarjetas)
- [ ] Los errores de producción no exponen stack traces al cliente
- [ ] Se loguean los intentos de autenticación fallidos

## Proceso de reporte

Genera un reporte con formato:

```
## Reporte de seguridad — [FECHA]

### ✅ Correcto (X items)
...

### ⚠️ Advertencias (X items)
...

### 🚨 Crítico — requiere acción inmediata (X items)
...

### Próximos pasos recomendados
1. ...
```
