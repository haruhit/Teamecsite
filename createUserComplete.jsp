<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="header.jsp" >
  <jsp:param name="title" value="ユーザー情報登録完了画面" />
</jsp:include>
	<div id="container">
		<div id="page-title">
			<h1>Create User Complete</h1>
			<p>ユーザー登録完了</p>
		</div>
		<script type="text/javascript">
			window.onload = function(){
				var form = document.getElementById('form1');
				setTimeout(function(){form.submit()},3000);
			}
		</script>
		<div id="other">
			<div class="other-box">
		 		<p>ユーザー登録が完了しました。</p>
		 	</div>
		 </div>

		<s:form id="form1" action="LoginAction">
			<s:hidden name="userId" value="%{userId}" />
			<s:hidden name="password" value="%{password}" />
		</s:form>
	</div>
</body>
</html>