/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Group;
import model.Point;
import model.Student;
import model.Subject;

/**
 *
 * @author Huy
 */
public class PointDBContext extends DBContext<Object> {

    public ArrayList<Point> getPointByID(int studentId, int subjectid) {
        ArrayList<Point> points = new ArrayList<>();
        try {
            String sql = "select p.StudentID, s.SubjectName, p.StudentName,"
                    + " p.ProgressTest1, p.ProgressTest2, p.Participation,"
                    + " p.Assignment, p.PracticalExam, p.FinalExam\n"
                    + "from Point p inner join Subject s on p.SubjectID = s.SubjectID\n"
                    + "	where p.StudentID =? and s.SubjectID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentId);
            stm.setInt(2, subjectid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Point p = new Point();
                Subject s = new Subject();

                s.setName(rs.getString("SubjectName"));

                p.setStudentName(rs.getString("StudentName"));
                p.setProgressTest1(rs.getInt("ProgressTest1"));
                p.setProgressTest2(rs.getInt("ProgressTest2"));
                p.setParticipation(rs.getInt("Participation"));
                p.setPracticalExam(rs.getInt("PracticalExam"));
                p.setAssignment(rs.getInt("Assignment"));
                p.setFinalExam(rs.getInt("FinalExam"));
                
                p.setSubject(s);
                
                points.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return points;
    }
}
