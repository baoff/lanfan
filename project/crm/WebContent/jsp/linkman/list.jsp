﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>联系人列表</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(function() {//页面一加载，函数就会执行
	//页面一加载，我就应该异步去查询字典数据
	//加载客户的来源
	$.post("${pageContext.request.contextPath }/customer_all.action", {}, function(data) {
		//遍历JSON的数据
		$(data).each(function(i, n) {
			/*
			 * i：这个参数表示循环到第几个了
			 * n：这个参数表示循环出来的具体的JSON对象
			 */
			 $("#custName").append("<option value='" + n.custId + "'>" + n.custName + "</option>");
		});
		$("#custName option[value = '${model.customer.custId}']").prop("selected","selected");
	}, "json");
});
</script>
<SCRIPT language=javascript>
	function to_page(page){
		if(page){
			$("#page").val(page);
		}
		document.customerForm.submit();
		
	}
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/linkMan_findAll.action"
		method=post>
		
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
					<TD width=15 background="${pageContext.request.contextPath }/images/new_022.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：联系人管理 &gt; 联系人列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<TD>联系人名称：</TD>
													<TD>
														<INPUT class=textbox id=sChannel2
														style="WIDTH: 80px" maxLength=50 name="lkmName" value="<s:property value="lkmName"/>">
													</TD>
													<TD>所属客户：</TD>
													<TD>
														<select id="custName" name="customer.custId">
															<option value="">---请选择---</option>
														</select>
													</TD>
													<TD>性别：</TD>
													<TD>
														
														<select id="lkmGender" name="lkmGender">
															<option value="">---请选择---</option>
															<option value="1" <s:if test='lkmGender == "1"'>selected="selected"</s:if>>男</option>
															<option value="2" <s:if test='lkmGender == "2"'>selected="selected"</s:if>>女</option>
															
														</select>
														
													</TD>
													<TD>
													<INPUT class=button id=sButton2 type=submit
														value=" 筛选 " name=sButton2></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
							    
								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>联系人名称</TD>
													<TD>性别</TD>
													<TD>办公电话</TD>
													<TD>手机</TD>
													<TD>邮箱</TD>
													<TD>QQ</TD>
													<TD>职位</TD>
													<TD>备注</TD>
													<TD>所属客户</TD>
													<TD>操作</TD>
												</TR>
												<s:iterator value="list">
												<TR
													style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD>
														<s:property value="lkmName"/>
													</TD>
													<TD>
														<s:if test='lkmGender == "1"'>男</s:if>
														<s:elseif test='lkmGender == "2"'>女</s:elseif>
													</TD>
													<TD>
														<s:property value="lkmPhone"/>
													</TD>
													<TD>
														<s:property value="lkmMobile"/>
													</TD>
													<TD>
														<s:property value="lkmEmail"/>
													</TD>
													<TD>
														<s:property value="lkmQQ"/>
													</TD>
													<TD>
														<s:property value="lkmPosition"/>
													</TD>
													<TD>
														<s:property value="lkmMemo"/>
													</TD>
													<TD>
														<s:property value="customer.custName"/>
													</TD>
													<TD>
													<a href="${pageContext.request.contextPath }/linkMan_edit.action?lkmId=<s:property value="lkmId"/>">修改</a>
													&nbsp;&nbsp;
													<a href="${pageContext.request.contextPath }/linkMan_delete.action?lkmId=<s:property value="lkmId"/>">删除</a>
													</TD>
												</TR>
												</s:iterator>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								
								<TR>
									<TD><SPAN id=pagelink>
											<DIV
												style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B><s:property value="totalCount" /></B>]条记录,[<B><s:property value="totalPage" /></B>]页
												,每页显示                                                                     <!-- to_page()方法如果不传参数，默认就是第一页的数据 -->
												<select name="pageSize" onchange="javascript:to_page()">
													<option value="3" <s:if test="pageSize == 3">selected</s:if>>3</option>
													<option value="5" <s:if test="pageSize == 5">selected</s:if>>5</option>
													<option value="10" <s:if test="pageSize == 10">selected</s:if>>10</option>
												</select>
												条
												<s:if test="currentPage != 1">
													[<A href="javascript:to_page(1)">首页</A>]
													[<A href="javascript:to_page(<s:property value="currentPage-1" />)">前一页</A>]
												</s:if>&nbsp;&nbsp;
												<B>
												
												<s:iterator var="i" begin="1" end="totalPage">
													<s:if test="#i == currentPage">
														<s:property value="#i" />
													</s:if>
													<s:else>
														<a href="javascript:to_page(<s:property value="#i" />)"><s:property value="#i" /></a>
													</s:else>
												</s:iterator>
													
												</B>&nbsp;&nbsp;
												<s:if test="currentPage != totalPage">
													[<A href="javascript:to_page(<s:property value="currentPage+1" />)">后一页</A>] 
													[<A href="javascript:to_page(<s:property value="totalPage" />)">尾页</A>] 
												</s:if>
												到
												<input type="text" size="3" id="page" name="currentPage" />
												页
												<input type="button" value="Go" onclick="to_page()"/>
											</DIV>
									</SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
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
