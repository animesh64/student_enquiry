/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package studbean;

import java.sql.* ;
import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author Animesh Chourasia
 */
public class CourseBean implements java.io.Serializable {
    int id;
    String coursename,duration,imagename,description;
    String status = "Active";
    private byte[] contents;
    String message="";
    static{
        try{
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver successfully loaded");
        
    }catch(ClassNotFoundException ex){
    System.out.println("Problem loading driver" +ex);
    
}
    }
public int getId(){
    return id;
}
public void setId(int id){
    this.id=id;
}
public String getCoursename(){
    return coursename;
}
public void setCoursename(String coursename){
    this.coursename=coursename;
}
public String getDuration(){
    return duration;
}
public void setDuration(String duration){
    this.duration=duration;
}
public String getImagename(){
    return imagename;
}
public void setImagename(String imagename){
    this.imagename=imagename;
}


public String getDescription(){
    return description ;
}
public void setDescription(String description){
    this.description=description;
}

    

    public byte[] getContents(){
        return contents;
    }    
public void setContents(byte[] contents){
    this.contents=contents;
}
public String getMessage(){
    return message;
    
}
public void setMessage(String message){
    this.message=message;
}
public String getStatus(){
    return status ;
}
public void setStatus(String status){
    this.status=status;
}
public boolean validate(){
    message="";
    boolean state=true;
    if(coursename==null || coursename.trim().length()==0){
        message=message + "<br>Course name cannot be blank";
        state=false;
    }
    return state ;
}

public boolean save(){
    boolean state = true ;
     
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin");
            String sql = "select id from courses where coursename=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,coursename);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                message = message + "Given course name already exist";
                state=false;
                
            
           
           
                
            }
            rs.close();
            if(state==true){
                sql = "insert into courses(coursename,duration,imagename,description,contents) values(?,?,?,?,?)";
                ps=con.prepareStatement(sql);
                
                ps.setString(1, coursename);
                ps.setString(2, duration);
                ps.setString(3, imagename);
                ps.setString(4, description);
              Blob blob = con.createBlob();
              blob.setBytes(1, contents);
                      ps.setBlob(5, blob);
                      
                      int n = ps.executeUpdate();
                      message = coursename + "saved successfully";
            
            }con.close();
        }catch(SQLException ex){
                          state = false;
                      
                          message="Error in database operation:"+ex;
                          
                      }
    return state;
                      
    

        }
}
   