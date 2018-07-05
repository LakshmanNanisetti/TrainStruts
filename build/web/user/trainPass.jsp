<%-- 
    Document   : trainPass
    Created on : Jul 3, 2018, 7:01:55 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        int no = Integer.parseInt(request.getParameter("seats"));
        session.setAttribute("seats",no);
        response.getWriter().write("loaded");
        %>
    </body>
</html>
