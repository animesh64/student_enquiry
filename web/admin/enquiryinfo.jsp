<%-- 
    Document   : enquiryinfo
    Created on : 26 Apr, 2020, 9:25:40 PM
    Author     : animesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    if(request.getParameter("uid")!=null) //get "uid" from index.jsp file jQuery ajax part this line "uid="+id".
    {
        int id=Integer.parseInt(request.getParameter("uid")); //get "uid" and store in new "id" variable
        
        String dburl="jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC"; //database url string
        String dbusername="root"; //database username
        String dbpassword="admin"; //database password

        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); //create connection

            PreparedStatement pstmt=null; //create statement

            pstmt=con.prepareStatement("SELECT * FROM enquiry WHERE id=?"); //sql select query
            pstmt.setInt(1,id); //variable "id" set this
            ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object "rs"

            while(rs.next())
            {
                %>
                <div class="table-responsive">
  
         
                    
                     <table class="table table-striped table-bordered">
              <tr><th width="20%" style="text-align: right">Name:</th>
                  <td><%=rs.getString("stdname")%>&nbsp;</td></tr>
              
               <tr><th width="20%" style="text-align: right">Contact:</th>
                  <td id="contact"><%=rs.getString("contactno")%> &nbsp;</td></tr>
                <tr><th width="20%" style="text-align: right">email:</th>
                  <td><%=rs.getString("email")%>&nbsp;</td></tr>
                 <tr><th width="20%" style="text-align: right">Course:</th>
                  <td><%=rs.getString("courses")%>&nbsp;</td></tr>
                  <tr><th width="20%" style="text-align: right">Enquiry/Feedback:</th>
                  <td><%=rs.getString("comment")%>&nbsp;</td></tr>
                   <tr><th width="20%" style="text-align: right">Message:</th>
                       <td> <textarea id="remark" maxlength="500" rows="3" cols="100" class="form-control"></textarea></td></tr>
          </table>
   
                </div>
                <%
                    con.close();
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
%>
    </body>
</html>
