<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<header>

	<ul class="header-menu">

		<!-- 商品検索用 -->
		<s:form id="form">
		<li><img src="./images/logo.jpg" class="header-title"></li>
			<s:if test='#session.containsKey("mCategoryDTOList")'>
				<li><s:select name="categoryId"
						list="#session.mCategoryDTOList" listValue="categoryName"
						listKey="categoryId" class="cs-div" id="categoryId" /></li>
			</s:if>

			<li><s:textfield name="keywords" class="txt-keywords"
					placeholder="検索ワード" /></li>
			<li><s:submit value="商品検索" class="btn"
					onclick="goSearchItemAction();" /></li>

			<!-- ログインかログアウト用 -->
			<li><s:if test="#session.logined==1">
					<s:submit value="ログアウト" class="btn" onclick="goLogoutAction();" />
				</s:if> <s:else>
					<s:submit value="ログイン" class="btn" onclick="goLoginAction();" />
				</s:else></li>

			<!-- カート用 -->
			<li><s:submit value="カート" class="btn" onclick="goCartAction();" /></li>

			<!-- 商品一覧用 -->
			<li><s:submit value="商品一覧" class="btn"
					onclick="goProductListAction();" /></li>

			<!-- マイページ用 -->
			<s:if test="#session.logined==1">
				<li><s:submit value="マイページ" class="btn"
						onclick="goMyPageAction();" /></li>
			</s:if>
		</s:form>
	</ul>

</header>