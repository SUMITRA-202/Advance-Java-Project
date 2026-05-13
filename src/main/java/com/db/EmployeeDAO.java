package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Employee;

public class EmployeeDAO {
	Connection con;

    // DATABASE CONNECTION

    public EmployeeDAO() {

        con = DBConnection.getConnection();
    }

    // ADD EMPLOYEE

    public boolean addEmployee(Employee e) {

        boolean status = false;

        try {

            PreparedStatement ps =
            con.prepareStatement(
            "INSERT INTO Employee VALUES(?,?,?,?,?)");

            ps.setInt(1, e.getEmpno());
            ps.setString(2, e.getEmpName());
            ps.setDate(3,
            new java.sql.Date(e.getDoj().getTime()));
            ps.setString(4, e.getGender());
            ps.setDouble(5, e.getBsalary());

            int i = ps.executeUpdate();

            if(i > 0) {

                status = true;
            }

        } catch(Exception ex) {

            ex.printStackTrace();
        }

        return status;
    }

    // UPDATE EMPLOYEE

    public boolean updateEmployee(Employee e) {

        boolean status = false;

        try {

            PreparedStatement ps =
            con.prepareStatement(
            "UPDATE Employee SET " +
            "EmpName=?,DoJ=?,Gender=?,Bsalary=? " +
            "WHERE Empno=?");

            ps.setString(1, e.getEmpName());

            ps.setDate(2,
            new java.sql.Date(e.getDoj().getTime()));

            ps.setString(3, e.getGender());

            ps.setDouble(4, e.getBsalary());

            ps.setInt(5, e.getEmpno());

            int i = ps.executeUpdate();

            if(i > 0) {

                status = true;
            }

        } catch(Exception ex) {

            ex.printStackTrace();
        }

        return status;
    }

    // DELETE EMPLOYEE

    public boolean deleteEmployee(int empno) {

        boolean status = false;

        try {

            PreparedStatement ps =
            con.prepareStatement(
            "DELETE FROM Employee WHERE Empno=?");

            ps.setInt(1, empno);

            int i = ps.executeUpdate();

            if(i > 0) {

                status = true;
            }

        } catch(Exception ex) {

            ex.printStackTrace();
        }

        return status;
    }

    // DISPLAY EMPLOYEE

    public Employee getEmployee(int empno) {

        Employee e = null;

        try {

            PreparedStatement ps =
            con.prepareStatement(
            "SELECT * FROM Employee WHERE Empno=?");

            ps.setInt(1, empno);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                e = new Employee();

                e.setEmpno(rs.getInt("Empno"));
                e.setEmpName(rs.getString("EmpName"));
                e.setDoj(rs.getDate("DoJ"));
                e.setGender(rs.getString("Gender"));
                e.setBsalary(rs.getDouble("Bsalary"));
            }

        } catch(Exception ex) {

            ex.printStackTrace();
        }

        return e;
    }

    // REPORT 1
    // EMPLOYEES WHOSE NAME STARTS WITH LETTER

    public ResultSet getNameReport(String letter) {

        ResultSet rs = null;

        try {

            PreparedStatement ps =
            con.prepareStatement(
            "SELECT * FROM Employee " +
            "WHERE EmpName LIKE ?");

            ps.setString(1, letter + "%");

            rs = ps.executeQuery();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return rs;
    }

    // REPORT 2
    // EMPLOYEES WITH N YEARS OF SERVICE

    public ResultSet getYearReport(int years) {

        ResultSet rs = null;

        try {

            PreparedStatement ps =
            con.prepareStatement(
            "SELECT * FROM Employee " +
            "WHERE TIMESTAMPDIFF(YEAR,DoJ,CURDATE()) >= ?");

            ps.setInt(1, years);

            rs = ps.executeQuery();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return rs;
    }

    // REPORT 3
    // EMPLOYEES EARNING ABOVE SALARY

    public ResultSet getSalaryReport(double salary) {

        ResultSet rs = null;

        try {

            PreparedStatement ps =
            con.prepareStatement(
            "SELECT * FROM Employee " +
            "WHERE Bsalary > ?");

            ps.setDouble(1, salary);

            rs = ps.executeQuery();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return rs;
    }
}