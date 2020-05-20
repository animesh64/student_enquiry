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
public class StudentBean implements java.io.Serializable {
    int id;
    String username,contactno,emailid,password,usergender,add1,cityname,state;
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
public String getUsername(){
    return username;
}
public void setUsername(String username){
    this.username=username;
}
public String getUsergender(){
    return usergender;
}
public void setUsergender(String usergender){
    this.usergender=usergender;
}
public String getAdd1(){
    return add1;
}
public void setAdd1(String add1){
    this.add1=add1;
}


public String getCityname(){
    return cityname;
}
public void setCityname(String cityname){
    this.cityname=cityname;
}
public String getContactno(){
    return contactno;
}
public void setContactno(String contactno){
    this.contactno=contactno;
}
public String getEmailid(){
    return emailid;
}
public void setEmailid(String emailid){
    this.emailid=emailid ;
    
}
    public String getPassword(){
        return password;
    }    
public void setPassword(String password){
    this.password=password;
}
public String getMessage(){
    return message;
    
}
public void setMessage(String message){
    this.message=message;
}
public String getState(){
    return state ;
}
public void setState(String state){
    this.state=state;
}
public boolean validate(){
    message="";
    boolean state=true;
    if(username==null || username.trim().length()==0){
        message=message + "<br>Name cannot be blank";
        state=false;
    }
    ValidationBean vb=new ValidationBean();
    if(username!=null || username.trim().length()>0){
        if(!vb.isAlpha(username)){
            message=message+"Name cannot have numbers";
            state=false;
        }
    }
    return state;
}
public int save(){
    int saveState=-1;
    boolean state=true;
    try{
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin")) {
            String sql = "select * from students where contactno=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,contactno);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                message = message + "Given contact number already exist";
                state=false;
                
            }
            
            rs.close();
            sql = "select * from students where email=?";
            ps=con.prepareStatement(sql);
            ps.setString(1,emailid);
            rs=ps.executeQuery();
            if(rs.next()){
                message = message + "Given email address already exist";
                state=false;
                
            }
            rs.close();
            if(state==true){
                sql = "insert into students(stdname,gender,address1,city,contactno,email,passwd) values(?,?,?,?,?,?,?)";
                ps=con.prepareStatement(sql);
                
                ps.setString(1, username);
                ps.setString(2, usergender);
                ps.setString(3, add1);
                ps.setString(4, cityname);
                ps.setString(5, contactno);
                ps.setString(6, emailid);
                ps.setString(7, password);
                
                int n= ps.executeUpdate();
                message=message+" registered successfully";
                
            }
        }
                          
                      }catch(SQLException ex){
                          message="Error in database operation:"+ex;
                          
                      }
    return saveState;
                      }
    

public List<StudentBean> getStudents(){
List<StudentBean> list=new ArrayList<>();
try{
    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "animesh")) {
        String sql = "select * from students order by stdname";
        PreparedStatement ps = con.prepareStatement(sql);
        
        try (ResultSet rs = ps.executeQuery()) {
            while(rs.next()){
                StudentBean sb=new StudentBean();
                sb.setUsername(rs.getString(1));
                sb.setUsergender(rs.getString(2));
                sb.setAdd1(rs.getString(0x3));
                sb.setCityname(rs.getString(4));
                sb.setContactno(rs.getString(5));
                sb.setEmailid(rs.getString(6));
                list.add(sb) ;
            }
        }
    }
        }
                
    

catch(SQLException ex){
message = "Error in database operation :" +ex;
}
return list;
}


public StudentBean validateUser(){
    StudentBean sb=null;
    try{
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin")) {
            String sql = "select * from students where contactno=? or email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            if(rs.next() && password.equals(rs.getString(8))){
                sb=new StudentBean();
                sb.setId(rs.getInt(1));
                sb.setUsername(rs.getString(2));
                sb.setUsergender(rs.getString(3));
                sb.setAdd1(rs.getString(4));
                sb.setCityname(rs.getString(5));
                sb.setContactno(rs.getString(6));
                sb.setEmailid(rs.getString(7));
                
            }
            rs.close();
        }
}
catch(SQLException ex){
message = "Error in database operation :" +ex;
}
return sb;

}
    }






































































    

