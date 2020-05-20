<%-- 
    Document   : register
    Created on : 12 Jun, 2019, 11:17:04 PM
    Author     : Animesh Chourasia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        
        <div class="container">
            <div class="formsection medium">
                <h1 class="text-center">Registration</h1>
                <form>
                 
                    <div class="form-group">
                        
        
                        <label for="stdname">Name*:</label>
                        <input id="stdname" type="text" maxlength="40" class="form-control">
                        <br>
                     <label for="gender">Gender:</label>&nbsp;&nbsp;
                        
                            <label class="custom-control custom-radio">
                                <input type="radio"  name="gender"     id="genderm"  value="male" class="form-check-input">&nbsp; Male&nbsp;
                            </label>
                            <label class="custom-control custom-radio">
                                <input id="genderf" type="radio" name="gender" value="female" class="form-check-input" >&nbsp; Female&nbsp; 
                            </label>
                            <label class="custom-control custom-radio">
                                <input id="gendert"  type="radio" name="gender" value="transgender" class="form-check-input">&nbsp; Transgender&nbsp;&nbsp;
                            </label>
                        
                         <br> <br>
                <div class="form-group">
                    <label for="add1">Address:</label>
                    <input id="add1" type="text" maxlength="100" class="form-control">
                    
                     
                    </div>
                    <div class="form-group">
                        <label for="city">City*:</label>
                        <input id="city" type="text" maxlength="40" class="form-control"></div>
                        <div class="form-group">
                          <label for="contact">Contact Number*:</label>
                        <input id="contact" type="text" maxlength="20" class="form-control"></div>   
                        
            
            <div class="form-group">
                
                <label for="email">Email Address*:</label>
                <input id="email" type="email" maxlength="100" class="form-control" name="form"> 
        </div>
                <div class="form-group">
                  <label for="pwd">Password*:</label>
                  <input id="pwd" type="password" maxlength="20" class="form-control" name="form"></div>   
                
                <div class="form-group">
                    <label for="cnfpwd">&nbsp;&nbsp;Confirm Password*:</label>
                <input id="cnfpwd" type="password" maxlength="20" class="form-control" name="form"></div>   
                    </div>

    

                <button type="button" id="btnReg" class="btn btn-primary">Register</button>
                <div class="form-group">
                    <span id="message" class="error">
          <br>              Fields marked with * are mandatory.
                    </span>
                </div> 
</form>
            </div>
                    </div><!-- /.container -->
            
        <div class="footer">
            <div class="container">
                Design &amp; Developed by: infinity technologies
            </div>
        </div>
    </body>
    <script src="bootstrap4/jquery-3.4.1.min.js ">  </script>
    <script src="bootstrap4/js/bootstrap.min.js"> </script>
    
    <script type="text/javascript">
        function isAlpha(str){
            var pattern= /^[a-zA-Z]+ [a-zA-Z]+$/; ;
            return pattern.test(str);
        }
    function isDigit(str){
        var pattern= /^[0-9]+$/ ;
        return pattern.test(str);
    }
    function isEmail(str){
        var pattern= /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/ ;
        return pattern.test(str);
    }       
  $(document).ready(function(){
      $("#btnReg").click(function(event){
          $('#message').html("Wait...");
          var sn= $("#stdname").val().trim();
          if(sn.length==0){
              $('#message').html("Enter name!");
              return;
          }
          if(!isAlpha(sn)){
              $('#message').html("Name can only have alphabets and space/ Enter your full name.");
              return;
          }
          var gn=$("input[name='gender']:checked").val();
          var add1 = $("#add1").val().trim();
          
          var ct= $("#city").val().trim();
          if(ct.length==0){
              $('#message').html("enter city!");
              return;
          }
          var cnt = $("#contact").val().trim();
          if(cnt.length==0){
              $('#message').html("Enter Contact Number");
              return;
          }
          if(!isDigit(cnt)){
              $('#message').html("Contact number can only have digits.");
              return;
          }
          var em = $("#email").val().trim();
          if(em.length==0){
              $('#message').html("enter email address.");
              return;
          }
          if(!isEmail(em)){
              $('#message').html("you must have a valid email address.");
              return;
          }
          var pw=$("#pwd").val().trim();
          if(pw.length<5){
              $('#message').html("Password must have atlest five characters !");
              return;
          }
          var pwc = $("#cnfpwd").val().trim();
          if(pwc.length==0){
              $('#message').html("Enter again");
              return;
          }
          if(pw != pwc){
              $('#message').html("both passwords must be same");
              return;
          }
      
          $.ajax({
              url:"usersav.jsp",
              type:"POST",
              data: {name:sn , gender:gn , address1:add1 , city:ct , contact:cnt
                   , email:em , passwd:pw},
               success:function(data){
                   $('#message').html(data);
                   $("#stdname").val("");
                   $("#add1").val("");
                   
                    $("#city").val("");
                     $("#contact").val("");
                      $("#email").val("");
                    $("#pwd").val("");
                    $("#cnfpwd").val("");
                   
                 
               },
               error: function(){
                   $('#message').html("An error occured in request.");
               }
          });
      });
  });
    </script>
</html>
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</html>

