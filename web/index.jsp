<%-- 
    Document   : index
    Created on : Jun 29, 2018, 4:04:08 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="javascript/jquery-3.3.1.js"></script>
        <script src="javascript/reloader.js"></script>
    </head>
    <body>
        <%
            if(request.getAttribute("error")!=null){
        %>
        <p style="color:red">Username or password is incorrect</p>
        
        <%}%>
          <html:form action="/login.do">
              Mobile: 
              <html:text property="mobile"/>
              <html:errors property="loginMobileSizeError"/>
              <html:errors property="loginMobileError"/>
              <br>
              Password:
              <html:text property="password"/>
              <html:errors property="loginPasswordError"/><br>
              <html:submit value="login"/>
          </html:form>
        <br>
        <p>New user register <a href="/Train/registerForm.jsp">here</a>.</p>
    </body>
</html>
