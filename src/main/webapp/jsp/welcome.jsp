<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.dao.CommDAO"%>
<%@page import="java.util.PageManager"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>医院网上预约系统</title>
<STYLE>BODY {
	BACKGROUND-IMAGE: url(image/bgp.gif)
}
</STYLE>
 
  </head>
  
  <body  class=frame_class leftMargin=0 topMargin=0>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>

</center>
  <center>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720  >
  <TBODY>

  <TR>
    <TD >
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%"  >
        
        <TBODY>
        <th colspan="2" align="left" height="3"><font size="2">站内新闻</font></th>
        <TR>
          <TD vAlign=top >
            <TABLE border=1 cellSpacing=1 cellPadding=1 width="100%" bgcolor="#ffffff"><TBODY>
              <%CommDAO java.com.hosp.dao = new CommDAO();
            String url = "/Demo/newscenter.jsp?1=1";
              String sql = "select top 5 * from notice order by savetime desc ";
             
              ArrayList<HashMap> list = (ArrayList<HashMap>)com.hosp.dao.select(sql);
              for(HashMap map:list){%>
              <TR bordercolor="#ffffff">
                <TD align=right >
                <a href="newsx.jsp?id=<%=map.get(" yspb.jsp?ysid=<%=map1.get(" width="80" height="80"/><br/><%=map1.get("tname") %></a>
                </TD>
                <%} %>
                </TR>
                
                
                
              </TBODY></TABLE></TD></TR>
              </TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </center>

    <script type="text/javascript">
  	
  	<%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
  </script>

  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
