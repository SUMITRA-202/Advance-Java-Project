<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Employee Reports</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;

    background:#f4f6f9;

    min-height:100vh;

    display:flex;

    align-items:center;

    justify-content:center;
}

.container{

    background:white;

    width:500px;

    padding:40px;

    border-radius:20px;

    box-shadow:0 10px 30px rgba(0,0,0,0.1);

    text-align:center;
}

h2{

    margin-bottom:30px;

    color:#222;

    font-size:2em;
}

.report-box{

    background:#ffffff;

    border-radius:15px;

    padding:25px;

    margin-bottom:25px;

    border-left:6px solid #007bff;

    box-shadow:0 5px 15px rgba(0,0,0,0.08);
}

.report-box h3{

    color:#007bff;

    margin-bottom:15px;
}

input{

    width:90%;

    padding:12px;

    margin:10px 0;

    border:1px solid #ccc;

    border-radius:8px;

    font-size:15px;
}

button{

    background:#007bff;

    color:white;

    border:none;

    padding:12px 25px;

    border-radius:8px;

    cursor:pointer;

    font-size:15px;

    transition:0.3s;
}

button:hover{

    background:#0056b3;
}

.back-btn{

    margin-top:15px;

    background:#28a745;
}

.back-btn:hover{

    background:#1e7e34;
}

</style>

</head>

<body>

<div class="container">

<h2>📊 Employee Reports</h2>

<!-- NAME REPORT -->

<div class="report-box">

<h3>Name Report</h3>

<form action="ReportServlet" method="post">

<input type="hidden" name="type" value="name">

<input type="text"
name="letter"
placeholder="Enter Starting Letter"
required>

<br>

<button type="submit">
Generate Report
</button>

</form>

</div>

<!-- YEARS REPORT -->

<div class="report-box">

<h3>Years of Service Report</h3>

<form action="ReportServlet" method="post">

<input type="hidden" name="type" value="year">

<input type="number"
name="years"
placeholder="Enter Years"
required>

<br>

<button type="submit">
Generate Report
</button>

</form>

</div>

<!-- SALARY REPORT -->

<div class="report-box">

<h3>Salary Report</h3>

<form action="ReportServlet" method="post">

<input type="hidden" name="type" value="salary">

<input type="number"
name="salary"
placeholder="Enter Salary"
required>

<br>

<button type="submit">
Generate Report
</button>

</form>

</div>

<a href="index.jsp">

<button class="back-btn">
⬅ Back to Home
</button>

</a>

</div>

</body>

</html>