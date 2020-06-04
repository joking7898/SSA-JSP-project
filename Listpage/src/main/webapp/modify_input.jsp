<%@page import="com.mycompany.listpage.TblboardBean"%>
<%@page import="com.mycompany.listpage.TblboardDao"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String num = request.getParameter("num"); 
String pass = request.getParameter("pass"); 

TblboardDao td = new TblboardDao();
String strSQL = "SELECT passwd FROM tblborad WHERE num = '"+num+"'";
String goodpass = td.getPass(strSQL);

if (pass.equals(goodpass)){
	response.sendRedirect("/Listpage/modify.jsp?num=" + num);
}else{
	response.sendRedirect("/Listpage/modify_pass.jsp?num=" + num);	
}

%>
