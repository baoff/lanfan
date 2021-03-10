<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>修改客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
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
				 $("#custSource").append("<option value='" + n.dictId + "'>" + n.dictItemName + "</option>");
			});
			$("#custSource option[value = '${model.baseDictSource.dictId}']").prop("selected","selected");
		}, "json");
	
		//加载客户的级别
		$.post("${pageContext.request.contextPath }/baseDict_findByTypeCode.action", {"dictTypeCode":"006"}, function(data) {
			//遍历JSON的数据
			$(data).each(function(i, n) {
				/*
				 * i：这个参数表示循环到第几个了
				 * n：这个参数表示循环出来的具体的JSON对象
				 */
				 $("#custLevel").append("<option value='" + n.dictId + "'>" + n.dictItemName + "</option>");
			});
			$("#custLevel option[value = '${model.baseDictLevel.dictId}']").prop("selected","selected");
		}, "json");
		
		//加载客户所属的行业
		$.post("${pageContext.request.contextPath }/baseDict_findByTypeCode.action", {"dictTypeCode":"001"}, function(data) {
			//遍历JSON的数据
			$(data).each(function(i, n) {
				/*
				 * i：这个参数表示循环到第几个了
				 * n：这个参数表示循环出来的具体的JSON对象
				 */
				 $("#custIndustry").append("<option value='" + n.dictId + "'>" + n.dictItemName + "</option>");
			});
			$("#custIndustry option[value = '${model.baseDictIndustry.dictId}']").prop("selected","selected");
		}, "json");
	});
</script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<s:actionerror/>
<s:fielderror></s:fielderror>
<BODY>
	<s:form id="form1" name="form1" action="customer_update" method="post" enctype="multipart/form-data" theme="simple">
		<s:hidden name="custId" value="%{model.custId}"></s:hidden>
		<s:hidden name="custImage" value="%{model.custImage}"></s:hidden>

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background=${pageContext.request.contextPath }/images/new_020.jpg
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
								<TD class=manageHead>当前位置：客户管理 &gt; 修改客户</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE cellSpacing=0 cellPadding=5  border=0>
							<TR>
								<td>客户名称：</td>
								<td>
								<%-- <INPUT class=textbox id=sChannel2
											style="WIDTH: 180px" maxLength=50 name="custName" value="${customer.custName }"> --%>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxLength="50" name="custName" value="%{model.custName}"/>
								</td>
								<td>客户级别 ：</td>
								<td>
								<%-- <INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custLevel" value="${customer.custLevel }"> --%>
									<select id="custLevel" name="baseDictLevel.dictId">
										<option value="">---请选择---</option>
									</select>
								</td>
							</TR>
							
							<TR>
								<td>信息来源：</td>
								<td>
								<%-- <INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custSource" value="${customer.custSource }"> --%>
									<select id="custSource" name="baseDictSource.dictId">
										<option value="">---请选择---</option>
									</select>
								</td>
								<%-- <td>联系人：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custLinkman" value="${customer.custLinkman }">
								</td> --%>
								<td>所属行业：</td>
								<td>
								<%-- <INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custLinkman" value="${customer.custLinkman }"> --%>
									<select id="custIndustry" name="baseDictIndustry.dictId">
										<option value="">---请选择---</option>
									</select>
								</td>
							</TR>
							<TR>
								<td>固定电话 ：</td>
								<td>
								<%-- <INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custPhone" value="${customer.custPhone }"> --%>
									<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxLength="50" name="custPhone" value="%{model.custPhone}"/>
								</td>
								<td>移动电话 ：</td>
								<td>
								<%-- <INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custMobile" value="${customer.custMobile }"> --%>
									<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxLength="50" name="custMobile" value="%{model.custMobile}"/>
								</td>
							</TR>
							
							<%-- <TR>
								<td>联系地址 ：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custAddress" value="${customerDetail.custAddress }">
								</td>
								<td>邮政编码 ：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custZip" value="${customerDetail.custZip }">
								</td>
							</TR>
							<TR>
								<td>客户传真 ：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custFax" value="${customerDetail.custFax }">
								</td>
								<td>客户网址 ：</td>
								<td>
								<INPUT class=textbox id=sChannel2
														style="WIDTH: 180px" maxLength=50 name="custWebsite" value="${customerDetail.custWebsite }">
								</td>
							</TR> --%>
							<tr>
								<td>客户资质 ：</td>
								<td>
									<input type="file" name="upload">
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
	</s:form>
</BODY>
</HTML>
