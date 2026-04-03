from flask_jwt_extended import create_access_token
from datetime import timedelta


def generate_token(user_id, rol):
    expires = timedelta(days=3)
    token = create_access_token(identity=str(user_id), additional_claims={"rol": rol}, expires_delta=expires)
    return token
