/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendence;
import model.Group;
import model.Lecturer;
import model.Lession;
import model.Room;
import model.Student;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author Huy
 */
public class LessionDBContext extends DBContext {

    public ArrayList<Lession> getBy(String lecturerName, Date from, Date to) {
        ArrayList<Lession> lessions = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "Les.LessionID,les.isAttended,les.date,\n"
                    + "g.GroupID,g.GroupName,su.SubjectID,su.SubjectName,\n"
                    + "t.TimeSlotID,t.TimeSlotName,\n"
                    + "r.RoomID,r.RoomName,\n"
                    + " l.LecturerID,l.LecturerName\n"
                    + " FROM Lession les INNER JOIN [Group] g ON g.GroupID = les.GroupID\n"
                    + " INNER JOIN [Subject] su ON su.SubjectID = g.subID\n"
                    + " INNER JOIN TimeSlot t ON t.TimeSlotID = les.TimeID\n"
                    + " INNER JOIN Room r ON r.RoomID = les.RoomID\n"
                    + " INNER JOIN Lecturer l ON l.LecturerID = les.LecturerID\n"
                    + "  WHERE  l.LecturerName like ? AND les.[date] >=? AND les.[date]<=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lecturerName);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lession les = new Lession();
                Group g = new Group();
                Subject su = new Subject();
                TimeSlot slot = new TimeSlot();
                Room room = new Room();
                Lecturer lec = new Lecturer();

                les.setId(rs.getInt("LessionID"));
                les.setAttended(rs.getBoolean("isAttended"));
                les.setDate(rs.getDate("date"));

                g.setId(rs.getInt("GroupID"));
                g.setName(rs.getString("GroupName"));
                su.setId(rs.getInt("SubjectID"));
                su.setName(rs.getString("SubjectName"));
                g.setSubject(su);

                les.setGroup(g);

                slot.setId(rs.getInt("TimeSlotID"));
                slot.setName(rs.getString("TimeSlotName"));
                les.setSlot(slot);

                room.setId(rs.getInt("RoomID"));
                room.setName(rs.getString("RoomName"));
                les.setRoom(room);

                lec.setId(rs.getInt("LecturerID"));
                lec.setName(rs.getString("LecturerName"));
                les.setLecturer(lec);

                lessions.add(les);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessions;
    }

    public ArrayList<Lession> getLessionByID(int lessionid, Date from, Date to) {
        ArrayList<Lession> lessions = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "    les.LessionID, les.isAttended, les.date,\n"
                    + "    g.GroupID, g.GroupName, su.SubjectID, su.SubjectName,\n"
                    + "    t.TimeSlotID, t.TimeSlotName,\n"
                    + "    r.RoomID, r.RoomName,\n"
                    + "    l.LecturerID, l.LecturerName\n"
                    + "FROM\n"
                    + "    Lession les\n"
                    + "    INNER JOIN [Group] g ON les.GroupID = g.GroupID\n"
                    + "    INNER JOIN Subject su ON su.SubjectID = g.subid\n"
                    + "    INNER JOIN TimeSlot t ON t.TimeSlotID = les.TimeID\n"
                    + "    INNER JOIN Room r ON r.RoomID = les.RoomID\n"
                    + "    INNER JOIN Lecturer l ON l.LecturerID = les.LecturerID\n"
                    + "WHERE\n"
                    + "    les.LecturerID = ? AND les.[date] >= ? AND les.[date] <= ?;";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, lessionid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lession les = new Lession();
                Group group = new Group();
                Subject sub = new Subject();
                TimeSlot slot = new TimeSlot();
                Room room = new Room();
                Lecturer lecturer = new Lecturer();

                les.setId(rs.getInt("LessionID"));
                les.setAttended(rs.getBoolean("isAttended"));
                les.setDate(rs.getDate("date"));

                group.setId(rs.getInt("GroupID"));
                group.setName(rs.getString("GroupName"));

                slot.setId(rs.getInt("TimeSlotID"));
                slot.setName(rs.getString("TimeSlotName"));

                group.setSubject(sub);
                les.setGroup(group);

                slot.setId(rs.getInt("TimeSlotID"));
                slot.setName(rs.getString("TimeSlotName"));
                les.setSlot(slot);

                room.setId(rs.getInt("RoomID"));
                room.setName(rs.getString("RoomName"));
                les.setRoom(room);

                lecturer.setId(rs.getInt("LecturerID"));
                lecturer.setName(rs.getString("LecturerName"));
                les.setLecturer(lecturer);

                lessions.add(les);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lessions;

    }

