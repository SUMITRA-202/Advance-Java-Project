package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");

	        String empnoStr  = request.getParameter("empno");
	        String empName   = request.getParameter("empName");
	        String doj       = request.getParameter("doj");
	        String gender    = request.getParameter("gender");
	        String salaryStr = request.getParameter("bsalary");

	        try {
	            int    empno   = Integer.parseInt(empnoStr.trim());
	            double bsalary = Double.parseDouble(salaryStr.trim());

	            Connection con = DBConnection.getConnection();
	            String sql = "INSERT INTO employee (empno, empName, doj, gender, bsalary) VALUES (?, ?, ?, ?, ?)";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setInt(1, empno);
	            ps.setString(2, empName.trim());
	            ps.setDate(3, Date.valueOf(doj));
	            ps.setString(4, gender);
	            ps.setDouble(5, bsalary);
	            ps.executeUpdate();
	            ps.close();
	            con.close();

	            request.setAttribute("success", "Employee added successfully!");

	        } catch (SQLIntegrityConstraintViolationException e) {
	            request.setAttribute("error", "Employee number already exists. Please use a unique Empno.");
	        } catch (Exception e) {
	            request.setAttribute("error", "Error: " + e.getMessage());
	        }

	        request.getRequestDispatcher("empadd.jsp").forward(request, response);
	    }
	}
