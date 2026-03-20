/**
 * Plantilla E2E — Playwright
 * Testea flujos completos de usuario (browser real).
 *
 * Requisito: `npx playwright install` y app corriendo en localhost.
 * Ejecutar: `npx playwright test`
 */
import { test, expect, Page } from '@playwright/test';

// ── Helpers ───────────────────────────────────────────────────────────────────

async function loginAs(page: Page, email: string, password: string) {
  await page.goto('/login');
  await page.fill('[data-testid="email"]', email);
  await page.fill('[data-testid="password"]', password);
  await page.click('[data-testid="submit"]');
  await page.waitForURL('/dashboard');
}

// ── Flujos críticos del MVP ───────────────────────────────────────────────────

test.describe('Auth flow', () => {
  test('usuario puede registrarse e iniciar sesión', async ({ page }) => {
    // 1. Registrar
    await page.goto('/register');
    await page.fill('[data-testid="name"]', 'Test User');
    await page.fill('[data-testid="email"]', 'test@example.com');
    await page.fill('[data-testid="password"]', 'SecurePass123!');
    await page.click('[data-testid="submit"]');

    // 2. Redirige a dashboard
    await expect(page).toHaveURL('/dashboard');
    await expect(page.locator('[data-testid="user-name"]')).toContainText('Test User');
  });

  test('credenciales incorrectas muestran error', async ({ page }) => {
    await page.goto('/login');
    await page.fill('[data-testid="email"]', 'wrong@example.com');
    await page.fill('[data-testid="password"]', 'wrongpass');
    await page.click('[data-testid="submit"]');

    await expect(page.locator('[data-testid="error-message"]')).toBeVisible();
    await expect(page).toHaveURL('/login');
  });
});

test.describe('Flujo principal del MVP', () => {
  test.beforeEach(async ({ page }) => {
    // Autenticar antes de cada test de esta suite
    await loginAs(page, 'test@example.com', 'SecurePass123!');
  });

  test('usuario puede completar el flujo principal', async ({ page }) => {
    // Reemplazar con el flujo principal de tu MVP
    // Ejemplo: crear un item, verlo en la lista, borrarlo
    await expect(page).toHaveURL('/dashboard');
    // TODO: implementar flujo específico del proyecto
  });
});

test.describe('Accesibilidad básica', () => {
  test('página principal carga sin errores de consola', async ({ page }) => {
    const errors: string[] = [];
    page.on('console', (msg) => {
      if (msg.type() === 'error') errors.push(msg.text());
    });

    await page.goto('/');
    expect(errors).toHaveLength(0);
  });

  test('página es responsive en mobile', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 }); // iPhone SE
    await page.goto('/');
    // No debe haber overflow horizontal
    const bodyWidth = await page.evaluate(() => document.body.scrollWidth);
    const viewportWidth = page.viewportSize()!.width;
    expect(bodyWidth).toBeLessThanOrEqual(viewportWidth);
  });
});
