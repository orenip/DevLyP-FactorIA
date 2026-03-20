#!/bin/bash
# ============================================================
# FactorIA — init-project
# Uso: ./init-project.sh "Nombre del Proyecto"
# ============================================================

set -e

PROJECT_NAME="${1:-mi-proyecto}"
PROJECT_SLUG=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        FactorIA — init-project       ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}▶ Iniciando proyecto: ${PROJECT_NAME}${NC}"
echo ""

# 1. Copiar plantilla
echo -e "${YELLOW}[1/5] Copiando estructura FactorIA...${NC}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="$(pwd)/$PROJECT_SLUG"

if [ -d "$DEST_DIR" ]; then
  echo "❌ Ya existe una carpeta llamada '$PROJECT_SLUG'"
  exit 1
fi

# Copiar excluyendo .git (evita contaminar el nuevo proyecto con historial del template)
# y excluyendo los scripts de inicialización (no se necesitan en proyectos nuevos)
rsync -a --exclude='.git' --exclude='init-project.sh' --exclude='start-execution.sh' \
  "$SCRIPT_DIR/" "$DEST_DIR/"
cd "$DEST_DIR"

echo "   ✅ Estructura copiada en: $DEST_DIR"

# 2. Configurar nombre del proyecto
echo -e "${YELLOW}[2/5] Configurando nombre del proyecto...${NC}"
# Reemplazar placeholder en archivos clave
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" CLAUDE.md README.md
  sed -i '' "s/factoria-project/$PROJECT_SLUG/g" .env.example docker-compose.yml
else
  sed -i "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" CLAUDE.md README.md
  sed -i "s/factoria-project/$PROJECT_SLUG/g" .env.example docker-compose.yml
fi
echo "   ✅ Nombre configurado"

# 3. Configurar .env
echo -e "${YELLOW}[3/5] Creando .env desde .env.example...${NC}"
cp .env.example .env
echo "   ✅ .env creado (recuerda rellenar los valores)"

# 4. Inicializar git
echo -e "${YELLOW}[4/5] Inicializando repositorio git...${NC}"
git init -q
git add .
git commit -q -m "feat: initial FactorIA project structure"
echo "   ✅ Repositorio git inicializado"

# 5. Actualizar fecha en CLAUDE.md
echo -e "${YELLOW}[5/5] Actualizando CLAUDE.md...${NC}"
TODAY=$(date +"%Y-%m-%d")
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/\[FECHA\]/$TODAY/g" CLAUDE.md
else
  sed -i "s/\[FECHA\]/$TODAY/g" CLAUDE.md
fi
echo "   ✅ CLAUDE.md actualizado"

# Resumen final
echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ Proyecto '$PROJECT_NAME' listo               ${NC}"
echo -e "${GREEN}╠══════════════════════════════════════════════════╣${NC}"
echo -e "${GREEN}║  📁 Ubicación: $DEST_DIR  ${NC}"
echo -e "${GREEN}╠══════════════════════════════════════════════════╣${NC}"
echo -e "${GREEN}║  Próximos pasos:                                 ${NC}"
echo -e "${GREEN}║  1. cd $PROJECT_SLUG                    ${NC}"
echo -e "${GREEN}║  2. Edita .env con tus credenciales              ${NC}"
echo -e "${GREEN}║  3. Abre Claude Code en esta carpeta             ${NC}"
echo -e "${GREEN}║  4. Ejecuta: ./start-execution.sh                ${NC}"
echo -e "${GREEN}║     (o copia el prompt de START_PROJECT_PROMPT)  ${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════╝${NC}"
echo ""
