



<%@ page import="studbean.Email"%> 

<jsp:useBean id="test" class="studbean.Email" />
    <jsp:setProperty name="Email" property="*" />
                     
                   


<%
Email em =new Email();
em.sendFromGmail();

%>
