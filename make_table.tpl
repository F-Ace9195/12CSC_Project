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

input[type=text] {
    width:20%;
}

</style>
<body>

    <div class = "container">
        <h1>Welcome</h1>
    </div>

    <br>
    
    <div class="Menu">

        

        <form action="/new">
            <button class="button">New Task</button>
        </form>

        <form action="/edit">
            <button class="button">Edit Tasks</button>
        </form>

        <form action="/delete">
            <button class="button">Remove tasks</button>
        </form>

    </div>
    <div class = "container">

    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for tasks.." title="Type in a task">

        <div>


            <table class = "hover" id="myTable">
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

function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}



</script>

<style>


    .hover::-webkit-scrollbar-thumb {
        background-image: linear-gradient(180deg, #1b6b9e 0%, #89d0ee 99%);
        box-shadow: inset 2px 2px 5px 0 rgba(#fff, 0.5);
    }

    .hover::-webkit-scrollbar {
        width: 20px;
    }

    .hover {
        background-color: #e4e4e4;
        border-radius: 100px;
    }



  	.hover{
		width:100%; 
		border-collapse:collapse; 
	}
	.hover td{ 
		padding:7px; border:#acbdd3 1px solid;
	}
	/* Define the default color for all the table rows */
	.hover tr{
		background: #f0f5fc;
	}
	/* Define the hover highlight color for the table row */
    .hover tr:hover {
          background-color: #d5f0ff;
    }


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
        overflow:auto; 
        max-height: 750px;

    }

    table {
        border-collapse:separate;
        border:solid black 1px;
        border-radius:6px;
    }

    td, th {
        border-left:solid black 1px;
        border-top:solid black 1px;
    }

    th {
        background-color: blue;
        border-top: none;
    }

    td:first-child, th:first-child {
        border-left: none;
    }

    table {
        -moz-border-radius: 5px !important;
        width: 100%;
        margin-top: 10px;
        border-collapse: collapse;
        border: solid 3px #000000;
        border-radius: 5px;
        position: relative;
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
