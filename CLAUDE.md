# CLAUDE.md — FactorIA: Referencia de metodología

> REFERENCIA COMPLETA — No se carga automáticamente (ahorra tokens).
> Estado del proyecto → CLAUDE_STATE.md (carga automática en cada sesión).
> Leer este archivo solo cuando necesites la metodología completa.

---

## IDENTIDAD DEL PROYECTO

**Nombre:** [PROJECT_NAME]
**Tipo:** [web-app | api | saas | automation | tool]
**Stack principal:** [e.g. Next.js + FastAPI + PostgreSQL]
**Estado actual:** [planning | building | testing | deployed]
**Última actualización:** [FECHA]

---

## ARQUITECTURA APROBADA

```
[Diagrama ASCII — rellenar con /new-project]
Ejemplo:
  Frontend (Next.js) → Nginx → Backend (FastAPI) → DB (PostgreSQL)
                                                 ↘ Cache (Redis)
```

**Decisiones clave:**
- Base de datos: [razón]
- Auth strategy: [razón]
- Deployment target: [razón]

---

## ESTRUCTURA DE CARPETAS

```
proyecto/
├── .claude/          → Comandos slash (/plan /new-project /feature /debug /next-phase /status /checkpoint /review /security /deploy)
├── backend/          → API, modelos, servicios, lógica de negocio
├── frontend/         → UI, componentes, páginas, hooks
├── deployment/       → Dockerfiles, nginx, scripts CI/CD
├── design/           → Tokens de diseño, assets, wireframes
├── docs/             → Arquitectura, API docs, ADRs, SESSION_LOG
├── implementation/   → Fases, CURRENT_PHASE.md
├── mcps/             → Configuración MCP servers
├── planning/         → BACKLOG.md, features specs, sprints
├── skills/           → CODING_STANDARDS, DEBUG_PROTOCOL, CODE_REVIEW
└── tests/            → unit/, integration/, e2e/
```

---

## REGLAS DE IA — NUNCA IGNORAR

### 1. NADA SE QUEDA A MEDIAS
- Cada archivo generado debe ser funcional y completo
- Tarea muy grande → dividir en subtareas, completar cada una antes de la siguiente
- Antes de terminar sesión: actualizar CLAUDE_STATE.md y hacer /checkpoint

### 2. SISTEMA DE CAPAS (orden obligatorio)
```
CAPA 1: Planning    → Aprobar arquitectura antes de construir
CAPA 2: Design      → Tokens y estructura antes de UI
CAPA 3: Backend     → API y modelos antes de conectar frontend
CAPA 4: Frontend    → UI sobre API estable
CAPA 5: Tests       → Validar cada capa antes de subir
CAPA 6: Deployment  → Solo cuando tests pasan
```

### 3. GESTIÓN DE CONTEXTO Y TOKENS
- Auto-cargados: CLAUDE_STATE.md + CURRENT_PHASE.md (mínimo necesario)
- No leer archivos innecesarios — verificar CLAUDE_STATE.md primero
- Máximo 3 archivos abiertos simultáneamente
- Contexto al 70% → /checkpoint inmediato → guardar en docs/decisions/SESSION_LOG.md

### 4. SEGURIDAD — OBLIGATORIO
- Nunca hardcodear credenciales (usar .env)
- Validar SIEMPRE inputs en backend (Pydantic)
- Auth middleware en todas las rutas protegidas
- Checklist completo: docs/architecture/SECURITY.md

### 5. ANTES DE CADA COMMIT
```bash
./deployment/scripts/pre-commit-check.sh
```

---

## FASES DEL PROYECTO

| Fase | Nombre | Estado |
|------|--------|--------|
| 1 | Planificación y arquitectura | ⬜ pendiente |
| 2 | Setup y scaffolding | ⬜ pendiente |
| 3 | Backend core | ⬜ pendiente |
| 4 | Frontend base | ⬜ pendiente |
| 5 | Integración y features | ⬜ pendiente |
| 6 | Tests y validación | ⬜ pendiente |
| 7 | Deployment | ⬜ pendiente |

Detalle de cada fase: `implementation/phases/ALL_PHASES.md`
Fase activa y tareas: `implementation/phases/CURRENT_PHASE.md`

---

## ERRORES CONOCIDOS Y SOLUCIONES

| Error | Causa | Solución |
|-------|-------|---------|
| - | - | - |

---

## COMANDOS SLASH DISPONIBLES

| Comando | Cuándo usarlo |
|---------|---------------|
| `/new-project` | Al inicio: convierte un brief en proyecto completamente configurado |
| `/plan` | Planificar la sesión actual (muestra plan, espera aprobación) |
| `/status` | Dashboard rápido del estado del proyecto (solo 2 archivos) |
| `/feature [nombre]` | Implementar una feature completa (spec → backend → frontend → tests) |
| `/next-phase` | Verificar checklist y avanzar a la siguiente fase |
| `/debug` | Protocolo sistemático de debugging |
| `/review` | Auditoría de código antes de merge |
| `/security` | Auditoría de seguridad |
| `/checkpoint` | Guardar estado antes de cerrar sesión |
| `/deploy` | Checklist de deployment |
