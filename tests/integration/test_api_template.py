"""
Plantilla de tests de integración — API endpoints
Usa una DB real (test DB). No mockear la capa de datos aquí.

Requisito: tener DATABASE_URL_TEST en .env o como variable de entorno.
"""
import pytest
from httpx import AsyncClient


# ── Fixtures de integración ───────────────────────────────────────────────────

@pytest.fixture(scope="session")
async def test_app():
    """App FastAPI configurada para tests."""
    # from backend.main import app
    # from backend.database import get_db
    # Configurar DB de test aquí
    # yield app
    pass


@pytest.fixture
async def client(test_app):
    """Cliente HTTP para llamar a la API en tests."""
    # async with AsyncClient(app=test_app, base_url="http://test") as ac:
    #     yield ac
    pass


@pytest.fixture
async def auth_headers(client):
    """Token JWT válido para endpoints protegidos."""
    # response = await client.post("/auth/login", json={"email": "test@example.com", "password": "testpass"})
    # token = response.json()["access_token"]
    # return {"Authorization": f"Bearer {token}"}
    return {}


# ── Tests de endpoints ────────────────────────────────────────────────────────

class TestHealthEndpoint:
    """El endpoint /health siempre debe funcionar."""

    @pytest.mark.asyncio
    async def test_health_returns_200(self, client):
        # response = await client.get("/health")
        # assert response.status_code == 200
        # assert response.json()["status"] == "ok"
        pass


class TestAuthEndpoints:
    """Tests de registro y login."""

    @pytest.mark.asyncio
    async def test_register_creates_user(self, client):
        # response = await client.post("/auth/register", json={
        #     "email": "new@example.com",
        #     "password": "SecurePass123!",
        #     "name": "Test User"
        # })
        # assert response.status_code == 201
        # assert "id" in response.json()
        pass

    @pytest.mark.asyncio
    async def test_login_returns_token(self, client):
        # response = await client.post("/auth/login", json={...})
        # assert response.status_code == 200
        # assert "access_token" in response.json()
        pass

    @pytest.mark.asyncio
    async def test_login_wrong_password_returns_401(self, client):
        # response = await client.post("/auth/login", json={"email": "x@x.com", "password": "wrong"})
        # assert response.status_code == 401
        pass


class TestProtectedEndpoints:
    """Rutas protegidas deben rechazar requests sin token."""

    @pytest.mark.asyncio
    async def test_protected_route_without_token_returns_401(self, client):
        # response = await client.get("/api/users/me")
        # assert response.status_code == 401
        pass

    @pytest.mark.asyncio
    async def test_protected_route_with_valid_token_returns_200(self, client, auth_headers):
        # response = await client.get("/api/users/me", headers=auth_headers)
        # assert response.status_code == 200
        pass
