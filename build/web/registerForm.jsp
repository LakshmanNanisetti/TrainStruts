<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>

        </style>
    </head>
    <body>
        <div>
            <html:form action="/register.do">
              Name:
              <html:text property="name"/>
              <html:errors property="nameError"/><br/>
              Mobile:
              <html:text property="mobile"/>
              <html:errors property="mobileSizeError"/>
              <html:errors property="mobileError"/>
              <html:errors property="mobileExistsError"/><br/>
              Age:
              <html:text property="age"/>
              <html:errors property="ageError"/><br/>
              Password:
              <html:text property="password"/>
              <html:errors property="passwordError"/><br/>
              <html:submit value="submit"/>
              
            </html:form>
            <p>Registered already? Login <a href="index.jsp"> here</a></p>
            <!--<p><a href="./admin/admin.html">admin</a></p>-->
        </div>
        
    </body>
</html>
