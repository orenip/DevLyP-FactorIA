# PHASES — Roadmap de implementación FactorIA

> Sistema de fases para construir proyectos de forma estructurada y sin dejar nada a medias.
> Nunca saltar una fase sin completar el checklist de salida de la anterior.

---

## FASE 1 — Planificación y arquitectura
**Estado:** 🔄 En progreso

**Objetivos:**
- Definir qué se va a construir (MVP y alcance)
- Elegir stack tecnológico con justificación
- Diseñar arquitectura del sistema
- Obtener aprobación antes de escribir código

**Entregables:**
- `planning/features/MVP_REQUIREMENTS.md`
- `docs/architecture/ARCHITECTURE.md`
- `docs/decisions/ADR-001-architecture.md`
- `CLAUDE.md` actualizado con stack

**Checklist de salida:**
- [ ] Arquitectura aprobada
- [ ] Stack definido
- [ ] Base de datos diseñada
- [ ] Sin ambigüedades en el MVP

---

## FASE 2 — Setup y scaffolding
**Estado:** ⬜ Pendiente

**Objetivos:**
- Inicializar proyecto con el stack elegido
- Configurar entorno de desarrollo
- Estructura de carpetas creada y funcional
- CI/CD básico configurado

**Entregables:**
- Proyecto inicializado y corriendo localmente
- `docker-compose.yml` funcional
- `.env` configurado
- Git repository con primer commit

**Checklist de salida:**
- [ ] `docker-compose up` levanta sin errores
- [ ] Base de datos conecta
- [ ] Frontend accesible en localhost
- [ ] Backend responde en /health

---

## FASE 3 — Backend core
**Estado:** ⬜ Pendiente

**Objetivos:**
- Implementar modelos de datos
- Crear endpoints de API principales
- Sistema de autenticación funcional
- Middleware de seguridad activo

**Entregables:**
- Modelos de base de datos con migraciones
- API REST/GraphQL documentada
- Auth (login, register, JWT, refresh)
- Tests unitarios de servicios core

**Checklist de salida:**
- [ ] Todos los endpoints del MVP implementados
- [ ] Auth funcional y testeado
- [ ] Validación de inputs en todos los endpoints
- [ ] Documentación de API generada
- [ ] Tests unitarios > 70% coverage en services

---

## FASE 4 — Frontend base
**Estado:** ⬜ Pendiente

**Objetivos:**
- Setup del sistema de diseño (tokens, componentes base)
- Páginas principales implementadas
- Integración con API backend
- Flujos de usuario principales funcionando

**Entregables:**
- Sistema de design tokens en `design/tokens/`
- Componentes base (Button, Input, Modal, etc.)
- Páginas del MVP conectadas a la API
- Gestión de estado implementada

**Checklist de salida:**
- [ ] Todos los flujos del MVP navegables
- [ ] Sin errores de consola en producción
- [ ] Responsive en mobile/desktop
- [ ] Manejo de errores visible al usuario

---

## FASE 5 — Integración y features
**Estado:** ⬜ Pendiente

**Objetivos:**
- Integrar servicios externos (pagos, email, storage, etc.)
- Features adicionales post-MVP
- Optimizaciones de UX
- Pulir edge cases

**Entregables:**
- Integraciones funcionales y testeadas
- Features del sprint actual completadas
- UX review completado

**Checklist de salida:**
- [ ] Integraciones testeadas en staging
- [ ] Sin regresiones en features anteriores
- [ ] Performance acceptable (Core Web Vitals)

---

## FASE 6 — Tests y validación
**Estado:** ⬜ Pendiente

**Objetivos:**
- Suite de tests completa
- Tests de integración end-to-end
- Auditoría de seguridad
- Performance testing

**Entregables:**
- Tests E2E de flujos críticos
- Reporte de seguridad (`/security`)
- Performance report
- Bug fixes de lo encontrado

**Checklist de salida:**
- [ ] Tests E2E pasando
- [ ] Sin vulnerabilidades críticas
- [ ] Performance targets alcanzados
- [ ] Todos los bugs críticos resueltos

---

## FASE 7 — Deployment
**Estado:** ⬜ Pendiente

**Objetivos:**
- Deployment a producción
- Monitoring configurado
- Documentación final
- Handoff o lanzamiento

**Entregables:**
- App en producción y accesible
- Monitoring/alertas activos
- README de usuario final
- Runbook operacional

**Checklist de salida:**
- [ ] Checklist `/deploy` completado al 100%
- [ ] Smoke tests en producción pasando
- [ ] Monitoring activo con alertas
- [ ] Documentación de usuario completa
