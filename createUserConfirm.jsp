<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="header.jsp" >
  <jsp:param name="title" value="ユーザー情報登録確認画面" />
</jsp:include>
<div id="container">
	<div id="page-title">
		<h1>Create User Confirm</h1>
		<p>ユーザー登録確認</p>
	</div>
	<s:form action="CreateUserCompleteAction">
	<div id="nep-vertical-table">
		<table>
			<tr>
				<th><s:label value="姓"/></th>
				<td><span><s:property value="familyName"/></span></td>
			</tr>
			<tr>
				<th><s:label value="名"/></th>
				<td><span><s:property value="firstName"/></span></td>
			</tr>
			<tr>
				<th><s:label value="姓ふりがな"/></th>
				<td><span><s:property value="familyNameKana"/></span></td>
			</tr>
			<tr>
				<th><s:label value="名ふりがな"/></th>
				<td><span><s:property value="firstNameKana"/></span></td>
			</tr>
			<tr>
				<th><s:label value="性別"/></th>
				<td><span><s:property value="sex"/></span></td>
			</tr>
			<tr>
				<th><s:label value="メールアドレス"/></th>
				<td><span><s:property value="email"/></span></td>
			</tr>
			<tr>
				<th><s:label value="ユーザーID"/></th>
				<td><span><s:property value="userId"/></span></td>
			</tr>
			<tr>
				<th><s:label value="パスワード"/></th>
				<td><span><s:property value="password"/></span></td>
			</tr>
		</table>
	</div>
	<div id="submit">
	　<div id="submit-btn">
		<s:submit value="登録" class="submit_btn" />
	  </div>
	</div>
	
			<s:hidden name="userId" value="%{userId}"/>
			<s:hidden name="password" value="%{password}"/>
			<s:hidden name="familyName" value="%{familyName}"/>
			<s:hidden name="firstName" value="%{firstName}"/>
			<s:hidden name="familyNameKana" value="%{familyNameKana}"/>
			<s:hidden name="firstNameKana" value="%{firstNameKana}"/>
		<s:if test='sex.equals("男性")'>
			<s:hidden name="sex" value="0"/>
		</s:if>
		<s:if test='sex.equals("女性")'>
			<s:hidden name="sex" value="1"/>
		</s:if>
			<s:hidden name="email" value="%{email}"/>
	</s:form>
	
	<s:form action="CreateUserAction">
		<div id="submit">
		　<div id="submit-btn">
			<s:submit value="戻る" class="submit_btn" />
		  </div>
		</div>
	
		<s:hidden name="userId" value="%{userId}"/>
		<s:hidden name="password" value="%{password}"/>
		<s:hidden name="familyName" value="%{familyName}"/>
		<s:hidden name="firstName" value="%{firstName}"/>
		<s:hidden name="familyNameKana" value="%{familyNameKana}"/>
		<s:hidden name="firstNameKana" value="%{firstNameKana}"/>
	<s:if test='sex.equals("男性")'>
		<s:hidden name="sex" value="0"/>
	</s:if>
	<s:if test='sex.equals("女性")'>
		<s:hidden name="sex" value="1"/>
	</s:if>
		<s:hidden name="email" value="%{email}"/>
	</s:form>
</div>
</body>
</html>