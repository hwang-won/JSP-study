<%@ page import = "java.sql.*" %>    
<%@ page import="util.ConnectionPool" %>

<%
	Connection conn = ConnectionPool.get();
	
	//Connection conn = null;
	//String url = "jdbc:mysql://localhost:3306/odbo";
	//String user = "root";
	//String passwd = "971025";
	//Class.forName("com.mysql.jdbc.Driver");
	//conn = DriverManager.getConnection(url, user, passwd);
	
%>    