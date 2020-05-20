<%-- 
    Document   : courses
    Created on : 21 Apr, 2020, 11:24:52 AM
    Author     : animesh
--%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width , initial-scale=1.0">
        <title>Student Enquiry System-Admin</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="../bootstrap4/css/bootstrap.min.css">
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="../style.css">
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
                    <a class="navbar-brand" href="#">Student Enquiry System-Admin</a>
                    
                </div>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="main.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registrations.jsp">Registrations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="coursenew.jsp">New course</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="courses.jsp">Courses</a>
                    </li>
                   <li class="nav-item">
                        <a class="nav-link" href="enquiries.jsp">Enquiries</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="applications.jsp">Course Applications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../index.html">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br><br><br><br><br><br>
        <div class="container">
            <div class="starter">
                <h1>Courses</h1>
                <p class="lead">
                    <br>
     
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Duration(in weeks)</th>
                            <th>Description</th>
                            <th>Course Image</th>
                            
                        </tr>
                        <%
                        try{
                              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin");
                              Statement st = con.createStatement();
                              ResultSet rs = st.executeQuery("select coursename,duration,description,imagename from courses order by id");
                              if(rs.next()){
                              do{
                              String cname=rs.getString(1);
                              String dur=rs.getString(2);
                              String des=rs.getString(3);
                              String cimg=rs.getString(4);
                              
                           %> 
                           
                              
                    </thead>
                    <tbody>
                  
                                <tr>
                                    <td><%= cname %></td>
                                     <td><%= dur %></td>
                                     <td><%= des %></td>
                                     <td><img src="../images/<%= cimg %>" style="width: 96px;height: 96px"></td>
                                     
                                     
                                </tr>
                                <% }while(rs.next());
}else{
out.println("no record found!");
}
con.close();
}catch(SQLException ex){
out.println("Error in database operation:" +ex);
}
                               %>
                    </tbody>
                </table>
            </p>
           
                                
                                    
                            
                    
                
                <br><br><br><br><br><br><br><br>
        </div>
        </div><!-- /.container -->
        <div class="footer">
            <div class="container">
                Design &amp; Developed by: infinity technologies
            </div>
        </div>
    </body>
    <!-- Bootstrap core JavaScript -->
    <script src="../bootstrap4/jquery-3.4.1.min.js">  </script>
    <script src="../bootstrap4/js/bootstrap.min.js"> </script>
</html>


