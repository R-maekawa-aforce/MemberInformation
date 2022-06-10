<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "header.html" %>
<%@taglib prefix="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<p>会員情報更新</p>
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

<section>
	<form action = "../jp.co.aforce.servlets/search" method = "post" >
		<p>会員番号<br>
		<input type = "text" name = "member_id"  value = "${member.member_id}" >
		<input type = "submit"  name = "search" value = "検索" class = "button">
		</p>
	</form>

	<form action="../jp.co.aforce.servlets/update" method = "post" >
	<dl>
		<dt>■名前</dt>
		<dd>
		性　<input type ="text" name = "last_name"  value = "${member.last_name}">
		名　<input type = "text" name = "first_name"  value = "${member.first_name}">
		</dd>

		<dt>■性別</dt>
		<dd>
			<c:choose>
			<c:when test="${member.sex == '1'}">
				<input type ="radio" name = "sex" value = "1"  checked="checked">男　
				<input type ="radio" name = "sex" value = "2" >女
			</c:when>
			<c:when test="${member.sex == '2'}">
				<input type ="radio" name = "sex" value = "1" >男　
				<input type ="radio" name = "sex" value = "2"  checked="checked">女
			</c:when>
			<c:otherwise>
				<input type ="radio" name = "sex" value = "1" >男　
				<input type ="radio" name = "sex" value = "2" >女
			</c:otherwise>
			</c:choose>
		</dd>

		<dt>■生年月日</dt>
		<dd>
		<select name = "birth_year" >
			<option value = ""selected disabled="disabled"></option>
			<c:forEach var = "i" begin = "1920" end = "2020">
				<option value = "${i}">${i}</option>
			</c:forEach>
		<c:if test="${not empty member.birth_year}">
		<option value = "${member.birth_year}"selected>${member.birth_year}</option>
		</c:if>
		</select>年

		<select name = "birth_month" >
			<option value = ""selected disabled="disabled"></option>
			<c:forEach var = "i" begin = "1" end = "12">
				<option value = "${i}">${i}</option>
			</c:forEach>
		<c:if test="${not empty member.birth_month}">
		<option value = "${member.birth_month}"selected>${member.birth_month}</option>
		</c:if>
		</select>月

		<select name = "birth_day" >
			<option value = ""selected disabled="disabled"></option>
			<c:forEach var = "i" begin = "1" end = "31">
				<option value = "${i}">${i}</option>
			</c:forEach>
		<c:if test="${not empty member.birth_day}">
		<option value = "${member.birth_day}"selected>${member.birth_day}</option>
		</c:if>
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
		<c:if test="${not empty member.job}">
			<c:choose>
				<c:when test="${member.job == '100' }">
					<option value = "100" selected>会社員</option>
				</c:when>
				<c:when test="${member.job == '200' }">
					<option value = "200" selected>自営業</option>
				</c:when>
				<c:when test="${member.job == '300' }">
					<option value = "300" selected>学生</option>
				</c:when>
				<c:when test="${member.job == '400' }">
					<option value = "400" selected>その他</option>
				</c:when>
			</c:choose>
		</c:if>
		</select>
		</dd>

		<dt>■電話番号</dt>
		<dd>
			<input type = "tel" name = "phone_number"  value = "${member.phone_number}">
		</dd>

		<dt>■メールアドレス</dt>
		<dd>
			<input type = "text" name = "mail_address"  value = "${member.mail_address}">
		</dd>

		<dd>
		<input type = "button" name = "back"  onclick="location.href = '../views/menu.jsp'" value = "戻る" class = "button">
		<input type = "reset" name = "reset" value = "リセット" class = "button">
		<input type = "submit" name = "regist" value = "更新" class = "button">
		</dd>
	</dl>
	</form>
</section>

<%@include file = "footer.html" %>