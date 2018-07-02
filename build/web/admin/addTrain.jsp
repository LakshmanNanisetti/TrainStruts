<%-- 
    Document   : register
    Created on : Jun 11, 2018, 5:48:45 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,src.Booker"%>
<%@page import="java.io.*,java.sql.DriverManager,java.sql.*,src.Train,javax.servlet.*,javax.servlet.http.*,java.util.*"%>
<%!
   private String message;
   private Connection conn;
   private Statement stmt;
   private ResultSet rs;
   private ArrayList<Train> trains; 
%>
<body>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/irctc","root","root");
        stmt = conn.createStatement();
        out.println(request.getParameter("monday"));
        if((request.getParameter("monday"))!=null){
            out.println(request.getParameter("monday"));
            stmt.execute("insert into train(no,name,f,t,day,cost) values("+Integer.parseInt(request.getParameter("trainNo"))+",'"
            +request.getParameter("trainName")+"','"+request.getParameter("from")+"','"
            +request.getParameter("to")+"',1,"+Double.parseDouble(request.getParameter("fare"))+");");
        }
        if(request.getParameter("tuesday")!=null){
            stmt.execute("insert into train(no,name,f,t,day,cost) values("+Integer.parseInt(request.getParameter("trainNo"))+",'"
            +request.getParameter("trainName")+"','"+request.getParameter("from")+"','"
            +request.getParameter("to")+"',2,"+Double.parseDouble(request.getParameter("fare"))+");");
        }
        if(request.getParameter("wednesday")!=null){
            stmt.execute("insert into train(no,name,f,t,day,cost) values("+Integer.parseInt(request.getParameter("trainNo"))+",'"
            +request.getParameter("trainName")+"','"+request.getParameter("from")+"','"
            +request.getParameter("to")+"',3,"+Double.parseDouble(request.getParameter("fare"))+");");
        }
        if(request.getParameter("thursday")!=null){
            stmt.execute("insert into train(no,name,f,t,day,cost) values("+Integer.parseInt(request.getParameter("trainNo"))+",'"
            +request.getParameter("trainName")+"','"+request.getParameter("from")+"','"
            +request.getParameter("to")+"',4,"+Double.parseDouble(request.getParameter("fare"))+");");
        }
        if(request.getParameter("friday")!=null){
            stmt.execute("insert into train(no,name,f,t,day,cost) values("+Integer.parseInt(request.getParameter("trainNo"))+",'"
            +request.getParameter("trainName")+"','"+request.getParameter("from")+"','"
            +request.getParameter("to")+"',5,"+Double.parseDouble(request.getParameter("fare"))+");");
        }
        if(request.getParameter("saturday")!=null){
            stmt.execute("insert into train(no,name,f,t,day,cost) values("+Integer.parseInt(request.getParameter("trainNo"))+",'"
            +request.getParameter("trainName")+"','"+request.getParameter("from")+"','"
            +request.getParameter("to")+"',6,"+Double.parseDouble(request.getParameter("fare"))+");");
        }
        if(request.getParameter("sunday")!=null){
            stmt.execute("insert into train(no,name,f,t,day,cost) values("+Integer.parseInt(request.getParameter("trainNo"))+",'"
            +request.getParameter("trainName")+"','"+request.getParameter("from")+"','"
            +request.getParameter("to")+"',7,"+Double.parseDouble(request.getParameter("fare"))+");");
        }
    }catch(Exception e){
        
          System.out.println("triansget connn: "+e);
      }
%>
<%-- <jsp:forward page="admin.html"/> --%>
</body>
</html>
