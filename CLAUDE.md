# CLAUDE.md — FactorIA Project Intelligence

> Este archivo es la MEMORIA CENTRAL del proyecto. Claude Code lo lee en cada sesión.
> Nunca eliminar. Actualizar tras cada fase completada.

---

## 🧠 IDENTIDAD DEL PROYECTO

**Nombre:** [PROJECT_NAME]
**Tipo:** [web-app | api | saas | automation | tool]
**Stack principal:** [e.g. Next.js + FastAPI + PostgreSQL]
**Estado actual:** [planning | building | testing | deployed]
**Última actualización:** [FECHA]

---

## 🏗️ ARQUITECTURA APROBADA

```
[Diagrama ASCII o descripción de la arquitectura]
Ejemplo:
  Frontend (Next.js) → API Gateway → Backend (FastAPI) → DB (PostgreSQL)
                                   ↘ Workers (Celery) → Cache (Redis)
```

**Decisiones clave:**
- [ ] Base de datos elegida: [razón]
- [ ] Auth strategy: [razón]
- [ ] Deployment target: [razón]

---

## 📁 ESTRUCTURA DE CARPETAS

```
factorIA/
├── .claude/          → Comandos slash y configuración Claude Code
├── backend/          → API, modelos, servicios, lógica de negocio
├── frontend/         → UI, componentes, páginas, hooks
├── deployment/       → Docker, nginx, scripts CI/CD
├── design/           → Tokens de diseño, assets, wireframes
├── docs/             → Arquitectura, API docs, decisiones (ADRs)
├── implementation/   → Fases, tareas, checklist de construcción
├── mcps/             → Configuración de MCP servers
├── planning/         → Sprints, features, roadmap
├── skills/           → Skills de Claude para coding, review, debug
└── tests/            → Unit, integration, e2e
```

---

## ⚡ REGLAS DE IA — NUNCA IGNORAR

### 1. NADA SE QUEDA A MEDIAS
- Cada archivo generado debe ser funcional y completo
- Si una tarea es muy grande → dividir en subtareas, completar cada una antes de la siguiente
- Antes de terminar una sesión: revisar `implementation/phases/CURRENT_PHASE.md`

### 2. SISTEMA DE CAPAS (orden obligatorio)
```
CAPA 1: Planning    → Aprobar antes de construir
CAPA 2: Design      → Tokens y estructura antes de UI
CAPA 3: Backend     → API y modelos antes de conectar frontend
CAPA 4: Frontend    → UI sobre API estable
CAPA 5: Tests       → Validar cada capa antes de subir
CAPA 6: Deployment  → Solo cuando tests pasan
```

### 3. GESTIÓN DE CONTEXTO Y TOKENS
- Al iniciar sesión: leer SOLO este CLAUDE.md + archivo de fase actual
- No leer archivos innecesarios; usar `implementation/phases/CURRENT_PHASE.md` como guía
- Si el contexto se llena: hacer checkpoint en `docs/decisions/SESSION_LOG.md`
- Máximo 3 archivos abiertos simultáneamente salvo que sea imprescindible

### 4. SEGURIDAD — OBLIGATORIO
- Nunca hardcodear credenciales (usar `.env`)
- Validar SIEMPRE inputs del usuario en backend
- Auth middleware en todas las rutas protegidas
- Ver checklist completo en `docs/architecture/SECURITY.md`

### 5. ANTES DE CADA COMMIT
```bash
# Ejecutar siempre:
./deployment/scripts/pre-commit-check.sh
```

---

## 🔄 ESTADO ACTUAL DE FASES

| Fase | Nombre | Estado |
|------|--------|--------|
| 1 | Planificación y arquitectura | ⬜ pendiente |
| 2 | Setup y scaffolding | ⬜ pendiente |
| 3 | Backend core | ⬜ pendiente |
| 4 | Frontend base | ⬜ pendiente |
| 5 | Integración y features | ⬜ pendiente |
| 6 | Tests y validación | ⬜ pendiente |
| 7 | Deployment | ⬜ pendiente |

**Fase activa:** Ver `implementation/phases/CURRENT_PHASE.md`

---

## 🛑 ERRORES CONOCIDOS Y SOLUCIONES

<!-- Registrar aquí errores encontrados y sus soluciones para no repetirlos -->

| Error | Causa | Solución |
|-------|-------|---------|
| - | - | - |

---

## 📝 NOTAS DE SESIÓN

<!-- Claude actualiza esto al final de cada sesión -->
**Última sesión:** [FECHA]
**Completado:** 
**Pendiente:**
**Bloqueantes:**
