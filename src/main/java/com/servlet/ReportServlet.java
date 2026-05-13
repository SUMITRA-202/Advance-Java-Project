package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.EmployeeDAO;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    // EXISTING METHOD

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");

        EmployeeDAO dao = new EmployeeDAO();

        ResultSet rs = null;

        try {

            if(type.equals("name")) {

                String letter =
                request.getParameter("letter");

                rs = dao.getNameReport(letter);

            }

            else if(type.equals("year")) {

                int years =
                Integer.parseInt(
                request.getParameter("years"));

                rs = dao.getYearReport(years);
            }

            else if(type.equals("salary")) {

                double salary =
                Double.parseDouble(
                request.getParameter("salary"));

                rs = dao.getSalaryReport(salary);
            }

            request.setAttribute("data", rs);

            RequestDispatcher rd =
            request.getRequestDispatcher(
            "report_result.jsp");

            rd.forward(request, response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}