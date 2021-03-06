﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>添加客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<!-- 引入jQuery的js库文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {//页面一加载，函数就会执行
		//页面一加载，我就应该异步去查询字典数据
		//加载客户的来源
		$.post("${pageContext.request.contextPath }/baseDict_findByTypeCode.action", {"dictTypeCode":"002"}, function(data) {
			//遍历JSON的数据
			$(data).each(function(i, n) {
				/*
				 * i：这个参数表示循环到第几个了
				 * n：这个参数表示循环出来的具体的JSON对象
				 */
				 $("#cust_source").append("<option value='" + n.dictId + "'>" + n.dictItemName + "</option>");
			});
		}, "json");
	
		//加载客户的级别
		$.post("${pageContext.request.contextPath }/baseDict_findByTypeCode.action", {"dictTypeCode":"006"}, function(data) {
			//遍历JSON的数据
			$(data).each(function(i, n) {
				/*
				 * i：这个参数表示循环到第几个了
				 * n：这个参数表示循环出来的具体的JSON对象
				 */
				 $("#cust_level").append("<option value='" + n.dictId + "'>" + n.dictItemName + "</option>");
			});
		}, "json");
		
		//加载客户所属的行业
		$.post("${pageContext.request.contextPath }/baseDict_findByTypeCode.action", {"dictTypeCode":"001"}, function(data) {
			//遍历JSON的数据
			$(data).each(function(i, n) {
				/*
				 * i：这个参数表示循环到第几个了
				 * n：这个参数表示循环出来的具体的JSON对象
				 */
				 $("#cust_industry").append("<option value='" + n.dictId + "'>" + n.dictItemName + "</option>");
			});
		}, "json");
	});
</script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<s:actionerror/>
<s:fielderror></s:fielderror>
<BODY>
	<FORM id=form1 name=form1
		action="${pageContext.request.contextPath }/customer_save.action"
		method=post enctype="multipart/form-data">
		

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
								<TD class=manageHead>当前位置：客户管理 &gt; 添加客户</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						
						<TABLE cellSpacing=0 cellPadding=5  border=0>
						  
						    
							<TR>
								<td>客户名称：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custName">
								</td>
								<td>客户级别 ：</td>
								<td>
									<select id="cust_level" name="baseDictLevel.dictId">
										<option value="">---请选择---</option>
									</select>
								</td>
							</TR>
							
							<TR>
								
								<td>信息来源 ：</td>
								<td>
									<select id="cust_source" name="baseDictSource.dictId">
										<option value="">---请选择---</option>
									</select>
								</td>
								<td>所属行业 ：</td>
								<td>
									<select id="cust_industry" name="baseDictIndustry.dictId">
										<option value="">---请选择---</option>
									</select>
								</td>
							</TR>
							
							<TR>
								<td>固定电话 ：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custPhone">
								</td>
								<td>移动电话 ：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custMobile">
								</td>
							</TR>
							<tr>
								<td>客户资质 ：</td>
								<td>
									<input type="file" name="upload" style="WIDTH: 180px"/>
								</td>
							</tr>
							
							<tr>
								<td rowspan=2>
								<INPUT class=button id=sButton2 type=submit
														value=" 保存 " name=sButton2>
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
	</FORM>
</BODY>
</HTML>
