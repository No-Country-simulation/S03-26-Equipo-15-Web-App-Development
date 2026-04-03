from flask import Flask, render_template
from flask_jwt_extended import JWTManager
from src.routes.user_routes import user_bp
from src.routes.auth_routes import auth_bp
from dotenv import load_dotenv
import webbrowser
import threading
import os

load_dotenv()

def create_app():
    app = Flask(__name__)

    app.config["JWT_SECRET_KEY"] = os.getenv("JWT_SECRET_KEY")
    JWTManager(app)

    app.register_blueprint(user_bp, url_prefix="/api/users")
    app.register_blueprint(auth_bp, url_prefix="/api/auth")

    @app.route("/")
    def home():
        return render_template("index.html")

    return app


def open_browser():
    webbrowser.open("http://127.0.0.1:5000/")


if __name__ == "__main__":
    app = create_app()

    # 👉 Abrir navegador después de un pequeño delay
    threading.Timer(1.5, open_browser).start()

    app.run(debug=True)