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
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Student Enquiry System</a>
                    
                </div>
                
                      <%
         Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         String uid = null;
         if( cookies != null ) {
          
            for (int i = 0; i < cookies.length; i++) {
                String na = cookies[i].getName();
                if(na.equals("userid")){
                    uid = cookies[i].getValue();
                }
            }
         }
         if(uid==null){
              
      %>
            </div>
        </nav>
            <br> <br> <br> <br> <br> <br> <br> <br>
             <div class="container">
                <div class="starter">
                    <h1>Invalid User</h1>
                    <p class="lead">
                        You must login to access this page<br>
                        <a class="navbar-dark" href="login.jsp" >Login Here</a>
                    </p>
                    
                </div>
            </div>
                
    
            <%
          }else{

%>
        
                
                 <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="main.jsp">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="courseapply.jsp">Apply</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="coursestate.jsp">Courses Status</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br><br><br><br><br><br> 
         <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

        <% String dburl="jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC"; //database url string
        String dbusername="root"; //database username
        String dbpassword="admin"; //database password
        
 try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); //create connection

            PreparedStatement pstmt=null; //create statement

            pstmt=con.prepareStatement("SELECT * FROM students where stdname=?"); //sql select query
              pstmt.setString(1,uid);
            ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object "rs"
  
            while(rs.next())
            {
        
        %>

        <div class="container">
            <div class="formsection">
                <h1 class="text-center">Profile</h1>
                  <table class="table table-striped table-bordered">
              <tr><th width="20%" style="text-align: right">Name:</th>
                  <td><%= rs.getString("stdname")%>&nbsp;</td></tr>
              
               <tr><th width="20%" style="text-align: right">Gender:</th>
                  <td><%= rs.getString("gender")%></td></tr>
                <tr><th width="20%" style="text-align: right">Contact No.:</th>
                  <td><%= rs.getString("contactno")%>&nbsp;</td></tr>
                 <tr><th width="20%" style="text-align: right">Email:</th>
                  <td><%= rs.getString("email")%>&nbsp;</td></tr>
                  <tr><th width="20%" style="text-align: right">Address:</th>
                  <td><%= rs.getString("address1")%>&nbsp;</td></tr>
                   <tr><th width="20%" style="text-align: right">City:</th>
                      <td><%= rs.getString("city")%>&nbsp;</td></tr>
          </table>           
                
                
            </div>
        </div><!-- /.container -->
         <%
                    con.close();
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    
%>
        <%
              }
%>
 <br> <br> <br> <br> <br> <br> <br> 
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
