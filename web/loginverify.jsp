<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, length=device-length, initial-scale=1.0">
        <title>Student Enquiry System</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="bootstrap4/css/bootstrap.min.css">
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
         <%@ page import="java.sql.*" %>
          
        <%!
            public void jspInit(){
try{
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver successfully loaded");
}
catch(ClassNotFoundException ex){
System.out.println( "Problem loading driver: " +ex);
}
} %>
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Student Enquiry System</a>
                    
                </div>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="course_preview.jsp">Courses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="enquiry.jsp">Enquiry</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br><br><br><br><br><br>
        <div class="container">
            <div class="formsection">
                <h1 class="text-center">Login Verify</h1>
                
                  <%
                      String userid = request.getParameter("username");
                      String pwd = request.getParameter("password");
                        try{
                              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin");
                              String sql = "select * from students where contactno=?";
            PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, userid);
           
             ResultSet rs = ps.executeQuery();
            
                              if(rs.next()&&pwd.equals(rs.getString("passwd"))){
                                
%>                             
                                  
                                  <%  
                                      String name=rs.getString("stdname");
                                      
                  
                             Cookie user=new Cookie("userid",name);
                      
                          
                               
                             response.addCookie(user);
                              
                        out.println("Welcome," +rs.getString("stdname"));
                     
                        out.println(" <br> <a href='userh.jsp'> Go to user home page</a> ");
                         
                        
                              
                         
                
                                       }
                              
                           
             
               
                    
                 
                    
                  
                  else{
                        out.println("invalid user");
out.println(" <br> <a href='login.jsp'> Login again</a> ");
                    }
                    
                    
rs.close();
con.close();
}catch(SQLException ex){
out.println("Error in database operation:" +ex);
}
                               %>
                      
                <br><br><br><br><br><br><br>
            </div>
        </div><!-- /.container -->
        <br><br><br><br><br><br><br><br>
        <div class="footer">
            <div class="container">
                Design &amp; Developed by: infinity technologies
            </div>
        </div>
    </body>
    <!-- Bootstrap core JavaScript -->
    <script src="bootstrap4/jquery-3.4.1.min.js">  </script>
    <script src="bootstrap4/js/bootstrap.min.js"> </script>
</html>

