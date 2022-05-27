from bottle import app, route, get, post, request, template, run, debug, static_file, error
import sqlite3


@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root="H:/12CSC_Project/static")

@route("/")
@route("/home")
def home_page():
    return template('HomePage.html')

@route("/Register")
def register():
    return template("RegisterPage.html")

@route("/login")
def login():
    return template("LoginPage.html")

@route('/list')
def task_list():

    conn = sqlite3.connect('list.db')
    c = conn.cursor()
    c.execute("SELECT id, task FROM todo WHERE status LIKE '1'")
    result = c.fetchall()
    c.close()

    output = template('make_table.tpl', rows=result)
    return output

debug(True)
run(reloader=True)
