<%@page import="com.mycompany.listpage.TblboardDao"%>
<%@page import="com.mycompany.listpage.TblboardBean"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
int num  = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String passwd = request.getParameter("pass");
String email = request.getParameter("email");
String title = request.getParameter("title");
String contents = request.getParameter("contents");


PreparedStatement pstmt = null;

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));
String writedate = indate;

TblboardDao td = new TblboardDao();

String sql ="UPDATE tblborad SET name= ?, passwd= ?, email= ?, title= ?, contents= ?, writedate= ? WHERE num= ?";
int n = td.updateATuple(sql, name, passwd, email, title, contents, writedate, num);


response.sendRedirect("/Listpage/listboard.jsp");
%>