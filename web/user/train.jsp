<%-- 
    Document   : train
    Created on : Jun 11, 2018, 6:14:02 PM
    Author     : Administrator
--%>

<%@page import="java.sql.*,java.util.*,com.myapp.logicBeans.Booker"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ page import="com.myapp.formBeans.BookForm"%>
<%!
    String from;
    String to;
    Integer day;
    Connection conn;
    Statement stmt;
    ResultSet rs;
    HashMap<Integer, String> trains;
    int no=0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trains</title>
        <script src="js/jquery-3.3.1.js"></script>
    </head>
    <body>

        <%
            BookForm travelBean = (BookForm) session.getAttribute("BookForm");
            session.setAttribute("day", travelBean.getDay());
            from = travelBean.getFrom();
            to = travelBean.getTo();
            day = travelBean.getDay();
            trains = Booker.getTrains(from, to, day);
        %>
        <div style="color:red">
            <html:errors />
        </div>
        
        <html:form method="POST" action="/train.do">
            <div id="hint">
            </div>
            <br />
            <select name="trainNo">
                <%
                    for (Map.Entry<Integer, String> me : trains.entrySet()) {
                %>
                <option value="<%=me.getKey()%>"><%=me.getValue()%></option>
                <%
                    }
                %>
            </select>
            <html:select property="category">
                <html:option value="ac">AC</html:option>
                <html:option value="sl">SL</html:option>       
            </html:select>
            <input id="seats" type="number" name="seats" min=1 max=20 value=1 required>
            <div id="pass">
                <table>
                    <tr><th>S.No</th><th>Name</th><th>Age</th><th>Gender</th></tr>
                <%  if(session.getAttribute("seats")!=null){
                        no = (Integer)session.getAttribute("seats");
                        session.setAttribute("seats",null);
                    }else{
                        no=1;
                        session.setAttribute("seats",null);
                    }
                    for(int i=1;i<=no;i++){
                    String name="value(name"+i+")";
                    String gen="value(gen"+i+")";
                    String age="value(age"+i+")";
                %>
                    <tr>
                        <td><%=i%></td>
                        <td><html:text property="<%=name%>" /></td>
                        <td><html:text property="<%=age%>"/></td>
                        <td>
                            <html:select property="<%=gen%>">
                                <html:option value="1">Male</html:option>
                                <html:option value="2">FeMale</html:option>
                            </html:select>
                        </td>
                    </tr>
                <%}
                
                    session.setAttribute("seats",null);
                %>
                </table>
            </div>
            <button type="button" onclick="getPass()">ok</button>
            <button type="button" onclick="clearInputs()">clear</button><br/>
            <input id="submit1" type="submit" value="submit">

        </html:form>
        <script>
            function getPass() {
                var seats = document.getElementById("seats").value;
                console.log(seats);
                var xh = new XMLHttpRequest();
                xh.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("hint").innerHTML = this.responseText;
                        $( "#pass" ).load(window.location.href + " #pass" );
                    }
                };
                xh.open("POST", "/Train/user/trainPass.jsp", true);
                xh.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xh.send("seats=" + seats);
            }
            function createInputs() {
                var seats = document.getElementById('seats').value;
                var temp = "<table>", i = 0, age, gender;
                temp += "<tr><th>S.No</th><th>Name</th><th>Age</th><th>Gender</th></tr>"
                for (i = 1; i <= seats; i++) {
                    temp += "<tr>";
                    temp += "<td>" + i + "</td>";
                    age = "<td><input id=age" + i + " type=number min=1 name=age" + i + " required></td>";
                    gender = "<td><select id=gen" + i + " name=gen" + i + " required>" +
                            "<option value=1>male</option>" +
                            "<option value=2>female</option></select></td>";
                    temp += ("<td><input id=pass" + i + " name=pass" + i + " required></td>" + age + gender);
                    temp += "</tr>";
                }
                temp += "</table>"
                document.getElementById('pass').innerHTML = temp;
                document.getElementById('submit1').disabled = false;
                document.getElementById('submit1').style.display = "block";
            }
            function clearInputs() {
                var seats = document.getElementById('seats').value, i;
                for (i = 1; i <= seats; i++) {
                    document.getElementById("age" + i).value = "";
                    document.getElementById("pass" + i).value = "";
                }
            }
            function checkNumber() {
                if (Number.isNumber(this.value)) {
                    document.getElementById("hint").innerHTML = "";
                } else {
                    document.getElementById("hint").innerHTML = "age must be a number";
                }
            }
        </script>
    </body>
</html>