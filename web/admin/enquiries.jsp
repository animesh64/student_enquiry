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
                    <li class="nav-item ">
                        <a class="nav-link" href="courses.jsp">Courses</a>
                    </li>
                   <li class="nav-item active">
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
        <br>
        <div class="container">
            <div class="starter">
                <h1>Enquiries</h1>
                <p class="lead">
                    <br>
     
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            
                            <th>Contact no.</th>
                            <th>Details</th>
                        </tr>
                         </thead>
                       <%
                        try{
                              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin");
                              Statement st = con.createStatement();
                              ResultSet rs = st.executeQuery("select stdname,contactno,email,courses,comment,id from enquiry order by id");
                              if(rs.next()){
                              do{
                              String name=rs.getString(1);
                              String cnt=rs.getString(2);
                              String email=rs.getString(3);
                              String crs=rs.getString(4);
                              String enq=rs.getString(5);
                              int id= rs.getInt(6) ;
                           %> 
                           
                              
                   
                    <tbody>
                  
                                <tr>
                                    <td><%= name %></td>
                                     
                                     <td><%= cnt %></td>
                                     <td> <button type="button" class="btn btn-md btn-success" data-toggle="modal" data-target="#enqModal" id="<%= id %>" >Details</button></td>
                                     
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
           
                                
                                    
                            
                    
                
            <br><br><br><br>
        </div>
        </div><!-- /.container -->
        <div class="footer">
            <div class="container">
                Design &amp; Developed by: infinity technologies
            </div>
        </div>
    </body>  
      <!-- Bootstrap core JavaScript -->
    <script src="../bootstrap4/jquery-3.5.0.min.js">  </script>
    <script src="../bootstrap4/js/bootstrap.min.js"> </script>
   
    
        
                                        
    
    <div id="enqModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Enquiry</h4>
        <button type="button" class="close pull-right" data-dismiss="modal" aria-label="Close">
          &times;
        </button>
      </div>
      <div class="modal-body">
          <div id="show-data"></div>
         
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-info" id="btnSend">Send Mail</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    
        
<script type="text/javascript">
    $(document).ready(function(){
       $('.btn-success').click(function(){
           var id=$(this).attr("id");
           $.ajax({
              url:"enquiryinfo.jsp",
              type:"post",
              data:{uid:id},
              success:function(data){
                $("#show-data").html(data);
                 
              }
           });
       });
       
        $("#btnSend").click(function(event){
            event.preventDefault();
        
           var email=$("#email").text().trim();
           var message=$("#remark").val();
           if(message===""){
               $("#remark").val("Enter message here");
               return;
           }
           $.ajax({
              url:"sendmail.jsp",
              type:"post",
              cache:false,
              dataType:"json",
              data:{email:email, message:message},
              success:function(jsonObj){
                $("#enqModal").modal('hide'); 
                 $("#message").html(jsonObj.message); 
             },
             error:function(a,b,c){
                 $("#message").html("Some Error"); 
             }
         });
     });
       
    });
</script> 
                               
    
   
  
</html>


