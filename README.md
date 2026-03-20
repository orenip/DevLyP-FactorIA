# FactorIA — Framework de Desarrollo con IA

> Infraestructura prediseñada para construir aplicaciones completas usando Claude Code como motor de desarrollo autónomo.

---

## ¿Qué es FactorIA?

FactorIA es una plantilla de proyecto y metodología de trabajo que permite pasar de una idea a una aplicación funcional usando Claude Code, sin empezar desde cero cada vez y sin perder contexto ni gastar tokens innecesarios.

**El problema que resuelve:** Claude Code es potente, pero sin estructura se pierde contexto, se generan archivos incompletos, y cada sesión empieza de cero.

**La solución:** Un sistema de capas + documentación viva + comandos predefinidos que permiten a Claude Code trabajar de forma autónoma y consistente.

---

## Inicio rápido

```bash
# 1. Clona o copia la plantilla
cp -r factorIA mi-nuevo-proyecto
cd mi-nuevo-proyecto

# 2. Configura tu proyecto
cp .env.example .env
# Edita .env con tus credenciales

# 3. Abre Claude Code y pega el contenido de:
cat START_PROJECT_PROMPT.md

# 4. Claude Code tomará el control desde ahí
```

---

## Estructura del framework

```
factorIA/
│
├── 📁 .claude/                 → Comandos slash para Claude Code
│   ├── commands/
│   │   ├── plan.md             → /plan - Planifica el siguiente paso
│   │   ├── review.md           → /review - Revisa el código actual
│   │   ├── checkpoint.md       → /checkpoint - Guarda el estado de sesión
│   │   ├── security.md         → /security - Auditoría de seguridad
│   │   └── deploy.md           → /deploy - Prepara el deployment
│   └── settings.json           → Configuración de Claude Code
│
├── 📁 backend/                 → Lógica de servidor
│   ├── api/                    → Endpoints y rutas
│   ├── models/                 → Modelos de datos
│   ├── services/               → Lógica de negocio
│   ├── middleware/              → Auth, validación, logging
│   └── utils/                  → Helpers y utilidades
│
├── 📁 frontend/                → Interfaz de usuario
│   ├── components/             → Componentes reutilizables
│   ├── pages/                  → Páginas/vistas
│   ├── hooks/                  → Custom hooks
│   ├── styles/                 → Tokens CSS y estilos globales
│   └── utils/                  → Helpers de frontend
│
├── 📁 deployment/              → Infraestructura y CI/CD
│   ├── docker/                 → Dockerfiles y compose
│   ├── nginx/                  → Configuración de servidor
│   └── scripts/                → Scripts de automatización
│
├── 📁 design/                  → Sistema de diseño
│   ├── tokens/                 → Colores, tipografía, espaciado
│   └── assets/                 → Imágenes, iconos, fuentes
│
├── 📁 docs/                    → Documentación técnica
│   ├── architecture/           → Diagramas y decisiones de arq.
│   ├── api/                    → Documentación de endpoints
│   └── decisions/              → ADRs (Architecture Decision Records)
│
├── 📁 implementation/          → Control de construcción
│   ├── phases/                 → Estado de cada fase
│   └── tasks/                  → Tareas detalladas
│
├── 📁 mcps/                    → MCP Servers
│   └── config.json             → Configuración de MCPs
│
├── 📁 planning/                → Planificación del producto
│   ├── sprints/                → Planning de sprints
│   └── features/               → Specs de features
│
├── 📁 skills/                  → Skills de Claude Code
│   ├── coding/                 → Estándares de código
│   ├── review/                 → Criterios de revisión
│   └── debug/                  → Protocolo de debugging
│
├── 📁 tests/                   → Suite de pruebas
│   ├── unit/                   → Tests unitarios
│   ├── integration/            → Tests de integración
│   └── e2e/                    → Tests end-to-end
│
├── 📄 CLAUDE.md                → Memoria central del proyecto (leer primero)
├── 📄 START_PROJECT_PROMPT.md  → Prompt para iniciar/continuar proyectos
├── 📄 .env.example             → Variables de entorno requeridas
├── 📄 .gitignore               → Archivos a ignorar
└── 📄 docker-compose.yml       → Stack completo en desarrollo
```

---

## Sistema de capas

El desarrollo sigue SIEMPRE este orden para garantizar que nada se quede a medias:

```
┌─────────────────────────────────┐
│  CAPA 1: PLANNING               │  Aprobar arquitectura antes de código
│  CAPA 2: DESIGN TOKENS          │  Definir sistema visual antes de UI
│  CAPA 3: BACKEND                │  API estable antes de conectar frontend
│  CAPA 4: FRONTEND               │  UI sobre contratos de API definidos
│  CAPA 5: TESTS                  │  Validar cada capa
│  CAPA 6: DEPLOYMENT             │  Solo con tests en verde
└─────────────────────────────────┘
```

---

## Gestión de contexto y tokens

FactorIA está diseñado para maximizar la eficiencia de contexto:

- **CLAUDE.md** actúa como memoria persistente entre sesiones
- **CURRENT_PHASE.md** es el único archivo de estado que Claude necesita leer al iniciar
- **Checkpoints** guardan el estado antes de agotar el contexto
- **Skills** evitan que Claude "reinvente la rueda" en cada sesión

---

## Comandos slash disponibles

| Comando | Descripción |
|---------|-------------|
| `/plan` | Planifica el siguiente paso o fase |
| `/review` | Revisa el código con los estándares del proyecto |
| `/checkpoint` | Guarda el estado actual de la sesión |
| `/security` | Ejecuta auditoría de seguridad |
| `/deploy` | Prepara checklist de deployment |

---

## Principios

1. **Nada se queda a medias** — Cada archivo generado es funcional
2. **Arquitectura antes de código** — Aprobación explícita antes de construir
3. **Seguridad por defecto** — Validación, auth y secrets desde el día 1
4. **Documentación viva** — La documentación se actualiza con el código
5. **Eficiencia de tokens** — Leer solo lo necesario, cuando es necesario
