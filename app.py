from flask import Flask, render_template
from src.routes.user_routes import user_bp
import webbrowser
import threading

def create_app():
    app = Flask(__name__)

    app.register_blueprint(user_bp, url_prefix="/api/users")

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