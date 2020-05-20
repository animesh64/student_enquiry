<%-- 
    Document   : coursesave
    Created on : 20 Apr, 2020, 12:49:41 AM
    Author     : animesh
--%>

<%@ page contentType="application/json"%>
<%@page import="org.json.simple.*,studbean.*,java.util.*"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.*,javax.servlet.*,java.io.*,com.oreilly.servlet.*,java.util.HashMap"%>
<%@page language="java" import="javazoom.upload.*"%>
<jsp:useBean id="upBean" class="javazoom.upload.UploadBean">
    <jsp:setProperty name="upBean" property="storemodel" value="<%=UploadBean.FOLDERSTORE %>" />
                     
                     </jsp:useBean>
<jsp:useBean id="crsBean" class="studbean.CourseBean" />

<%
JSONObject jsonResp =new JSONObject();
if(MultipartFormDataRequest.isMultipartFormData(request)){
MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
if(mrequest!=null){
Hashtable files = mrequest.getFiles();
if((files!=null)&&(!files.isEmpty())){
UploadFile file = (UploadFile)files.get("crsimg");
if(file!=null){
String path = request.getRealPath("images");
upBean.setFolderstore(path);
Date dt = new Date();
long tm = dt.getTime();
String rec_fn = file.getFileName();
String file_name = "file" +tm+ "." +rec_fn.substring(rec_fn.lastIndexOf(".")+1);
file.setFileName(file_name);
HashMap hm = new HashMap() ;
hm.put("filename", file_name);

String cn = mrequest.getParameter("coursename");
String du = mrequest.getParameter("duration");
String des = mrequest.getParameter("description");
String cnt = mrequest.getParameter("contents");
byte[] cntData = cnt.getBytes();
upBean.store(mrequest,"crsimg",hm);


%>
    
     <jsp:setProperty name="crsBean" property="coursename" value="<%=cn %>" />
     <jsp:setProperty name="crsBean" property="duration" value="<%=du %>" />
     <jsp:setProperty name="crsBean" property="description" value="<%=des %>" />
     <jsp:setProperty name="crsBean" property="contents" value="<%=cntData %>" />
     <jsp:setProperty name="crsBean" property="imagename" value="<%=file_name %>" />
     
     <%
         if(crsBean.validate()){
             if(crsBean.save()){
                 jsonResp.put("status","success");
             }else{
                 jsonResp.put("status","error");
             
             jsonResp.put("message",crsBean.getMessage());
         }
         }else{
                 jsonResp.put("status","error");
                 jsonResp.put("status","No uploaded files found in request");
         }
         }else{
                 jsonResp.put("status","error");
                 jsonResp.put("status","No uploaded files");
}


out.println(jsonResp.toJSONString());
}
}
}


%>
