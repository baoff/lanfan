<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>拜访记录列表</TITLE> 
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
 	
	 $('#visitTime_end').datepicker({
		 numberOfMonths:1,//显示几个月
			showButtonPanel:true,//是否显示按钮面板
			dateFormat: 'yy-mm-dd',//日期格式
			clearText:"清除",//清除日期的按钮名称
			closeText:"关闭",//关闭选择框的按钮名称
			yearSuffix: '年', //年的后缀
			showMonthAfterYear:true,//是否把月放在年的后面
 	}); 
	
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
		document.saleVisitForm.submit();
		
	}
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="saleVisitForm" name="saleVisitForm"
		action="${pageContext.request.contextPath }/saleVisit_findAll.action"
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
								<TD class=manageHead>当前位置：客户拜访管理 &gt; 客户拜访列表</TD>
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
													
													<TD>所属客户：</TD>
													<TD>
														<select id="custName" name="customer.custId">
															<option value="">---请选择---</option>
														</select>
													</TD>
													<TD>拜访时间：从</TD>
													<TD>
														<s:textfield cssClass="textbox" id="visitTime" cssStyle="WIDTH: 180px" maxLength="50" name="visitTime" readonly="true"></s:textfield>
													</TD>
													<TD>
													<TD>到</TD>
													<TD>
														<s:textfield cssClass="textbox" id="visitTime_end" cssStyle="WIDTH: 180px" maxLength="50" name="visitTime_end" readonly="true"></s:textfield>
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
													<TD>业务员名称</TD>
													<TD>客户名称</TD>
													<TD>拜访时间</TD>
													<TD>拜访地点</TD>
													<TD>拜访详情</TD>
													<TD>下次拜访时间</TD>
													<TD>操作</TD>
												</TR>
												<s:iterator value="list">
												<TR
													style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD>
														<s:property value="user.userName"/>
													</TD>
													<TD>
														<s:property value="customer.custName"/>
													</TD>
													<TD>
														<s:date name="visitTime" format="yyyy-MM-dd"/>
													</TD>
													<TD>
														<s:property value="visitAddr"/>
													</TD>
													<TD>
														<s:property value="visitDetail"/>
													</TD>
													<TD>
														<s:date name="visitNextTime" format="yyyy-MM-dd"/>
													</TD>
													<TD>
													<a href="${pageContext.request.contextPath }/saleVisit_edit.action?visitId=<s:property value="visitId"/>">修改</a>
													&nbsp;&nbsp;
													<a href="${pageContext.request.contextPath }/saleVisit_delete.action?visitId=<s:property value="visitId"/>">删除</a>
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
