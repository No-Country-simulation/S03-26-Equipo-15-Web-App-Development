from flask import request, jsonify
from src.services.user_service import get_all_users, create_new_user

def get_users():
    # Obtener todos los usuarios
    users = get_all_users()
    return jsonify(users), 200

def create_user():
    # Obtener los datos del nuevo usuario desde el cuerpo de la solicitud
    data = request.json
    user = create_new_user(data)
    return jsonify(user), 201