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
                    <li class="nav-item active">
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
        <br>
        <div class="container">
            <div class="starter">
              
               
                 <div class="formsection form-center">
                     <h1 class="text-center"><u>Enquiry</u></h1><br>
               <form class="text-left form-center">
  <div class="form-group">
      <label for="name"><b>Name</b></label>
    <input type="text" class="form-control" id="name" name="name" placeholder="name">
  </div>
   <div class="form-group">
       <label for="contact"><b>Contact Number</b></label>
    <input type="text" class="form-control" id="contact" name="contact" placeholder="contact number">
  </div>
  <div class="form-group">
      <label for="email"><b>Email address</b></label>
    <input type="email" class="form-control" id="email" name="email" placeholder="email address">
  </div>
  <div class="form-group">
      <label for="course" id="course"><b>Course(s)</b></label>
     &nbsp;&nbsp;
                        
                            <label class="custom-control custom-radio">
                                <input type="radio"  name="course"     id="c"  value="c_programming" class="form-check-input">C Programming
                            </label>
                            <label class="custom-control custom-radio">
                                <input id="c+" type="radio" name="course" value="c++_programming" class="form-check-input" > C++ Programming
                            </label>
                            <label class="custom-control custom-radio">
                                <input id="javac"  type="radio" name="course" value="java(c)" class="form-check-input">JAVA(core)
                            </label>
     <label class="custom-control custom-radio">
                                <input id="javaa"  type="radio" name="course" value="java(a)" class="form-check-input">JAVA(advanced)
                            </label>
  </div>
                   <br>
                    <div class="form-group">
                        <label for="comment"><b>Enquiry/Feedback</b></label>
    <textarea class="form-control" id="comment" name="comment" maxlength="500" rows="3"
              cols="100"></textarea>
  </div>
                   <button type="button" id="btnSend" class="btn btn-primary">Submit</button>
                   <div class="form-group">
                       <span id="message" class="error">Fields marked with * are mandatory.</span>
                   </div>
 
</form>
                 </div>     
                
                <br><br>
            </div>
        </div><!-- /.container -->
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
      $("#btnSend").click(function(event){
          $('#message').html("Wait...");
          var sn= $("#name").val().trim();
          if(sn.length==0){
              $('#message').html("Enter name!");
              return;
          }
          var crs=$("input[name='course']:checked").val();
       
          
          var cnt= $("#contact").val().trim();
          if(cnt.length==0){
              $('#message').html("enter city!");
              return;
          }
          
          var em = $("#email").val().trim();
          if(em.length==0){
              $('#message').html("enter email address.");
              return;
          }
         var cmt = $("#comment").val();
        
      
          $.ajax({
              url:"enquirysave.jsp",
              type:"POST",
              data: {name:sn , courses:crs , contact:cnt
                   , email:em , comment:cmt},
               success:function(data){
                   $('#message').html(data);
                   $("#name").val("");
                   $("#courses").val("");
                   
                    $("#contat").val("");
                    
                      $("#email").val("");
                   
                    $("#comment").val("");
                   
                 
               },
               error: function(){
                   $('#message').html("An error occured in request.");
               }
           });
      });
  });
   
 </script>
</html>
    
    
    