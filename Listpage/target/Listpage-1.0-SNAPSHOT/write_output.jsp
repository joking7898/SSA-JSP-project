<%@page import="com.mycompany.listpage.TblboardBean"%>
<%@page import="com.mycompany.listpage.TblboardDao"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> �Խ��� </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

</HEAD>

<BODY>

<%
    String numStr = request.getParameter("num");
    TblboardDao td = new TblboardDao();
    
    String sql="SELECT * FROM dbnwe.tblborad WHERE num='"+numStr+"'";
    List list = td.makeList(sql); 
    Iterator it = list.iterator();
    TblboardBean tb = null;
    int readcount;
    String name, passwd ,email,title,contents,writedate; 
    while(it.hasNext()){
        tb=(TblboardBean)it.next(); 
        //num=tb.getNum();
        name=tb.getName();
        //passwd =tb.getPasswd();
        //email=tb.getEmail();
        title=tb.getTitle();
        contents=tb.getContents();
        writedate=tb.getWritedate();
        readcount=tb.getReadcount();
%>

<center><font size='3'><b> �Խ��� </b></font>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='left'>
      		<font size='2'> �ۼ��� : <%=name %></font>
    		</TD>
    		
    		<TD align=right>
      		<font size='2'>�ۼ���: <%=writedate %>, ��ȸ��: <%=readcount %></font>
    		</TD>
    	</TR>
</TABLE>

<TABLE border='0' cellspacing=3 cellpadding=3 width='600'>
	<TR bgcolor='cccccc'>
		<TD align='center'>
    		<font size='3'><b><%=title %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
	<TR bgcolor='ededed'>
		<TD><font size='2' color=''><%=contents %></font>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
    		<TD align='right'>
		<font size='2'><br><font size='2'></font>
    		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
  	<TR>
  		<TD><hr size='1' noshade>
  		</TD>
  	</TR>
</TABLE>

<TABLE border='0' width='600'>
	<TR>
                <TD align='left'>
			<a href="modify_pass.jsp?num=<%=numStr %>">[�����ϱ�]</a>
			<a href="delete_pass.jsp?num=<%=numStr %>">[�����ϱ�]</a>
		</TD>
		<TD align='right'>
			<a href='write.jsp'>[�۾���]</a>
			<a href='listboard.jsp'>[��Ϻ���]</a>
 		</TD>
	</TR>
</TABLE>

<%
    sql = "UPDATE dbnwe.tblborad SET readcount=readcount+1 WHERE num='"+numStr+"'";
    int n =td.updateReadcount(sql);
    }
%>

</TABLE>

</BODY>
</HTML>
