from src.config.db import get_connection

def find_all():
    # Obtener todos los usuarios de la base de datos
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()

    cursor.close()
    conn.close()

    return users


def create(data):
    # Crear un nuevo usuario en la base de datos
    conn = get_connection()
    cursor = conn.cursor()

    query = """
        INSERT INTO users (name, email, password, role)
        VALUES (%s, %s, %s, %s)
    """

    values = (
        data.get("name"),
        data.get("email"),
        data.get("password"),
        data.get("role")
    )

    cursor.execute(query, values)
    conn.commit()

    user_id = cursor.lastrowid

    cursor.close()
    conn.close()

    return {
        "id": user_id,
        **data
    }