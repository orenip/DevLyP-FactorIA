#!/bin/bash
# ============================================================
# FactorIA — start-execution
# Lanza Claude Code con el prompt correcto ya preparado
# Uso: ./start-execution.sh [descripción del proyecto]
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Leer nombre del proyecto desde CLAUDE.md
PROJECT_NAME=$(grep -m1 '\*\*Nombre:\*\*' CLAUDE.md | sed 's/.*\*\*Nombre:\*\* //' | tr -d '[]' || echo "Mi Proyecto")
CURRENT_PHASE=$(grep -m1 '## Fase activa:' implementation/phases/CURRENT_PHASE.md | sed 's/## Fase activa: //' || echo "FASE 1")

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      FactorIA — start-execution          ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Proyecto: ${PROJECT_NAME}${NC}"
echo -e "${GREEN}Fase actual: ${CURRENT_PHASE}${NC}"
echo ""

# Verificar que estamos en una carpeta FactorIA
if [ ! -f "CLAUDE.md" ] || [ ! -f "START_PROJECT_PROMPT.md" ]; then
  echo "❌ Error: No se encontró CLAUDE.md o START_PROJECT_PROMPT.md"
  echo "   Asegúrate de ejecutar este script desde la raíz del proyecto FactorIA"
  exit 1
fi

# Verificar .env
if [ ! -f ".env" ]; then
  echo -e "${YELLOW}⚠️  Advertencia: No existe .env${NC}"
  echo "   Creando desde .env.example..."
  cp .env.example .env
  echo "   ✅ .env creado. Edítalo con tus credenciales antes de continuar."
  echo ""
fi

# Construir el prompt de inicio
DESCRIPTION="${1:-}"

if [ -z "$DESCRIPTION" ]; then
  # Leer descripción desde CLAUDE.md si ya existe
  EXISTING_DESC=$(grep -A1 '## 🧠 IDENTIDAD DEL PROYECTO' CLAUDE.md | grep -v '##' | head -1 || echo "")
  if [ -n "$EXISTING_DESC" ]; then
    DESCRIPTION="Continuar el proyecto existente"
  else
    echo -e "${CYAN}¿Qué quieres construir? (describe brevemente tu proyecto):${NC}"
    read -r DESCRIPTION
  fi
fi

# Generar el prompt
PROMPT="Eres el arquitecto y desarrollador principal usando el framework FactorIA.

PROYECTO: ${PROJECT_NAME}
DESCRIPCIÓN: ${DESCRIPTION}
FASE ACTUAL: ${CURRENT_PHASE}

INSTRUCCIONES DE INICIO:
1. Lee CLAUDE.md completo para entender el estado del proyecto
2. Lee implementation/phases/CURRENT_PHASE.md para la tarea activa
3. No leas otros archivos salvo que sea estrictamente necesario

REGLAS DE TRABAJO:
- Sigue el sistema de capas definido en CLAUDE.md
- Nada se queda a medias: cada archivo debe ser funcional y completo  
- Al completar cada tarea, actualiza CURRENT_PHASE.md
- Documenta decisiones en docs/decisions/ cuando sean importantes
- Máximo 3 archivos abiertos a la vez para conservar contexto
- Haz /checkpoint antes de que el contexto se llene

PRIMER PASO:
1. Confirma que entendiste el estado del proyecto
2. Muéstrame el plan de esta sesión (máx 5 pasos numerados)
3. Espera mi aprobación antes de ejecutar cualquier código

¿Listo? Empieza con el resumen del plan."

# Guardar prompt en archivo temporal
PROMPT_FILE="/tmp/factoria_prompt_$$.txt"
echo "$PROMPT" > "$PROMPT_FILE"

echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ Prompt de inicio generado                        ║${NC}"
echo -e "${GREEN}╠══════════════════════════════════════════════════════╣${NC}"
echo -e "${GREEN}║  Opciones:                                           ║${NC}"
echo -e "${GREEN}║  [1] Copiar al portapapeles y abrir Claude Code      ║${NC}"
echo -e "${GREEN}║  [2] Ver prompt completo en terminal                 ║${NC}"
echo -e "${GREEN}║  [3] Abrir Claude Code (pegar manualmente)           ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -n "Elige opción [1/2/3]: "
read -r OPTION

case $OPTION in
  1)
    # Copiar al portapapeles según OS
    if command -v xclip &> /dev/null; then
      echo "$PROMPT" | xclip -selection clipboard
      echo "✅ Prompt copiado al portapapeles (xclip)"
    elif command -v xsel &> /dev/null; then
      echo "$PROMPT" | xsel --clipboard --input
      echo "✅ Prompt copiado al portapapeles (xsel)"
    elif command -v pbcopy &> /dev/null; then
      echo "$PROMPT" | pbcopy
      echo "✅ Prompt copiado al portapapeles (macOS)"
    else
      echo "⚠️  No se encontró xclip/xsel. Instala con: sudo apt install xclip"
      echo "   El prompt está en: $PROMPT_FILE"
    fi
    # Abrir Claude Code
    if command -v claude &> /dev/null; then
      echo "🚀 Abriendo Claude Code..."
      claude .
    else
      echo "ℹ️  Abre Claude Code manualmente en esta carpeta y pega el prompt"
    fi
    ;;
  2)
    echo ""
    echo -e "${CYAN}══════════════ PROMPT ══════════════${NC}"
    echo "$PROMPT"
    echo -e "${CYAN}════════════════════════════════════${NC}"
    echo ""
    echo "Copia este prompt y pégalo en Claude Code"
    ;;
  3)
    if command -v claude &> /dev/null; then
      echo "🚀 Abriendo Claude Code..."
      echo "   El prompt está guardado en: $PROMPT_FILE"
      claude .
    else
      echo "ℹ️  Abre Claude Code manualmente en esta carpeta"
      echo "   El prompt está guardado en: $PROMPT_FILE"
    fi
    ;;
  *)
    echo "Opción no válida. El prompt está en: $PROMPT_FILE"
    ;;
esac

echo ""
