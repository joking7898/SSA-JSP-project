<%@page import="com.mycompany.listpage.TblboardBean"%>
<%@page import="com.mycompany.listpage.TblboardDao"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*,java.util.Collections.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
    <HEAD>
        <TITLE> 게시판 </TITLE>

        <META http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <style type='text/css'>
             table{
                font-family: arial,sans-serif;
                border-collapse: collapse;
                width:100%;
            }
            td.right{
                text-align:right;
            }
            td,th{
                boader:1px solid #cccccc;
                text-align: left;
                padding:5px;
            }
            th{
                background:#bbaabb;
                font-size:10px;
                font-weight: bold;
                text-align: center;
            }
            tr:nth-child(even){
                background-color: #dddddd;
            }

            a:link		{font-family:"";color:black;text-decoration:none;}
            a:visited	{font-family:"";color:violet;text-decoration:none;}
            a:hover		{font-family:"";color:red;text-decoration:underline;}

        </style>
    </HEAD>
    <BODY>

        <%
            String pageNum = request.getParameter("pageNum");
            if(pageNum==null){
                pageNum="1";
            }
            
            int listSize=5;
            int currentPage=Integer.parseInt(pageNum);
            int startRow=(currentPage - 1 )*listSize+1;
            int endRow=currentPage*listSize;
            int lastRow = 0;
            int i =0;
            int num[] = {0};
            TblboardDao td = new TblboardDao();
            String sql ="select max(num) from tblborad";
            num[0]=td.getMaxNum(sql);
            lastRow = num[0];
        %>

        <TABLE >
                <TR>
                        <TD><hr >
                            <h3 style="text-align:center"> 게시판 </h3> 
                            <hr size='1' noshade>
                        </TD>
                </TR>
        </TABLE>              
        <TABLE >
                <TR>      
                        <Th>번호</th>      
                        <Th>글 제목</th>      
                        <Th>작성자</Th>      
                        <Th>작성일</Th>      
                        <th>조회</Th>      
                </TR>   

        <%
            if(lastRow > 0) {
            sql= "SELECT * FROM tblborad WHERE num BETWEEN ? and ? order by num asc";
            List list = td.makeList(sql,startRow,endRow);
            
            int listnum,readcount;
            String name,email,title,writedate;
            
            Iterator it = list.iterator();
            TblboardBean tb = null;
            while(it.hasNext()){
                tb=(TblboardBean)it.next();
                listnum = tb.getNum();
                title=tb.getTitle();
                email=tb.getEmail();
                name = tb.getName();
                writedate=tb.getWritedate();
                readcount =tb.getReadcount();
        %>
                <TR>     
                        <TD class="right"> <%= listnum %></font></TD>     
                        <TD ><a href="write_output.jsp?num=<%= listnum %>"><%= title %></a></TD>
                        <TD><a href="<%=email %>"><%=name %></a></TD>     
                        <TD><%=writedate %></TD>     
                        <TD class="right"><%=readcount %></TR>  

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
                        <TD></TD>
                        <TD ><a href='write.jsp'>[등록]</a></TD>
                </TR>
        </TABLE>
<%
        if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;

	if(currentPage > 1) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage-1%>">[이전]</a>	
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
		<a href="listboard.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
	}
}
%>  
    </BODY>                     
</HTML>
