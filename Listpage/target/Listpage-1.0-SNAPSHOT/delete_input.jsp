<%@page import="com.mycompany.listpage.TblboardDao"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
int num = Integer.parseInt(request.getParameter("num")); 
String passwd = request.getParameter("passwd"); 
String sql = "select * from tblboard where num = "+num+"and passwd="+passwd+"'";
TblboardDao td = new TblboardDao();
if(!td.existATuple(sql)){
    %>
    <a href="delete_pass.jsp?ERR="num 또는 passwd 불일치">
        오류</a>
    <%
}
sql = "delete from tblborad where num=? and pass=?";
int n = td.deleteATuple(sql,num,passwd);
if(n>1)out.print("성공");
else{
    
}
/*

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

String url = "jdbc:odbc:dbMember";
Connection conn = DriverManager.getConnection(url,"Member","apple");

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pass FROM tblboard WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String goodpass = rs.getString("pass").trim();
if (pass.equals(goodpass)){
	strSQL = "DELETE From tblboard WHERE num=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();
	
	strSQL = "UPDATE tblboard SET num = num - 1 WHERE num > ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(num));
	pstmt.executeUpdate();

	response.sendRedirect("/jsp/listboard.jsp");
}else{
	response.sendRedirect("delete_pass.jsp?num=" + num);
}

rs.close();
pstmt.close();
conn.close();
*/
%>
