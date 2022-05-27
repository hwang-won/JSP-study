<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
	String u_id = request.getParameter("userID");
	String u_pw = request.getParameter("userPW");
	String u_mail = request.getParameter("userMAIL");
	
	String sql1 = "select id from members where id=' " + u_id + "'";
	Statement sm1 = conn.createStatement();
	ResultSet rs = sm1.executeQuery(sql1);
	boolean found=rs.next();
	
	if(!found) {
		String sql = "INSERT INTO members(id, passwd, email) VALUES(?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, u_id);
		stmt.setString(2, u_pw);
		stmt.setString(3, u_mail);
		stmt.executeUpdate();
		
	}
	
	
	Statement sm = conn.createStatement();
	
	int count = sm.executeUpdate(sql);
	if(count == 1){
		response.sendRedirect("signupSuccess.jsp");
	}else{
		out.println("회원가입 실패!");
		response.sendRedirect("signup.jsp");
	}
	sm.close();
	conn.close();	
%>