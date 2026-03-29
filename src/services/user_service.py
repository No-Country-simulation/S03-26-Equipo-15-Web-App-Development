from src.repositories.user_repository import find_all, create

def get_all_users():
    # Obtener todos los usuarios
    return find_all()

def create_new_user(data):
    # Crear un nuevo usuario , despues aca metemos validaciones de datos, etc
    return create(data)