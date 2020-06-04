<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mycompany.listpage.TblboardBean"%>
<%@page import="com.mycompany.listpage.TblboardDao"%>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = " java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String name   = request.getParameter("name");  
String pass   = request.getParameter("pass"); 
String email  = request.getParameter("email");
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");

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
int num=td.getMaxNum("SELECT Max(num) FROM dbnwe.tblborad");

TblboardBean tb = new TblboardBean();
tb.setNum(num+1);
tb.setName(name);
tb.setPasswd(pass);
tb.setEmail(email);
tb.setTitle(title);
tb.setWritedate(writedate);
tb.setReadcount(0);

String strSQL ="INSERT INTO dbnwe.tblborad(num, name, passwd, email, title, contents, writedate, readcount)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
int n = td.insertATuple(strSQL, tb);
if(n==1)
    out.println("»ðÀÔ ¼º°ø.");
else
    out.println("»ðÀÔ½ÇÆÐ.");

response.sendRedirect("/Listpage/listboard.jsp"); 
%>
