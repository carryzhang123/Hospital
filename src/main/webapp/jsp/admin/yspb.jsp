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
	 String sql = "select * from yspb where 1=1  ";
	 String url = "/Demo/admin/yspb.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
	 sql+=" and (ysid ='"+key+"' )";
	 url+="&key="+key;
	 }if(!key1.equals(""))
	 {
		 sql+=" and (rq >='"+key1+"' )";
		 url+="&key1="+key1;
		 }if(!key2.equals(""))
		 {
			 sql+=" and (rq <'"+key2+"' )";
			 url+="&key2="+key2;
			 }
	 sql+=" order by rq desc";
%>
  <body>
  <form action="admin/yspb.jsp?f=f" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">
          <table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="admin/images/001.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="admin/yspbadd.jsp">新增</a></div></td>
                  </tr>
              </table></td>
             
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <th colspan="5"><span class="STYLE1">
    按医生：<select id="key" name="key">
    	<option value="">全部</option>
    	<%ArrayList<HashMap> yslist = (ArrayList<HashMap>)com.hosp.dao.select("select * from sysuser where utype='医生' and delstatus=0");
    	for(HashMap ysm:yslist){
    		HashMap ksm = com.hosp.dao.select("select * from ks where id="+ysm.get("ks")).get(0);
    	%>
    	<option value="<%=ysm.get("id") %>" <%if(key.equals(ysm.get("id"))){out.print("selected==selected");} %>><%=ksm.get("name") %>-<%=ysm.get("tname") %></option>
    	<%} %>
    </select>&nbsp;&nbsp;&nbsp;
    起止时间：<input type="text" id="key1" name="key1" value="<%=key1 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>-
                 <input type="text" id="key2" name="key2" value="<%=key2 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
   <input type="submit" value="查询" /></span>
   <script type="text/javascript" src="/Demo/js/calendar/WdatePicker.js"></script>
    </th>
      <tr>
      	<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">科室</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">医生</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">接诊数</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
      <%String did = request.getParameter("did");
   if(did!=null)
   {
com.hosp.dao.commOper("delete from yspb where id="+did);
   }
   PageManager pageManager = PageManager.getPage(url,10, request);
   pageManager.doList(sql);
   PageManager bean= (PageManager)request.getAttribute("page");
   ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
   	for(HashMap mstu:nlist){
   		HashMap ym=com.hosp.dao.select("select * from sysuser where id="+mstu.get("ysid")+"").get(0);
   		HashMap km=com.hosp.dao.select("select * from ks where id="+ym.get("ks")+"").get(0);
	    %>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=km.get("name") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=ym.get("tname") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("rq") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><%=mstu.get("rs") %></span></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3"><a href="admin/yspbedit.jsp?id=<%=mstu.get("id") %>">修改</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="admin/yspb.jsp?did=<%=mstu.get("id") %>">删除</a></span></div></td>
      </tr>
      <%} %>
      <tr>
      	<td height="22" bgcolor="#FFFFFF" colspan="5"><div align="center"><span class="STYLE3">${page.info }</span></div>
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
