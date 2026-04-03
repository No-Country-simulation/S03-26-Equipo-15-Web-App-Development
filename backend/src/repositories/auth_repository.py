from src.config.db import get_connection


def get_user_by_email(data):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM usuarios WHERE email = %s", (data.get("email"),))
    user = cursor.fetchone()

    cursor.close()
    conn.close()

    return user
