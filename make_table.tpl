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

    <div class = "container">
        <h1>Welcome Quandale Dingleberry Cornelious the 3rd</h1>
    </div>

    <br>
    
    <div class="Menu">

        <form action="/new">
            <button class="button">New Task</button>
        </form>

        <form action="/edit">
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

<script>
function dropdown() {

window.location=document.getElementById("UserSelect").value

}

</script>

<style>
    .container h1 {
        background-color: white;
        border-radius: 10px;
        margin-top: 10px;
        margin-bottom: 10px;
        
    }
    .container {
        margin-left: auto;
        margin-right: auto;
        margin-top: 10px;
        width: 80%;

    }

    table {
        width: 100%;
        margin-top: 10px;
        border-collapse: collapse;
        border: 4px solid #000000;
        border-radius: 15px;
        position: relative;
        border-collapse: collapse;
    }
    
    table tr {
        border-collapse: collapse;
        font-family: Product Sans;
        border: 1px solid #000000;
        font-weight: 400;
        font-style:normal;
    }



    table td {
        border-collapse: collapse;
        font-size: 25px;
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
        font-family: Product Sans;
        font-weight: 300;
        font-style: normal;
    }

    td:first-child, th:first-child {
     border-left: none;
    }
    


</style>