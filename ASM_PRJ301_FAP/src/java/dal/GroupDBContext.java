/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Group;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
import model.Student;

/**
 *
 * @author Huy
 */
public class GroupDBContext extends DBContext {

    public ArrayList<Group> getGroupByID(int groupid) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT g.GroupID, g.GroupName, s.StudentID,s.StudentName,s.Address,s.DateOfBirth,s.Gender\n"
                    + "  FROM [Group] g inner join Student s on g.GroupID = s.GroupID\n"
                    + "  where g.GroupID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, groupid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                
              Group g = new Group();
              Student s = new Student();
              
              
              g.setId(rs.getInt("GroupID"));
              g.setName(rs.getString("GroupName"));
              
              
              s.setId(rs.getInt("StudentID"));
              s.setName(rs.getString("StudentName"));
              s.setAddress(rs.getString("Address"));
              s.setDate(rs.getDate("DateOfBirth"));
              s.setGender(rs.getBoolean("Gender"));
              
              g.setStudent(s);
            
              groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

}
