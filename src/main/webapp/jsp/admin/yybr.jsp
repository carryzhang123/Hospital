<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.dao.CommDAO"%>
<%@page import="java.util.Info"%>
<%@page import="java.util.PageManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-java.control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->
</style>
  </head>
  <%CommDAO java.com.hosp.dao = new CommDAO();
  HashMap admin = (HashMap)session.getAttribute("admin"); 
	 String sql = "select * from yy where 1=1 and ysid='"+admin.get("id")+"' and status='待诊' ";
	 String url = "/Demo/admin/yybr.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String stime = request.getParameter("stime")==null?"":request.getParameter("stime");
	 String etime = request.getParameter("etime")==null?"":request.getParameter("etime");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!stime.equals(""))
	 {
	 sql+=" and (rq >= '"+stime+"')";
	 url+="&stime="+stime;
	 }if(!etime.equals(""))
	 {
	 sql+=" and (rq <= '"+etime+"')";
	 url+="&etime="+etime;
	 }
	 sql+=" order by id desc";
%>
  <body>
  <form action="admin/yybr.jsp?f=f" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">

        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <th colspan="9"><span class="STYLE1">
    预约起止日期：<INPUT id=stime class=inputtxt 
                  type=text name=stime  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly==true>
                  -
                  <INPUT id=etime class=inputtxt 
                  type=text name=etime  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly==true>
    <script type="text/javascript" src="/Demo/js/calendar/WdatePicker.js"></script>
    &nbsp;&nbsp;&nbsp;<input type="submit" value="查询" /></span>
    </th>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">病人姓名</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">性别</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">年龄</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">电话</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">预约日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">预约科室</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">预约医生</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">状态</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
      <%String did = request.getParameter("did");
      String wcid = request.getParameter("wcid");
   if(did!=null)
   {
com.hosp.dao.commOper("delete from yy where id="+did);
   }if(wcid!=null){
   com.hosp.dao.commOper("update yy set status='完成' where id="+wcid);
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
   		HashMap brm = com.hosp.dao.select("select * from br where id="+mstu.get("uid")).get(0);
   		HashMap ysm = com.hosp.dao.select("select * from sysuser where id="+mstu.get("ysid")).get(0);
  		HashMap ksm = com.hosp.dao.select("select * from ks where id="+ysm.get("ks")).get(0);
	    %>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=brm.get("tname") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=brm.get("sex") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=brm.get("age") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=brm.get("tel") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("rq") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=ksm.get("name") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=ysm.get("tname") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("status") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><a href="admin/yybr.jsp?wcid=<%=mstu.get("id") %>">完成</a></span></div></td>
      </tr>
      <%} %>
      <tr>
      	<td height="22" bgcolor="#FFFFFF" colspan="9"><div align="center"><span class="STYLE3">${page.info }</span></div>
      	</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="29" nowrap="nowrap">
        
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
  </body>
</html>