    public ArrayList<Attendence> getAttendencesByLession(int leid) {
        ArrayList<Attendence> attendences = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "   s.StudentID,s.StudentName,\n"
                    + "   a.AttendenceID,a.description,a.isPresent,a.capturedtime\n"
                    + "   FROM Student s INNER JOIN Enrollment e ON s.StudentID = e.StudentID\n"
                    + "    INNER JOIN [Group] g ON g.GroupID = e.GroupID\n"
                    + "    INNER JOIN Lession les ON les.GroupID = g.GroupID\n"
                    + "    LEFT JOIN Attendence a ON a.LessionID = les.LessionID AND a.StudentID = s.StudentID\n"
                    + "                    WHERE les.LessionID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence att = new Attendence();
                Student s = new Student();
                Lession les = new Lession();
                s.setId(rs.getInt("StudentID"));
                s.setName(rs.getString("StudentName"));

                att.setStudent(s);

                les.setId(leid);
                att.setLession(les);

                att.setId(rs.getInt("AttendenceID"));
                if (att.getId() != 0) {
                    att.setDescription(rs.getString("description"));
                    att.setPresent(rs.getBoolean("isPresent"));
                    att.setTime(rs.getTimestamp("capturedtime"));
                }
                attendences.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendences;
    }

    public ArrayList<Student> getStudentsByLession(int leid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "                   s.StudentID,s.StudentName\n"
                    + "                  FROM Student s INNER JOIN Enrollment e ON s.StudentID = e.StudentID\n"
                    + "                   					INNER JOIN [Group] g ON g.GroupID = e.GroupID\n"
                    + "                   					INNER JOIN Lession les ON les.GroupID = g.GroupID\n"
                    + "                   WHERE les.LessionID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("StudentID"));
                s.setName(rs.getString("StudentName"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public void takeAttendances(int leid, ArrayList<Attendence> atts) {
        try {
            connection.setAutoCommit(false);
            String sql_remove_atts = "DELETE Attendence WHERE LessionID = ?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, leid);
            stm_remove_atts.executeUpdate();

            for (Attendence att : atts) {
                String sql_insert_att = "INSERT INTO [Attendence]\n"
                        + "           ([LessionID]\n"
                        + "           ,[StudentID]\n"
                        + "           ,[description]\n"
                        + "           ,[isPresent]\n"
                        + "           ,[capturedtime])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE())";
                PreparedStatement stm_insert_att = connection.prepareStatement(sql_insert_att);
                stm_insert_att.setInt(1, leid);
                stm_insert_att.setInt(2, att.getStudent().getId());
                stm_insert_att.setString(3, att.getDescription());
                stm_insert_att.setBoolean(4, att.isPresent());
                stm_insert_att.executeUpdate();
            }

            String sql_update_lession = "UPDATE Lession SET isAttended = 1 WHERE LessionID =?";
            PreparedStatement stm_update_lession = connection.prepareStatement(sql_update_lession);
            stm_update_lession.setInt(1, leid);
            stm_update_lession.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public ArrayList<Lession> getAttendencesByLessionViewStudent(int StuID, int SubID) {
        ArrayList<Lession> listLessions = new ArrayList<>();
        try {
            String sql = " select l.date, l.isAttended, t.TimeSlotID, g.GroupName, r.RoomName, sub.SubjectName, lec.LecturerName, stu.StudentName\n"
                    + "                   from Lession l\n"
                    + "                    join [Group] g  \n"
                    + "                   on g.GroupID = l.GroupID\n"
                    + "                   join [TimeSlot] t \n"
                    + "                    on t.TimeSlotID = l.TimeID\n"
                    + "                  join Room r\n"
                    + "                   on r.RoomID = l.RoomID\n"
                    + "                  join Lecturer lec\n"
                    + "                   on lec.LecturerID = l.LecturerID\n"
                    + "                    join Enrollment e \n"
                    + "                    on e.GroupID = g.GroupID\n"
                    + "                join [Subject] sub\n"
                    + "                   on sub.SubjectID = g.subID\n"
                    + "                   join Student stu\n"
                    + "                 on stu.StudentID = e.StudentID\n"
                    + "                  where stu.StudentID = ? and sub.SubjectID =? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, StuID);
            stm.setInt(2, SubID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lession l = new Lession();
                TimeSlot t = new TimeSlot();
                Room r = new Room();
                Group g = new Group();
                Subject s = new Subject();
                Lecturer lec = new Lecturer();
                Student stu = new Student();

                stu.setName(rs.getString("StudentName"));
                
                l.setDate(rs.getDate("date"));
                l.setAttended(rs.getBoolean("isAttended"));

                t.setName(rs.getString("TimeSlotID"));

                g.setName(rs.getString("GroupName"));

                r.setName(rs.getString("RoomName"));

                s.setName(rs.getString("SubjectName"));

                lec.setName(rs.getString("LecturerName"));

                l.setSlot(t);
                l.setLecturer(lec);
                l.setGroup(g);
                l.setSubject(s);
                l.setRoom(r);
                l.setStudent(stu);
                listLessions.add(l);

            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listLessions;
    }

}
