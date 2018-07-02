<%-- 
    Document   : home
    Created on : Jun 11, 2018, 4:21:09 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,com.myapp.logicBeans.Booker"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<%!
    Connection conn;
    Statement stmt;
    ResultSet rs;
    ArrayList<String> fromal=new ArrayList<String>();
    ArrayList<String> toal=new ArrayList<String>();
%>
<%	
	fromal = Booker.getFrom();
	toal = Booker.getTo(); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IRCTC</title>
    </head>
    <body>
        <html:errors/>
        <html:form action="/book.do">
        <table>
        <tr>
        <td>
            From:
        </td>
        <td>
            <html:select property="from">
            <% for(String f:fromal){%>
                <option value="<%=f%>"><%=f%></option>
            <%}%>
            </html:select>
            <br>
            </td>
        </tr>
        <tr>
        <td>
            To:
            </td>
        <td>
            <html:select property="to">
            <% for(String t:toal){%>
            <html:option value="<%=t%>"><%=t%></html:option>
            <%}%>
            </html:select>
            <br/>
         </td>
         </tr>
         <tr>
            <td>
            Day:
            </td>
            <td>
            <html:select property="day">
                <html:option value="1">Monday</html:option>
                <html:option value="2">Tuesday</html:option>
                <html:option value="3">Wednesday</html:option>
                <html:option value="4">Thursday</html:option>
                <html:option value="5">Friday</html:option>
                <html:option value="6">Saturday</html:option>
                <html:option value="7">Sunday</html:option>
            </html:select>
            <br/>
            </td>
            </tr>
            <tr>
            <td>
            <html:submit value="search"/>
            </td>
            </tr>
            </table>
        </html:form>
    </body>
</html>

