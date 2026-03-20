# /deploy — Checklist de deployment

Cuando el usuario ejecute `/deploy`, ejecuta este proceso:

## Pre-deployment checklist

### 🧪 Tests
- [ ] `npm test` / `pytest` pasa sin errores
- [ ] Coverage > 70% en código crítico
- [ ] Tests de integración pasando
- [ ] Tests E2E pasando en staging

### 🔐 Seguridad
- [ ] Ejecutar `/security` y resolver críticos
- [ ] Variables de entorno de producción configuradas
- [ ] Secrets rotados si hubo exposición
- [ ] HTTPS configurado

### 📦 Build
- [ ] Build de producción sin errores ni warnings críticos
- [ ] Assets optimizados (imágenes, bundles)
- [ ] Variables de entorno de build correctas

### 🗄️ Base de datos
- [ ] Migraciones pendientes documentadas
- [ ] Backup antes del deployment
- [ ] Rollback plan definido
- [ ] Scripts de migración testeados en staging

### 🚀 Deployment
- [ ] Rama correcta (main/production)
- [ ] CHANGELOG actualizado
- [ ] Versión incrementada (si aplica)
- [ ] Notificar al equipo (si aplica)

### ✅ Post-deployment
- [ ] Verificar health endpoint: `GET /health`
- [ ] Smoke tests en producción
- [ ] Monitoring activo
- [ ] Rollback preparado por si acaso

## Comandos de deployment

```bash
# Verificar que todo está en orden
./deployment/scripts/pre-deploy-check.sh

# Build y deploy (ajustar según plataforma)
docker-compose -f docker-compose.prod.yml up -d --build

# Verificar estado
docker-compose ps
docker-compose logs --tail=50
```

## Proceso de rollback

```bash
# Si algo falla:
./deployment/scripts/rollback.sh [VERSION_ANTERIOR]
```
