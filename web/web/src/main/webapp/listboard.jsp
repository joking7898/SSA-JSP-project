<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> �Խ��� </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
     table{
        font-family: arial,sans-serif;
        border-collapse: collapse;
        width:100%;
    }
    td,th{
        boader:1px solid #cccccc;
        text-align: left;
        padding:8px;
    }
    tr:nth-child(even){
        background-color: #dddddd;
    }

    a:link		{font-family:"";color:black;text-decoration:none;}
    a:visited	{font-family:"";color:black;text-decoration:none;}
    a:hover		{font-family:"";color:black;text-decoration:underline;}

</style>

</HEAD>
<BODY>

<%
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";
}

int listSize = 5;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i = 0;
int num[] = {0};

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

String url = "jdbc:odbc:dbMember";
Connection conn = DriverManager.getConnection(url,"Member","apple");

Statement stmt = conn.createStatement();

String strSQL = "SELECT * FROM tblboard";
ResultSet rs = stmt.executeQuery(strSQL);

while(rs.next()){
	num[i] = rs.getInt("num");
}
lastRow = num[0];
%>

<center><font size='3'><b> �Խ��� </b></font></TD>
                                    
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      

	<TR bgcolor='cccccc'>      
		<TD><font size=2><center><b>��ȣ</b></center></font></TD>      
		<TD><font size=2><center><b>�� ����</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=2><center><b>��ȸ</b></center></font></TD>      
	</TR>   
	
<%
if(lastRow > 0) {
	sql= "SELECT * FROM tblboard WHERE num BETWEEN " + startRow + " and " + endRow+"order by num desc";
	List list = td.makeList(sql,StartRow,endRow);
/*
	for (i = 0; i < listSize; i++){		
		if(rs.next()){

		int listnum = rs.getInt("num");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String title = rs.getString("title");
		String writedate = rs.getString("writedate");
		int readcount = rs.getInt("readcount");
*/
    Tblboard td = new TblboardDao();
    String sql = "select * from tblboard where num="+numStr+"";
    List list = td.makeList(sql);
    Iterator it= list.iterator();
    TblboardBean tb= null;
    int readcount;
    String name,email,title,wrtedate;
    whlie(it.hasNext()){
    
    }
%>

	<TR bgcolor='ededed'>     
		<TD align=center><font size=2 color='black'>
                                    <%=listnum %></font></TD>     
		<TD align=left>
			<a href="write_output.jsp?num=<%=listnum %>">
			<font size=2 color="black"><%=title %></font></a>
		</TD>
		<TD align=center>    
			<a href="<%=email %>">
			<font size=2 color="black"><%=name %></font></a>     
		</TD>     
		<TD align=center><font size=2><%=writedate %></font>
		</TD>     
		<TD align=center><font size=2><%=readcount %></font>     
	</TR>  
	   	
<%     
		}
	}	
%>

</TABLE>     
                
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    

<TABLE border=0 width=600>
	<TR>
		<TD align=left>		
		</TD>

		<TD align='right'>		
		<a href='write.jsp'>[���]</a>				
		</TD>
	</TR>
</TABLE>
	                   
<%
rs.close();
stmt.close();
conn.close();
}

if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;

	if(currentPage > 1) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage-1%>">[����]</a>	
<%	
	}
	while(setPage <= lastPage) {
            if(currentPage==setPage){
%>
            <a href="listboard.jsp?pageNum=<%=setPage%>"><b>[<%=setPage%>]</b></a>
<%}  else  %>
            <a href="listboard.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>
<%
		setPage = setPage + 1;
	}
	if(lastPage > currentPage) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage+1%>">[����]</a>
<%
	}
}
%>  
                  
</BODY>                     
</HTML>
