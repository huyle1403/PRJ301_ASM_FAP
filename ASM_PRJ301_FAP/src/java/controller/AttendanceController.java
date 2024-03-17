/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.LessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Attendence;
import model.Lession;
import model.Student;

/**
 *
 * @author Huy
 */
public class AttendanceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int leid = Integer.parseInt(req.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Student> students = db.getStudentsByLession(leid);
        ArrayList<Attendence> attendance = new ArrayList<>();
        Lession lession = new Lession();
        lession.setId(leid);
        for (Student student : students) {
            Attendence a = new Attendence();
            a.setLession(lession);
            a.setStudent(student);
            a.setDescription(req.getParameter("description" + student.getId()));
            a.setPresent(req.getParameter("present" + student.getId()).equals("yes"));
            attendance.add(a);
        }
        db.takeAttendances(leid, attendance);
        resp.sendRedirect("attendance?id=" + leid);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        boolean isLogged = (session != null && session.getAttribute("Userlogged") != null);

        if (isLogged) {
            int leid = Integer.parseInt(req.getParameter("id"));
            LessionDBContext db = new LessionDBContext();
            ArrayList<Attendence> atts = db.getAttendencesByLession(leid);
            req.setAttribute("atts", atts);
            req.getRequestDispatcher("/view/viewInSite/attendance.jsp").forward(req, resp);
        } else {
            req.setAttribute("mess", "Access Denied");
            req.getRequestDispatcher("/view/viewLogin/login.jsp").forward(req, resp);
        }

    }
}
