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
         String val = null;
         if( cookies != null ) {
          
            for (int i = 0; i < cookies.length; i++) {
                String na = cookies[i].getName();
                if(na.equals("userid")){
                    val = cookies[i].getValue();
                }
            }
         }
         if(val==null){
            
          
        
         
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
                    <li class="nav-item active">
                        <a class="nav-link" href="main.jsp">Home</a>
                    </li>
                    <li class="nav-item">
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
        <br><br><br><br><br><br><br><br>
        <div class="container">
            <div class="starter">
                <h1>Student Enquiry System</h1>
                <p class="lead">Welcome <%= val %> <br>
                </p><br>
               
           
                
                
            </div>
        </div><!-- /.container -->
        <%
            }
%>
 <br> <br> <br> <br> <br> <br> <br> <br> <br>
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
