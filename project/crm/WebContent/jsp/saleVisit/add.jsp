<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>添加客户拜访记录</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ui.datepicker-zh-CN.js"></script>
<LINK href="${pageContext.request.contextPath }/css/jquery-ui-1.9.2.custom.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ui.datepicker.js"></script>

<script type="text/javascript">
$(function() {//页面一加载，函数就会执行
	 $('#visitTime').datepicker({
			 numberOfMonths:1,//显示几个月
				showButtonPanel:true,//是否显示按钮面板
				dateFormat: 'yy-mm-dd',//日期格式
				clearText:"清除",//清除日期的按钮名称
				closeText:"关闭",//关闭选择框的按钮名称
				yearSuffix: '年', //年的后缀
				showMonthAfterYear:true,//是否把月放在年的后面
	 });   
	 $('#visitNextTime').datepicker({
		 numberOfMonths:1,//显示几个月
			showButtonPanel:true,//是否显示按钮面板
			dateFormat: 'yy-mm-dd',//日期格式
			clearText:"清除",//清除日期的按钮名称
			closeText:"关闭",//关闭选择框的按钮名称
			yearSuffix: '年', //年的后缀
			showMonthAfterYear:true,//是否把月放在年的后面
});   
	//页面一加载，我就应该异步去查询字典数据
	//加载客户
	$.post("${pageContext.request.contextPath }/customer_all.action", {}, function(data) {
		//遍历JSON的数据
		$(data).each(function(i, n) {
			/*
			 * i：这个参数表示循环到第几个了
			 * n：这个参数表示循环出来的具体的JSON对象
			 */
			 $("#customer").append("<option value='" + n.custId + "'>" + n.custName + "</option>");
		});
	}, "json");
	//加载用户
	$.post("${pageContext.request.contextPath }/user_all.action", {}, function(data) {
		//遍历JSON的数据
		$(data).each(function(i, n) {
			/*
			 * i：这个参数表示循环到第几个了
			 * n：这个参数表示循环出来的具体的JSON对象
			 */
			 $("#user").append("<option value='" + n.userId + "'>" + n.userName + "</option>");
		});
	}, "json");
});
</script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<s:actionerror/>
<BODY>
	<s:form id="form1" name="form1" action="saleVisit_save.action" method="post" theme="simple">
	
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
						 height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=${pageContext.request.contextPath }/images/new_022.jpg><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：客户拜访管理 &gt; 添加客户拜访记录</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=5  border=0>
							<tr>
								<td>拜访的客户：</td>
								<td colspan="3">
									<select name="customer.custId" id="customer">
										<option value="">---请选择---</option>
									</select>
								</td>
								<td>业务员名称：</td>
								<td>
									<select name="user.userId" id="user">
										<option value="">---请选择---</option>
									</select>
								</td>
							</tr>
							<TR>
								<td>拜访时间 ：</td>
								<td>
									<s:textfield cssClass="textbox" id="visitTime" cssStyle="WIDTH: 180px" maxLength="50" name="visitTime" readonly="true"></s:textfield>
								</td>
								<td>拜访地点 ：</td>
								<td>
									<s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px" maxLength="50" name="visitAddr"></s:textfield>
								</td>
							</TR>
							<TR>
								<td>拜访详情 ：</td>
								<td>
									<s:textfield cssClass="textbox" id="sChannel2" cssStyle="WIDTH: 180px" maxLength="50" name="visitDetail"></s:textfield>
								</td>
								<td>下次拜访时间 ：</td>
								<td>
									<s:textfield cssClass="textbox" id="visitNextTime" cssStyle="WIDTH: 180px" maxLength="50" name="visitNextTime" readonly="true"></s:textfield>
								</td>
							</TR>
							<tr>
								<td rowspan=2>
								<INPUT class=button id=sButton2 type=submit
														value="保存 " name=sButton2>
								</td>
							</tr>
						</TABLE>
						
						
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg">
					<IMG src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</BODY>
</HTML>
