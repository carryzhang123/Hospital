<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hosp.dao.CommDAO"%>
<%@page import="com.hosp.util.Info"%>
<%@page import="com.hosp.util.PageManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

      <title>预约挂号系统管理平台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-java.control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language=javascript src="/Demo/fckeditor/fckeditor.js"></script>
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
 <%CommDAO dao = new CommDAO();
  String id =  request.getParameter("id");
  HashMap map = dao.select("select * from h_d_orders where id="+id).get(0);
   %>
  <body>
  <form action="./common/pbEdit.do" method="get" name="f1" onsubmit="return ck()">
  <input type="hidden" id="id" name="id"  value="<%=id %>"/>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
       <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">接诊人数</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3"><input type="text" id="rs" name="rs"  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /></span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF" colspan="2">
        	<div><span class="STYLE3">
        		<input type="submit" value="提交" />
        		<input type="reset" value="重置" />
        	</span></div>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<script type="text/javascript">
function ck(){
	if(f1.rs.value==""){
		alert("请输入人数");
		return false;
	}
}
<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("已存在的排班记录");
 <%}
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/Demo/admin/doctor_plans.jsp");
 <%}%>
</script>
  </body>
</html>
<%--<%=Info.tform(map)%>--%>