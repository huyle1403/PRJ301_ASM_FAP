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
import model.Group;
import model.Lecturer;
import model.Lession;
import model.Room;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author Huy
 */
public class LessionDBContext extends DBContext {

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

                les.setId(rs.getInt("leid"));
                les.setAttended(rs.getBoolean("isAttended"));
                les.setDate(rs.getDate("date"));

                group.setId(rs.getInt("GroupID"));
                group.setName(rs.getString("GroupName"));
                slot.setId(rs.getInt("TimeSlotID"));
                slot.setName(rs.getString("TimeSlotName"));
                group.setSubject(sub);
                les.setGroup(group);

                slot.setId(rs.getInt("tid"));
                slot.setName(rs.getString("tname"));
                les.setSlot(slot);

                room.setId(rs.getInt("rid"));
                room.setName(rs.getString("rname"));
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
}
