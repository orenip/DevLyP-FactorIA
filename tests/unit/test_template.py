"""
Plantilla de tests unitarios — Backend Python/FastAPI
Copiar y adaptar para cada servicio nuevo.

Convenciones:
- Nombre: test_[acción]_[resultado_esperado]
- Un assert por test (preferiblemente)
- Nunca llamar a la DB real en tests unitarios (mockear)
"""
import pytest
from unittest.mock import AsyncMock, MagicMock, patch


# ── Fixtures comunes ──────────────────────────────────────────────────────────

@pytest.fixture
def mock_db():
    """DB session mockeada para tests unitarios."""
    db = AsyncMock()
    db.commit = AsyncMock()
    db.rollback = AsyncMock()
    return db


@pytest.fixture
def sample_user():
    """Usuario de prueba."""
    return MagicMock(
        id="user-uuid-123",
        email="test@example.com",
        is_active=True,
    )


# ── Tests de ejemplo ──────────────────────────────────────────────────────────

class TestExampleService:
    """
    Plantilla para tests de un servicio.
    Reemplazar 'ExampleService' con el nombre real del servicio.
    """

    @pytest.mark.asyncio
    async def test_create_returns_entity_on_success(self, mock_db, sample_user):
        """Happy path: crear entidad devuelve la entidad creada."""
        # Arrange
        # from backend.services.example import ExampleService
        # service = ExampleService()
        # payload = CreateExampleRequest(name="test")

        # Act
        # result = await service.create(mock_db, payload, owner_id=sample_user.id)

        # Assert
        # assert result.name == "test"
        # assert result.owner_id == sample_user.id
        pass

    @pytest.mark.asyncio
    async def test_create_raises_on_duplicate(self, mock_db):
        """Caso de error: crear duplicado lanza la excepción correcta."""
        # mock_db.commit.side_effect = IntegrityError(...)
        # with pytest.raises(DuplicateError):
        #     await service.create(mock_db, payload, ...)
        pass

    @pytest.mark.asyncio
    async def test_get_returns_none_when_not_found(self, mock_db):
        """Caso límite: entidad no existente devuelve None (no lanza excepción)."""
        # mock_db.execute.return_value.scalar_one_or_none.return_value = None
        # result = await service.get_by_id(mock_db, "non-existent-id")
        # assert result is None
        pass


# ── Tests de validación (Pydantic) ────────────────────────────────────────────

class TestRequestValidation:
    """Tests de que los schemas Pydantic validan correctamente."""

    def test_valid_payload_accepted(self):
        """Input válido no lanza excepción."""
        # from backend.schemas.example import CreateExampleRequest
        # request = CreateExampleRequest(name="valid", email="a@b.com")
        # assert request.name == "valid"
        pass

    def test_invalid_email_rejected(self):
        """Email inválido lanza ValidationError."""
        # from pydantic import ValidationError
        # with pytest.raises(ValidationError):
        #     CreateExampleRequest(name="valid", email="not-an-email")
        pass

    def test_empty_name_rejected(self):
        """Nombre vacío lanza ValidationError."""
        pass
