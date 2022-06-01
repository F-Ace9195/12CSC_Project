from bottle import app, route, get, post, request, template, run, debug, static_file, error, redirect
import sqlite3
import time


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




@route('/new', method='GET')
def new_item():

    if request.GET.save:

        new = request.GET.task.strip()
        conn = sqlite3.connect('list.db')
        c = conn.cursor()

        c.execute("INSERT INTO todo (task,status) VALUES (?,?)", (new,1))
        new_id = c.lastrowid

        conn.commit()
        c.close()
        time.sleep(0.5)

        return template("addtasksuccess.html",newid=new_id)
#'<p>The new task was inserted into the database, the ID is %s</p>' % new_id

    else:
        return template('new_task.html')




debug(True)
run(reloader=True)
