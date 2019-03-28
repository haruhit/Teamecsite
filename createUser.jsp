<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="header.jsp" >
  <jsp:param name="title" value="ユーザー情報入力画面" />
</jsp:include>
<div id="container">
	<div id="page-title">
		<h1>Create User</h1>
		<p>ユーザー登録</p>
	</div>

	<div id="error">
	<s:if test="familyNameErrorMessageList != null">
	 	<s:if test="!familyNameErrorMessageList.isEmpty()">
	  		<div class="error-box">
				<s:iterator value="familyNameErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:if test="firstNameErrorMessageList != null">
		<s:if test="!firstNameErrorMessageList.isEmpty()">
	 		<div class="error-box">
				<s:iterator value="firstNameErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:if test="familyNameKanaErrorMessageList != null">
		<s:if test="!familyNameKanaErrorMessageList.isEmpty()">
	 		<div class="error-box">
				<s:iterator value="familyNameKanaErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:if test="firstNameKanaErrorMessageList != null">
		<s:if test="!firstNameKanaErrorMessageList.isEmpty()">
	 		<div class="error-box">
				<s:iterator value="firstNameKanaErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:if test="emailErrorMessageList != null">
		<s:if test="!emailErrorMessageList.isEmpty()">
	 		<div class="error-box">
				<s:iterator value="emailErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:if test="userIdErrorMessageList != null">
		<s:if test="!userIdErrorMessageList.isEmpty()">
	 		<div class="error-box">
				<s:iterator value="userIdErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:if test="passwordErrorMessageList != null">
		<s:if test="!passwordErrorMessageList.isEmpty()">
	 		<div class="error-box">
				<s:iterator value="passwordErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:if test="isExistUserIdErrorMessageList != null">
		<s:if test="!isExistUserIdErrorMessageList.isEmpty()">
	 		<div class="error-box">
				<s:iterator value="isExistUserIdErrorMessageList">
					<p><s:property /></p>
				</s:iterator>
			</div>
		</s:if>
	</s:if>
	 </div>
	<s:form action="CreateUserConfirmAction">
	<div id="nep-vertical-table">
		<table>
			<tr>
				<th><s:label value="姓"/></th>
				<td>
					<div id="form-text">
						<s:textfield name="familyName" value="%{familyName}" label="姓" placeholder="姓" id="right-top-radius" />
					</div>
				</td>
			</tr>
			<tr>
				<th><s:label value="名"/></th>
				<td>
					<div id="form-text">
						<s:textfield name="firstName" value="%{firstName}" label="名" placeholder="名" />
					</div>
				</td>
			</tr>
			<tr>
				<th><s:label value="姓ふりがな"/></th>
				<td>
					<div id="form-text">
						<s:textfield name="familyNameKana" value="%{familyNameKana}" label="姓ふりがな" placeholder="姓ふりがな"  />
					</div>
				</td>
			</tr>
			<tr>
				<th><s:label value="名ふりがな"/></th>
				<td>
					<div id="form-text">
						<s:textfield name="firstNameKana" value="%{firstNameKana}" label="名ふりがな" placeholder="名ふりがな" />
					</div>
				</td>
			</tr>
		<s:if test="sex != null">
			<tr>
				<th><s:label value="性別"/></th>
				<td id="form-select"><s:radio name="sex" list="%{sexList}" value="%{sex}" label="性別" placeholder="性別"/></td>
			</tr>
		</s:if>
		<s:else>
			<tr>
				<th><s:label value="性別"/></th>
				<td id="form-select"><s:radio name="sex" list="%{sexList}" value="%{defaultSexValue}" label="性別" placeholder="性別"/></td>
			</tr>
		</s:else>
			<tr>
				<th><s:label value="メールアドレス"/></th>
				<td>
					<div id="form-text">
						<s:textfield name="email" value="%{email}" label="メールアドレス" placeholder="メールアドレス" />
					</div>
				</td>
			</tr>
			<tr>
				<th><s:label value="ユーザーID"/></th>
				<td>
					<div id="form-text">
						<s:textfield name="userId" value="%{userId}" label="ユーザーID" placeholder="ユーザーID" />
					</div>	
				</td>
			</tr>
			<tr>
				<th><s:label value="パスワード"/></th>
				<td>
					<div id="form-text">
						<s:password name="password" value="" label="パスワード" placeholder="パスワード" id="right-bottom-radius"/>
					</div>		
				</td>
			</tr>
		</table>
	</div>
	<div id="submit">
	　<div id="submit-btn">
		<s:submit value="確認" class="submit_btn" />
	  </div>
	</div>

	</s:form>
</div>
</body>
</html>