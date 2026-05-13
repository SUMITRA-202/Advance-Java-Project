<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Employee Management System</title>

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

    border-radius:20px;

    padding:50px 40px;

    max-width:700px;

    width:90%;

    text-align:center;

    box-shadow:0 10px 30px rgba(0,0,0,0.1);
}

h1{

    font-size:2.2em;

    margin-bottom:10px;

    color:#222;
}

.subtitle{

    color:#666;

    margin-bottom:40px;

    font-size:1em;
}

.nav-grid{

    display:grid;

    grid-template-columns:1fr 1fr;

    gap:20px;
}

.nav-card{

    background:#ffffff;

    border-radius:14px;

    padding:30px 20px;

    text-decoration:none;

    color:#222;

    transition:0.3s;

    border:1px solid #ddd;
}

.nav-card:hover{

    transform:translateY(-5px);

    box-shadow:0 10px 20px rgba(0,0,0,0.15);
}

.nav-card .icon{

    font-size:2.5em;

    margin-bottom:12px;

    display:block;
}

.nav-card .title{

    font-size:1.15em;

    font-weight:600;

    margin-bottom:6px;
}

.nav-card .desc{

    font-size:0.82em;

    color:#666;
}

.nav-card.add{
    border-left:5px solid #28a745;
}

.nav-card.update{
    border-left:5px solid #007bff;
}

.nav-card.delete{
    border-left:5px solid #dc3545;
}

.nav-card.display{
    border-left:5px solid #6f42c1;
}

.nav-card.reports{

    grid-column:span 2;

    border-left:5px solid #ffc107;
}

footer{

    margin-top:35px;

    color:#777;

    font-size:0.8em;
}

</style>

</head>

<body>

<div class="container">

<h1>💼 Employee Management</h1>

<p class="subtitle">
Java MVC • JSP + Servlet + JDBC + MySQL
</p>

<div class="nav-grid">

<!-- ADD -->

<a href="empadd.jsp" class="nav-card add">

<span class="icon">➕</span>

<div class="title">Add Employee</div>

<div class="desc">
Register a new employee record
</div>

</a>

<!-- UPDATE -->

<a href="empupdate.jsp" class="nav-card update">

<span class="icon">✏️</span>

<div class="title">Update Employee</div>

<div class="desc">
Modify existing employee details
</div>

</a>

<!-- DELETE -->

<a href="empdelete.jsp" class="nav-card delete">

<span class="icon">🗑️</span>

<div class="title">Delete Employee</div>

<div class="desc">
Remove an employee record
</div>

</a>

<!-- DISPLAY -->

<a href="empdisplay.jsp" class="nav-card display">

<span class="icon">📄</span>

<div class="title">Display Employees</div>

<div class="desc">
View employee details
</div>

</a>

<!-- REPORTS -->

<a href="reports.jsp" class="nav-card reports">

<span class="icon">📊</span>

<div class="title">Reports</div>

<div class="desc">
Generate reports by name, years, or salary
</div>

</a>

</div>

<footer>

© 2026 EmployeeWebApp — Dynamic Web Project

</footer>

</div>

</body>

</html>