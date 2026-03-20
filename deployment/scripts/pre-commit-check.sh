#!/bin/bash
# FactorIA — pre-commit-check.sh
# Ejecutar antes de cada commit

set -e
PASS=0
FAIL=0
WARN=0

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

check() {
  local desc="$1"
  local result="$2"
  if [ "$result" = "ok" ]; then
    echo -e "  ${GREEN}✅${NC} $desc"
    ((PASS++))
  elif [ "$result" = "warn" ]; then
    echo -e "  ${YELLOW}⚠️ ${NC} $desc"
    ((WARN++))
  else
    echo -e "  ${RED}❌${NC} $desc"
    ((FAIL++))
  fi
}

echo ""
echo "🔍 FactorIA Pre-commit Check"
echo "════════════════════════════"

# Secretos en código
echo ""
echo "🔐 Verificando secretos..."
if grep -r "password\s*=\s*['\"][^'\"]\+['\"]" --include="*.py" --include="*.ts" --include="*.js" . --exclude-dir=node_modules --exclude-dir=.venv 2>/dev/null | grep -v ".env" | grep -v "example" | grep -q .; then
  check "Sin passwords hardcodeados" "fail"
else
  check "Sin passwords hardcodeados" "ok"
fi

if [ -f ".env" ] && git ls-files --error-unmatch .env 2>/dev/null; then
  check ".env NO está trackeado por git" "fail"
else
  check ".env NO está trackeado por git" "ok"
fi

# Archivos incompletos
echo ""
echo "📝 Verificando completitud..."
TODO_COUNT=$(grep -r "TODO\|FIXME\|HACK\|XXX" --include="*.py" --include="*.ts" --include="*.tsx" . --exclude-dir=node_modules --exclude-dir=.venv 2>/dev/null | wc -l || echo "0")
if [ "$TODO_COUNT" -gt 5 ]; then
  check "TODOs pendientes: $TODO_COUNT (considera resolverlos)" "warn"
else
  check "TODOs pendientes: $TODO_COUNT" "ok"
fi

# CLAUDE.md actualizado
echo ""
echo "📋 Verificando documentación..."
CLAUDE_DATE=$(grep "Última actualización:" CLAUDE.md | head -1 || echo "")
if [ -z "$CLAUDE_DATE" ]; then
  check "CLAUDE.md tiene fecha de actualización" "warn"
else
  check "CLAUDE.md tiene fecha de actualización" "ok"
fi

# Resumen
echo ""
echo "════════════════════════════"
echo -e "  ${GREEN}✅ Pasaron: $PASS${NC}  ${YELLOW}⚠️  Avisos: $WARN${NC}  ${RED}❌ Fallaron: $FAIL${NC}"
echo ""

if [ "$FAIL" -gt 0 ]; then
  echo -e "${RED}❌ Pre-commit check FALLIDO. Resuelve los errores antes de hacer commit.${NC}"
  exit 1
else
  echo -e "${GREEN}✅ Pre-commit check PASADO.${NC}"
  exit 0
fi
