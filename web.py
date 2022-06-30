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

@route("/drop")
def drop():
    return template("Drop.html")

@route('/list')
def task_list():

    conn = sqlite3.connect('list.db')
    c = conn.cursor()
    c.execute("SELECT id, task FROM todo WHERE status LIKE '1'")
    result = c.fetchall()
    c.close()

    output = template('make_table.tpl', rows=result)
    return output

@route('/edit')
def edit():
    return template("edtaskchoose.html")

@route("/delete")
def delete():
    return template("deltaskchoose.html")

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

@route('/edit/<no:int>', method='GET')
def edit_item(no):

    if request.GET.save:
        edit = request.GET.task.strip()

        conn = sqlite3.connect('list.db')
        c = conn.cursor()
        c.execute("UPDATE todo SET task = ? WHERE id LIKE ?", (edit, no))
        conn.commit()

        return template("edittasksuccess.html",no=no)
    else:
        conn = sqlite3.connect('list.db')
        c = conn.cursor()
        c.execute("SELECT task FROM todo WHERE id LIKE ?", (str(no),))
        cur_data = c.fetchone()

        item_inval = "Invalid"
        if not cur_data:
            return template("InvalOpt.html",no=no)


        return template('edit_task.html', old=cur_data, no=no)

@route('/delete/<no:int>', method='GET')
def delete_item(no):

    if request.GET.save:
        edit = request.GET.task.strip()

        conn = sqlite3.connect('list.db')
        c = conn.cursor()
        c.execute("DELETE FROM todo WHERE id LIKE ?", (no,))
        conn.commit()

        return template("deltasksuccess.html",no=no)
    else:
        conn = sqlite3.connect('list.db')
        c = conn.cursor()
        c.execute("SELECT task FROM todo WHERE id LIKE ?", (str(no),))
        cur_data = c.fetchone()

        item_inval = "Invalid"
        if not cur_data:
            return template("InvalOpt",no=no)


        return template('del_task.html', old=cur_data, no=no)


debug(True)
run(reloader=True)
