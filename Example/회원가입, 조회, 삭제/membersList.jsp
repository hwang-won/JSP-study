<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/odbo";
	String username = "root";
	String password = "971025";
	Connection conn = null;
	
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
	
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT id, email, signuptime From members");
	
	String str = "<table border=1>";
	str += "<tr align=center><td>번호</td><td>id</td><td>email</td><td>time</td></tr>";
	
	int count = 1;
	
	while(rs.next()) {
		str += "<tr> <td>" + count + "</td> <td>" + rs.getString("id") + "</td> <td>" + rs.getString("email") 
					+ "</td> <td>" + rs.getString("signuptime") + "</td> </tr>";
		count++;
	}
	str += "</table>";
	out.print("home > 회원가입 명단 <hr>");
	out.print(str);
	
	rs.close();
	sm.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>

</body>
</html>