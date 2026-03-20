# ARCHITECTURE — Documento de arquitectura

> Rellenar durante la Fase 1. Aprobar antes de escribir código.
> Este documento es la fuente de verdad de las decisiones técnicas.

---

## Visión general del sistema

**Nombre:** [PROYECTO]
**Descripción:** [QUÉ HACE]
**Versión:** 1.0.0

---

## Stack tecnológico

| Capa | Tecnología | Justificación |
|------|-----------|---------------|
| Frontend | [e.g. Next.js 14] | [razón] |
| Backend | [e.g. FastAPI] | [razón] |
| Base de datos | [e.g. PostgreSQL] | [razón] |
| Cache | [e.g. Redis] | [razón] |
| Auth | [e.g. JWT + OAuth] | [razón] |
| Storage | [e.g. S3/R2] | [razón] |
| Deployment | [e.g. Railway/Fly.io] | [razón] |
| CI/CD | [e.g. GitHub Actions] | [razón] |

---

## Diagrama de arquitectura

```
┌─────────────────────────────────────────────────────────┐
│                        CLIENTE                           │
│                    (Browser / Mobile)                    │
└────────────────────────┬────────────────────────────────┘
                         │ HTTPS
                         ▼
┌─────────────────────────────────────────────────────────┐
│                    FRONTEND                              │
│                [e.g. Next.js en Vercel]                  │
└────────────────────────┬────────────────────────────────┘
                         │ REST API / GraphQL
                         ▼
┌─────────────────────────────────────────────────────────┐
│                    BACKEND API                           │
│               [e.g. FastAPI en Railway]                  │
│  ┌──────────┐  ┌──────────┐  ┌──────────────────────┐   │
│  │  Auth    │  │  Core    │  │  External Services   │   │
│  │ Middleware│  │ Services │  │  (email, storage...) │   │
│  └──────────┘  └──────────┘  └──────────────────────┘   │
└───────┬────────────────────────────────────────────┬────┘
        │                                            │
        ▼                                            ▼
┌───────────────┐                          ┌─────────────────┐
│  PostgreSQL   │                          │     Redis       │
│  (Principal)  │                          │  (Cache/Queue)  │
└───────────────┘                          └─────────────────┘
```

---

## Modelo de datos (entidades principales)

```
Usuario
├── id: UUID
├── email: string (unique)
├── password_hash: string
├── created_at: timestamp
└── ...

[ENTIDAD_2]
├── id: UUID
├── user_id: FK → Usuario
└── ...
```

---

## API — Endpoints principales

```
Auth:
  POST /api/auth/register
  POST /api/auth/login
  POST /api/auth/refresh
  POST /api/auth/logout

[Recurso principal]:
  GET    /api/[recurso]/
  POST   /api/[recurso]/
  GET    /api/[recurso]/{id}
  PUT    /api/[recurso]/{id}
  DELETE /api/[recurso]/{id}

Health:
  GET /health
```

---

## Decisiones de seguridad

- **Auth:** JWT con refresh tokens, expiración corta (15min access, 7d refresh)
- **Passwords:** bcrypt con salt rounds 12
- **Rate limiting:** 100 req/min por IP en endpoints públicos
- **CORS:** Solo dominios propios
- **Validación:** Pydantic en backend, Zod en frontend

---

## Escalabilidad

- **Fase 1 (MVP):** Single server, sin workers
- **Fase 2 (Growth):** Workers con Celery para tareas asíncronas
- **Fase 3 (Scale):** Horizontal scaling, CDN para assets

---

## Aprobación

| Revisor | Fecha | Estado |
|---------|-------|--------|
| [Nombre] | [Fecha] | ⬜ Pendiente |
