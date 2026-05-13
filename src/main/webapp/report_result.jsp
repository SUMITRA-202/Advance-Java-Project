<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Report Results</title>

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

    justify-content:center;

    align-items:center;

    padding:30px;
}

.container{

    background:white;

    width:90%;

    max-width:1000px;

    padding:40px;

    border-radius:20px;

    box-shadow:0 10px 30px rgba(0,0,0,0.1);
}

h2{

    text-align:center;

    margin-bottom:30px;

    color:#222;
}

table{

    width:100%;

    border-collapse:collapse;

    margin-top:20px;
}

table th{

    background:#007bff;

    color:white;

    padding:14px;

    text-align:center;

    font-size:16px;
}

table td{

    padding:12px;

    border-bottom:1px solid #ddd;

    text-align:center;

    color:#333;
}

table tr:nth-child(even){

    background:#f8f9fa;
}

table tr:hover{

    background:#e9f2ff;
}

.back-btn{

    margin-top:25px;

    background:#28a745;

    color:white;

    border:none;

    padding:12px 25px;

    border-radius:8px;

    cursor:pointer;

    font-size:15px;
}

.back-btn:hover{

    background:#1e7e34;
}

.no-data{

    text-align:center;

    color:red;

    font-size:18px;

    margin-top:20px;
}

</style>

</head>

<body>

<div class="container">

<h2>Employee Report Results</h2>

<table>

<tr>

<th>Employee No</th>
<th>Employee Name</th>
<th>Date of Joining</th>
<th>Gender</th>
<th>Basic Salary</th>

</tr>

<%

ResultSet rs =
(ResultSet)request.getAttribute("data");

boolean found = false;

if(rs != null){

    while(rs.next()){

        found = true;

%>

<tr>

<td><%= rs.getInt("Empno") %></td>

<td><%= rs.getString("EmpName") %></td>

<td><%= rs.getString("DoJ") %></td>

<td><%= rs.getString("Gender") %></td>

<td> <%= rs.getDouble("Bsalary") %></td>

</tr>

<%
    }
}

if(!found){
%>

<tr>

<td colspan="5" class="no-data">

No Employee Records Found

</td>

</tr>

<%
}
%>

</table>

<center>

<a href="reports.jsp">

<button class="back-btn">

 Back to Reports

</button>

</a>

</center>

</div>

</body>

</html>