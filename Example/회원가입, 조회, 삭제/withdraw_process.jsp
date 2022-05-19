<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_id = request.getParameter("userID");
	String sql = "DELETE FROM members WHERE id = ?";
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/odbo";
	String username = "root";
	String password = "971025";
	Connection conn = null;
	
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
	
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_id);
	
	int count = sm.executeUpdate();
	
	if(count == 1) {
		out.println("회원 탈퇴 성공");
	} else {
		out.println("회원 탈퇴 실패");
	}
	sm.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>