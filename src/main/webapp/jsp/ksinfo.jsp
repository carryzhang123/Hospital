<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.dao.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>医院网上预约系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-java.control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=stylesheet type=text/css href="files/exp_book_login_files/css.css">

  </head>
  
  <body>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
 <%CommDAO java.com.hosp.dao = new CommDAO();
        String id = request.getParameter("id");
        HashMap map = com.hosp.dao.select("select * from ks where id='"+id+"'").get(0);
        %>
  <FORM onsubmit="return ck()" method=post name=f1 action="/Demo/tms?ac=ghadd">
    <input type="hidden" id="id" name="id" value="<%=map.get("id") %>"/>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center >
  <TBODY>
  <TR>
    <TD height=25 align=middle>&nbsp; </TD></TR>
  <TR>
    <TD class=lfont height=33 align=middle><B>科室信息</B></TD></TR>
  <TR>
    <TD  align=middle>
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%" >
       
         
        <TBODY>
        <TR>
          <TD  vAlign=center align=middle>
            <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" height=130>
            <TBODY>
              <TR>
                <TD height=40 width="15%" align=right>
                  <P>科室简介： </P></TD>
                <TD height=40 align="left"><%=map.get("remark") %></TD></TR>
              <TR>
              
                <TD height=40  align=right>科室医生： </TD>
                <TD height=40 >
                	<table width="100%" border="0">
                		<tr>
                	<%ArrayList<HashMap> yslist = (ArrayList<HashMap>)com.hosp.dao.select("select * from sysuser where ks='"+id+"'");
                	if(yslist.size()>0){
                		int i=0;
                		for(HashMap m:yslist){
                			i++;
                			
                	%>
                		<td align="left">
                		<a href="yspb.jsp?ysid=<%=m.get(" text/javascript">
  	
  	<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("已存在的用户名");
 <%}
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/Demo/myyy.jsp");
 <%}%>
  </script>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
