# SKILL: Coding Standards

> Claude Code usa este archivo como referencia al escribir código nuevo.

## Principios generales
- Cada función hace UNA sola cosa
- Nombres descriptivos (no abreviaciones crípticas)
- Máximo 50 líneas por función; si se supera, dividir
- Comentar el "por qué", no el "qué"
- Manejo de errores en TODOS los async/await

## Backend (Python/FastAPI)
```python
# Estructura de un endpoint correcto
@router.post("/items", response_model=ItemResponse, status_code=201)
async def create_item(
    payload: CreateItemRequest,  # Pydantic valida automáticamente
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
) -> ItemResponse:
    """Crear un nuevo item para el usuario autenticado."""
    try:
        item = await item_service.create(db, payload, owner_id=current_user.id)
        return ItemResponse.from_orm(item)
    except DuplicateError as e:
        raise HTTPException(status_code=409, detail=str(e))
```

## Frontend (TypeScript/React)
```typescript
// Componente correcto
interface ButtonProps {
  label: string;
  onClick: () => void;
  disabled?: boolean;
  variant?: 'primary' | 'secondary' | 'danger';
}

export function Button({ label, onClick, disabled = false, variant = 'primary' }: ButtonProps) {
  return (
    <button
      onClick={onClick}
      disabled={disabled}
      className={`btn btn-${variant}`}
      type="button"
    >
      {label}
    </button>
  );
}
```

## Reglas de imports
- Imports absolutos sobre relativos cuando sea posible
- Agrupar: 1) librerías externas, 2) internas, 3) tipos
- No importar lo que no se usa

## Manejo de errores
- Nunca `catch(e) {}` vacío
- Siempre loguear el error antes de relanzar
- Errores de usuario → HTTP 4xx con mensaje claro
- Errores del sistema → HTTP 5xx, loguear detalle, mensaje genérico al cliente
