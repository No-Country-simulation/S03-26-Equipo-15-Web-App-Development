from src.repositories.auth_repository import get_user_by_email
from src.utils.token import generate_token
from werkzeug.security import check_password_hash


def login_user(data):
    
    if not data or not data.get("email") or not data.get("password"):
        return None
    
    user = get_user_by_email(data)
    if user is None:
        return None

    if not check_password_hash(user["password_hash"], data.get("password")):
        return None

    
    token = generate_token(user["id_usuario"], user["id_rol"])
    return {
        "access_token": token,
        "token_type": "Bearer",
        "user": {
            "nombre": user["nombre"],
            "email": user["email"],
            "estado": user["activo"]
        }
    }
