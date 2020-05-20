<%-- 
    Document   : coursenew
    Created on : 14 Apr, 2020, 5:44:32 PM
    Author     : animesh
--%>

<html lang="en">
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, length=device-length, initial-scale=1.0">
        <title>Student Enquiry System-Admin</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="../bootstrap4/css/bootstrap.min.css">
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
         <%@ page import="java.sql.*" %>
         <%@ page import="com.oreilly.servlet.MultipartRequest" %>
         <%@ page import="java.util.Enumeration" %>
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
                        <a class="nav-link" href="registrations.jsp">Registration</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="coursenew.jsp">New course</a>
                    </li>
                    <li class="nav-item">
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
        <br><br><br>
    
        <div class="container">
            <div class="formsection">
                <h1 class="text-center">New Course</h1>
                <p class ="lead">
                <form>
                    <div class="form-group">
                        <label for="coursename">Course Name*:</label>
                        <input type="text" name="coursename" id="coursename" maxlength="40" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="duration">Duration*:</label>
                        <input type="text" name="duration" id="duration" maxlength="100" placeholder="in weeks" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="description">description*:</label>
                        <textarea id="description" name="description" maxlength="500" rows="3" cols="100" class="form-control" /></textarea>
                    
                    </div>
                     <div class="form-group">
                        <label for="contents">Course Contents*:</label>
                        <textarea id="contents" name="contents" rows="3" cols="100" class="form-control" /></textarea>
                    
                    </div>
                   
                     <div class="form-group">
                        <label for="crsimg">Course Image*:</label>
                        <input type="file" id="crsimg" name="crsimg" class="form-control" /></div>
                     
                        <button type="button" name="btnSave" id="btnSave" class="btn btn-primary">Save</button>
                  <div class="form-group">
                    <span id="message" class="error">Fields marked with * are mandatory.</span>
                   </div>
                    
                </form>
            </p>
            </div>
        </div>
    
        <div class="footer">
            <div class="container">
                 Design &amp; Developed by: infinity technologies
            </div>
                
        </div>
    
            </div>
        </div>
    </body>
    <!-- Bootstrap core JavaScript -->

 <script src="../bootstrap4/jquery-3.5.0.js">  </script>
    <script src="../bootstrap4/js/bootstrap.min.js"> </script>
    
    <script type="text/javascript">
         $(document).ready(function(){
      $("#btnSave").click(function(event){
          $('#message').html("");
          var cn= $("#coursename").val().trim();
          if(cn.length==0){
              $('#message').html("Enter course name!");
              return;
          }
          var du= $("#duration").val().trim();    
          if(du.length==0){
              $('#message').html("Enter course duration!");
              return;
          }
           var des= $("#description").val().trim();
            var cnt= $("#contents").val().trim();
            var crsImg= $("#crsimg").prop("files")[0];
             
             var formData = new FormData();
             formData.append("coursename",cn);
             formData.append("duration", du);
             formData.append("description",des);
             formData.append("contents",cnt);
            formData.append("crsimg",crsImg);
             $('#message').html("Wait! saving... ");
             
        $.ajax({
              url:"coursesave.jsp",
              type:"POST",
              cache:false,
              processData:false,
              contentType:false,
              data: formData ,
               success:function(jsonObj){
                   $('#message').html(jsonObj.message);
                     $("#coursename").val("");
                      $("#duration").val("");
                       $("#description").val("");
                        $("#contents").val("");
                         $("#crsimg").val("");
               
           },
               
  error: function(a,b,c){
      $('#message').html("An error occured in request.");
  
      }
      
  });
   
  });
         });
  
  
    </script>
                     
</html>   
    


