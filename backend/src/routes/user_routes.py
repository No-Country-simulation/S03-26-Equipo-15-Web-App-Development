from flask import Blueprint
from src.controllers.user_controller import get_users, create_user

user_bp = Blueprint("users", __name__)

@user_bp.route("/", methods=["GET"])
def get_users_route():
    # Obtener todos los usuarios
    return get_users()

@user_bp.route("/", methods=["POST"])
def create_user_route():
    # Crear un nuevo usuario
    return create_user()