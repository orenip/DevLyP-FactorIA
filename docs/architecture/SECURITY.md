# SECURITY — Políticas y checklist de seguridad

> Revisar y cumplir antes de cada deployment a producción.
> Usar el comando `/security` en Claude Code para auditoría automatizada.

---

## Principios de seguridad del proyecto

1. **Defense in depth** — Múltiples capas de protección
2. **Least privilege** — Cada componente tiene solo los permisos que necesita
3. **Fail secure** — En caso de error, denegar acceso por defecto
4. **Zero trust** — Validar siempre, nunca asumir que un input es seguro

---

## Gestión de secretos

### Reglas absolutas:
- ❌ NUNCA hardcodear credenciales en código
- ❌ NUNCA subir `.env` a git (está en `.gitignore`)
- ❌ NUNCA loguear secretos, tokens o passwords
- ✅ SIEMPRE usar variables de entorno
- ✅ SIEMPRE rotación de secrets si hay exposición accidental

### Jerarquía de secrets:
```
Desarrollo  → .env local (nunca en git)
Staging     → Variables de entorno en plataforma de deploy
Producción  → Variables de entorno + secret manager (si aplica)
```

---

## Autenticación y autorización

### JWT
```python
# Configuración recomendada
ACCESS_TOKEN_EXPIRY = 15  # minutos
REFRESH_TOKEN_EXPIRY = 7  # días
ALGORITHM = "HS256"
```

### Middleware obligatorio:
- Verificar token en cada request protegido
- Verificar rol/permiso además de autenticación
- Rate limiting en rutas de auth

### Endpoints SIEMPRE protegidos:
```
/api/users/*          → Requiere auth
/api/admin/*          → Requiere auth + rol admin
/api/[recurso]/*      → Según política del recurso
```

---

## Validación de inputs

### Backend (SIEMPRE, sin excepción):
```python
# Usar Pydantic para validar todos los schemas
class CreateUserRequest(BaseModel):
    email: EmailStr
    password: str = Field(min_length=8, max_length=100)
    name: str = Field(min_length=1, max_length=100)
```

### Frontend (complementario, no suficiente):
```typescript
// Usar Zod para validar formularios
const schema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
})
```

---

## Headers de seguridad (nginx/backend)

```nginx
# Añadir en deployment/nginx/nginx.conf
add_header X-Frame-Options "SAMEORIGIN";
add_header X-Content-Type-Options "nosniff";
add_header X-XSS-Protection "1; mode=block";
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";
add_header Content-Security-Policy "default-src 'self'";
```

---

## Base de datos

### Prácticas obligatorias:
- Usar ORM con queries parametrizadas (nunca SQL raw con f-strings)
- Usuario de DB con permisos mínimos necesarios
- Passwords almacenados con bcrypt (nunca MD5, SHA1, plain)
- IDs expuestos en API deben ser UUIDs (no autoincrement integers)
- Datos sensibles encriptados en reposo si aplica

---

## Uploads y archivos

```python
# Validaciones obligatorias para file uploads
ALLOWED_TYPES = ["image/jpeg", "image/png", "application/pdf"]
MAX_SIZE_MB = 10

def validate_upload(file):
    if file.content_type not in ALLOWED_TYPES:
        raise ValueError("Tipo de archivo no permitido")
    if file.size > MAX_SIZE_MB * 1024 * 1024:
        raise ValueError("Archivo demasiado grande")
    # Nunca confiar en la extensión del nombre del archivo
```

---

## Logging seguro

```python
# ✅ Correcto
logger.info(f"User {user_id} logged in")

# ❌ Incorrecto — nunca loguear datos sensibles
logger.info(f"User logged in with password: {password}")
logger.info(f"Token generated: {jwt_token}")
```

---

## OWASP Top 10 — Mitigaciones

| Vulnerabilidad | Mitigación implementada |
|---------------|------------------------|
| A01 Broken Access Control | Middleware de auth en todas las rutas protegidas |
| A02 Cryptographic Failures | HTTPS, bcrypt para passwords, secrets en env vars |
| A03 Injection | ORM con queries parametrizadas, validación Pydantic |
| A04 Insecure Design | Revisión de arquitectura en Fase 1 |
| A05 Security Misconfiguration | Checklist de seguridad en deploy |
| A06 Vulnerable Components | Actualizar dependencias regularmente |
| A07 Auth Failures | JWT + rate limiting + refresh token rotation |
| A08 Data Integrity | Validación de inputs, integridad en DB |
| A09 Logging Failures | Logging estructurado sin datos sensibles |
| A10 SSRF | Validar y whitelist URLs externas si aplica |
