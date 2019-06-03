<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type=text/css href="./css/cart.css">
<link rel="stylesheet" type=text/css href="./css/header.css">
<link rel="stylesheet" type=text/css href="./css/jupiter.css">

<script type="text/javascript" src="./js/header.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/cart.js"></script>
<title>カート画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="contents">
		<h1>カート画面</h1>
	</div>
	<s:if test="cartInfoDTOList == null">
		<div class="message">カート情報がありません。</div>
	</s:if>
	<s:elseif test="cartInfoDTOList.size == 0">
		<div class="message">カート情報がありません。</div>
	</s:elseif>
	<s:else>
		<s:form class="cart">
			<table class="product-list">
				<tr>
					<th>＃</th>
					<th>商品名</th>
					<th class="nobr">商品名ふりがな</th>
					<th>商品画像</th>
					<th>値段</th>
					<th>発売会社名</th>
					<th>発売年月日</th>
					<th class="nobr">購入個数</th>
					<th>合計金額</th>
				</tr>
				<s:iterator value="cartInfoDTOList">
					<tr>
						<td><input type="checkbox" name="deleteId"
							value="<s:property value="id" />" class="check"></td>
						<td><s:property value="productName" /></td>
						<td><s:property value="productNameKana" /></td>
						<td><img
							src="<s:property value="imageFilePath" />/<s:property value="imageFileName" />"
							width="50px" height="50px"></td>
						<td class="nobr"><s:property value="price" /> <span>円</span></td>
						<td class="nobr"><s:property value="releaseCompany" /></td>
						<td><s:property value="releaseDate" /></td>
						<td><s:property value="productCount" /></td>
						<td class="nobr"><s:property value="subtotal" /> <span>円</span></td>
					</tr>
				</s:iterator>
				<tr>
					<td colspan="6"><h4>
							<br>
						</h4> <br>
						<button type="submit" class="btn" id="btn2">決済</button></td>
					<td colspan="3"><h4>
							カート合計金額：
							<s:property value="totalPrice" />
							<span>円</span>
						</h4> <br>
						<button type="submit" class="btn" id="btn" value="押せない"
							disabled="disabled">削除</button></td>
				</tr>
			</table>
		</s:form>
	</s:else>
</body>
</html>