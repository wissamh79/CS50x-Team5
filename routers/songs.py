from flask import Blueprint, session, request, render_template, flash, redirect
from database import db

songs_router = Blueprint(
    "movies_router",
    __name__,
    static_folder="../static/",
    template_folder="../templates",
)


@songs_router.route("/songs")
def list_songs(page_number=1, page_size=20):
    page_number = int(request.args.get("page_number", 1))
    page_size = int(request.args.get("page_size", 20))
    offset = (page_number - 1) * page_size
    result = db.execute(
        "SELECT * FROM songs ORDER BY release DESC LIMIT ? OFFSET ?;",
        page_size,
        offset,
    )
    return render_template("songs.html", songs=result)


@songs_router.route("/songs/<songs_id>")
def songs_details(songs_id):
    try:
        song = db.execute("SELECT * FROM songs WHERE id=?;", songs_id)[0]
    except:
        return render_template("404.html")
    singers = db.execute(
        "SELECT name, photo FROM singer JOIN songs_singer ON songs_singer.singer_id = singer.id WHERE song_id = ?;",
        songs_id,
    )

    return render_template(
        "songs_details.html", song=song, singers=singers,
    )
