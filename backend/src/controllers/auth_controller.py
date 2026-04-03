from flask import request, jsonify
from src.services.auth_service import login_user


def login():
    data = request.get_json(silent=True)
    result = login_user(data)

    if result is None:
        return jsonify({"error": "Invalid credentials"}), 401

    return jsonify(result), 200
