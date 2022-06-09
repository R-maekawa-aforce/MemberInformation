<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "header.html" %>
<%@taglib prefix="c"  uri = "http://java.sun.com/jsp/jstl/core" %>


<p>会員情報登録</p>
<p>
<c:forEach var = "p"  items = "${list}">
	${p}${W_CCM0001}<br>
</c:forEach>
</p>
<p>${I_WKK0001}</p>
<p>${I_WKK0002}</p>
<p>${I_WKK0003}</p>
<p>${I_WKK0004}</p>
<p>${E_WKK0001}</p>
<p>${E_WKK0002}</p>
<p>${E_WKK0003}</p>
<p>${E_WKK0004}</p>
<p>${E_WKK0005}</p>
<p>${member.member_id}</p>

<section>
	<form action="../jp.co.aforce.servlets/insert" method = "post">
		<dl>
		<dt>■名前</dt>
		<dd>
		性　<input type ="text" name = "last_name" >
		名　<input type = "text" name = "first_name" >
		</dd>

		<dt>■性別<dt>
		<dd>
		<input type ="radio" name = "sex" value = "1" >男　
		<input type = "radio" name = "sex" value = "2" >女
		</dd>

		<dt>■生年月日</dt>
		<dd>
		<select name = "birth_year" >
			<option value = ""selected disabled="disabled"></option>
			<c:forEach var = "i" begin = "1920" end = "2020">
			<option value = "${i}">${i}</option>
			</c:forEach>
		</select>年

		<select name = "birth_month" >
			<option value = ""selected disabled="disabled"></option>
			<c:forEach var = "i" begin = "1" end = "12">
			<option value = "${i}">${i}</option>
			</c:forEach>
		</select>月

		<select name = "birth_day" >
			<option value = ""selected disabled="disabled"></option>
			<c:forEach var = "i" begin = "1" end = "31">
			<option value = "${i}">${i}</option>
			</c:forEach>
		</select>日
		</dd>

		<dt>■職業</dt>
		<dd>
		<select name = "job" >
			<option value = ""selected disabled="disabled"></option>
			<option value = "100">会社員</option>
			<option value = "200">自営業</option>
			<option value = "300">学生</option>
			<option value = "400">その他</option>
		</select>
		</dd>

		<dt>■電話番号</dt>
		<dd>
		<input type = "tel" name = "phone_number" >
		</dd>

		<dt>■メールアドレス</dt>
		<dd>
		<input type = "text" name = "mail_address" >
		</dd>

		<dd>
		<input type = "button" name = "back"  onclick="location.href = '../views/menu.jsp'" value = "戻る" class = "button">
		<input type = "reset" name = "reset" value = "リセット" class = "button">
		<input type = "submit" name = "regist" value = "登録" class = "button">
		</dd>

		</dl>
	</form>
</section>

<%@include file = "footer.html" %>