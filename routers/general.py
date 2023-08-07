from flask import Blueprint, render_template, request, redirect, session
from database import db

general_router = Blueprint(
    "general_router",
    __name__,
    static_folder="../static/",
    template_folder="../templates/",
)


@general_router.get("/")
def index():
    featured_songs = db.execute(
        "SELECT * FROM songs WHERE is_featured = True;")

    songs = db.execute("SELECT * FROM songs ORDER BY release DESC LIMIT 10;")

    data = {
        "featured_songs": featured_songs,

        "songs": songs,

    }
    return render_template("index.html", data=data)
