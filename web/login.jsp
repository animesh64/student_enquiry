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
                    <li class="nav-item active">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br><br> <br><br>
        <div class="container">
            <div class="formsection">
                <h1 class="text-center">Login</h1><br>
                <form id="loginfrm" action="loginverify.jsp" method="post">
                    <div class="form-group">
                        <label for="userid">Contact Number/Email Address*:</label>
                        <input id="username" name="username" type="text" maxlength="120" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:*</label>
                        <input id="password" name="password" type="password" maxlength="20" class="form-control">
                    </div>
                    <button type="submit" id="btnlogin" class="btn btn-primary">Login</button>
                    <div class="form-group"> <span id="message" class="error">
                            Fields marked with * are mandatory.</span></div>
                </form>
                
             
                
            </div>
        </div><!-- /.container -->
        <br> <br> <br> <br> <br>
        <div class="footer">
            <div class="container">
                Design &amp; Developed by: infinity technologies
                
            </div>
        </div>
    </body>
    <!-- Bootstrap core JavaScript -->
    <script src="bootstrap4/jquery-3.4.1.min.js">  </script>
    <script src="bootstrap4/js/bootstrap.min.js"> </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#loginfrm").on(submit,function(event){
                var msg="";
                var state=true;
                $("#message").html("");
                console.log("Submitted");
                var uid= $("#userid").val().trim();
                if(uid==""){
                    msg="Enter contact no. or emai id";
                    state=false;
                    
                }
                var pwd= $("#pwd").val().trim();
                if(pwd==""){
                    msg=+"Enter password";
                    state=false;
                    
                }
                if(state==false){
                    $("#message").html(msg);
                    
                }
                return state;
            });
        });
        </script>
</html>

