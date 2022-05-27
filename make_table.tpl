<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="static/styles.css">

</head>


<style>

h1, h2, form {
    text-align: center;
}

form {
    display:inline-flex;
}

</style>

<body>
    <h1>Welcome Ryan</h1>
    
    <div class="Menu">

        <form action="">
            <button class="button">New Task</button>
        </form>

        <form action="">
            <button class="button">Edit Tasks</button>
        </form>

        <form action="">
            <button class="button">Remove tasks</button>
        </form>

    </div>

    <div class = "container">


    <table class = border = 1>
    <th>#Num</th>

    <th>Description</th>

    %for row in rows:
    <tr>
    %for col in row:
    <td>{{col}}</td>
    %end
    </tr>
    %end
    </table>

    </div>

</body>

<style>
    .container {
        margin-left: auto;
        margin-right: auto;
        margin-top: 10px;
        width: 50%;
        display: flex;
        justify-content: center;
    }

    table {
        width: 50%;
        margin-left: auto;
        display: flex;
        justify-content: center;
        margin-top: 10px;
        margin-right: auto;
        border-collapse: collapse;
        border: 4px solid #000000;
        border-radius: 6px;
        margin-left: auto;
        margin-right: auto;
        position: relative;
        border-collapse: collapse;
    }
    
    table tr {
        border-collapse: collapse;
        font-family: open-sans,sans-serif;
        border: 1px solid #000000;
        font-weight: 400;
        font-style:normal;
    }



    table td {
        border-collapse: collapse;
        border: 1px solid #000000;
        border-style:solid;
    }



    table th {
        border-collapse: collapse;
        border: 1px solid #000000;
        padding-top: 6px;
        padding-bottom: 6px;
        text-align: left;
        background-color: #0491aa;
        color: rgb(0, 0, 0);
        font-family: open-sans, sans-serif;
        font-weight: 300;
        font-style: normal;
    }

    td:first-child, th:first-child {
     border-left: none;
    }
    


</style>