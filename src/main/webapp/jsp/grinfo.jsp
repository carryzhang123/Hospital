<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.dao.CommDAO"%>
<%@page import="java.util.Info"%>
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
 <%HashMap user = (HashMap)session.getAttribute("user"); 
 CommDAO java.com.hosp.dao = new CommDAO();
 HashMap map = com.hosp.dao.select("select * from br where id="+user.get("id")).get(0);
%>
  <FORM onsubmit="return ck()" method=post name=f1 action="/Demo/tms?ac=grinfo">
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center  height="375">
  <TBODY>
  <TR>
    <TD class=lfont align=center><B>个人信息</B></TD></TR>
  <TR>
    <TD  valign=top>
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="82%" align=center >
        
        <TBODY>
        <TR>
          <TD  vAlign=top align=middle>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="89%" 
              ><TBODY>
              <TR>
                <TD height=40 width="41%" align=right>
                  <P>登陆名： </P></TD>
                <TD height=40 width="59%"><INPUT id=uname class=inputtxt 
                  name=uname readonly==true> <IMG src="./jsp/files/exp_book_login_files/user_id.gif"
                  width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>旧密码： </TD>
                <TD height=40 width="59%"><INPUT id=oldupass class=inputtxt 
                  type=password name=oldupass> <IMG
                        src="./jsp/files/exp_book_login_files/psw.gif" width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>新密码： </TD>
                <TD height=40 width="59%"><INPUT id=upass1 class=inputtxt 
                  type=password name=upass1> <IMG
                        src="./jsp/files/exp_book_login_files/psw.gif" width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>姓名： </TD>
                <TD height=40 width="59%"><INPUT id=tname class=inputtxt 
                  type=text name=tname></TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>性别： </TD>
                <TD height=40 width="59%" align=left>
                	<select id="sex" name="sex">
        			<option value="男">男</option>
        			<option value="女">女</option>
        		</select>
                </TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>年龄： </TD>
                <TD height=40 width="59%"><INPUT id=age class=inputtxt 
                  type=text name=age></TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>电话： </TD>
                <TD height=40 width="59%"><INPUT id=tel class=inputtxt 
                  type=text name=tel></TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>身份证： </TD>
                <TD height=40 width="59%"><INPUT id=idcard class=inputtxt 
                  type=text name=idcard></TD>
              </TR>
              <TR align=middle>
                <TD height=28 colSpan=2><INPUT class=Btn value="提交" type=submit name=Submit> 
                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </FORM>
  <script type="text/javascript">
  	function ck(){
  		if (f1.uname.value==""){
			alert("请输入用户名！");
			return false;
		}
		if (f1.oldupass.value==""){
			alert("请输入旧密码！");
			return false;
		}if (f1.upass1.value==""){
			alert("请输入新密码！");
			return false;
		}if (f1.tname.value==""){
			alert("请输入姓名！");
			return false;
		}if (f1.age.value==""){
			alert("请输入年龄！");
			return false;
		}if (f1.tel.value==""){
			alert("请输入电话！");
			return false;
		}if (f1.idcard.value==""){
			alert("请输入身份证！");
			return false;
		}
  	}
  	<%
String suc = (String)request.getAttribute("suc");
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("旧密码错误");
 <%}
if(suc!=null)
{
 %>
 alert("操作成功");
location.replace("/Demo/grinfo.jsp");
 <%}%>
  </script>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
<%=Info.tform(map)%>