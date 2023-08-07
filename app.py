from flask import Flask
from flask_session import Session
from routers.general import general_router
from routers.songs import songs_router

from routers.admin_panel import admin_router
from routers.account import account_router
from flask import g

app = Flask(__name__)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"


Session(app)

app.register_blueprint(general_router, url_prefix="")
app.register_blueprint(account_router, url_prefix="")
app.register_blueprint(songs_router, url_prefix="")

app.register_blueprint(admin_router, url_prefix="/admin")


@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5500)
