<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "header.html" %>
<p>メニュー画面</p>

<section>
	<p><input type ="button" onclick = "location.href = 'insert.jsp'" value = "会員情報登録" class = "button"></p>
	<p><input type ="button" onclick = "location.href = 'update.jsp'" value = "会員情報更新" class = "button"></p>
	<p><input type ="button" onclick = "location.href = 'delete.jsp'" value = "会員情報削除" class = "button"></p>
</section>

<%@include file = "footer.html" %>


