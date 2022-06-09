<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "header.html" %>
<%@taglib prefix="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<p>会員情報削除</p>
<p>${I_WKK0001}</p>
<p>${I_WKK0002}</p>
<p>${I_WKK0003}</p>
<p>${I_WKK0004}</p>
<p>${E_WKK0001}</p>
<p>${E_WKK0002}</p>
<p>${E_WKK0003}</p>
<p>${E_WKK0004}</p>
<p>${E_WKK0005}</p>
<p>${W_WKK0001}</p>
<section>
	<form action = "../jp.co.aforce.servlets/search2" method = "post" >
		<dl>
		<dt>会員番号</dt>
			<dd>
			<input type = "text" name = "member_id"  value = "${member.member_id}">
			<input type = "submit"  name = "search" value = "検索" class= "button">
		</dd>
		</dl>
	</form>

	<form action="../jp.co.aforce.servlets/delete" method = "post" >
	<dl>
		<dt>■名前</dt>
		<dd>
			性　<input type ="text" name = "last_name"  value = "${member.last_name}" disabled="disabled">
			名　<input type = "text" name = "first_name"  value = "${member.first_name}" disabled="disabled">
		</dd>

		<dt>■性別</dt>
		<dd>
			<c:choose>
			<c:when test="${member.sex == '1'}">
			<input type ="radio" name = "sex" value = "1"  checked="checked" disabled="disabled">男　
			<input type ="radio" name = "sex" value = "2" disabled="disabled">女
			</c:when>
			<c:when test="${member.sex == '2'}">
			<input type ="radio" name = "sex" value = "1"  disabled="disabled">男　
			<input type ="radio" name = "sex" value = "2"  checked="checked"  disabled="disabled">女
			</c:when>
			<c:otherwise>
			<input type ="radio" name = "sex" value = "1" disabled="disabled" >男　
			<input type ="radio" name = "sex" value = "2"  disabled="disabled">女
			</c:otherwise>
			</c:choose>
		</dd>

		<dt>■生年月日</dt>
		<dd>
		<select name = "birth_year"  disabled="disabled">
			<option value = ""selected disabled="disabled"></option>
		<c:if test="${not empty member.birth_year}">
			<option value = "${member.birth_year}"selected disabled="disabled">${member.birth_year}</option>
		</c:if>
		</select>年

		<select name = "birth_month"  disabled="disabled">
			<option value = ""selected disabled="disabled"></option>

		<c:if test="${not empty member.birth_month}">
		<option value = "${member.birth_month}"selected disabled="disabled">${member.birth_month}</option>
		</c:if>
		</select>月

		<select name = "birth_day"  disabled="disabled">

		<c:if test="${not empty member.birth_day}">
		<option value = "${member.birth_day}"selected disabled="disabled">${member.birth_day}</option>
		</c:if>
		</select>日
		</dd>

		<dt>■職業</dt>
		<dd>
		<select name = "job"  disabled="disabled">
			<option value = ""selected disabled="disabled"></option>
		<c:if test="${not empty member.job}">
			<c:choose>
				<c:when test="${member.job == '100' }">
				<option value = "100" selected disabled="disabled">会社員</option>
				</c:when>
				<c:when test="${member.job == '200' }">
				<option value = "200" selected disabled="disabled">自営業</option>
				</c:when>
				<c:when test="${member.job == '300' }">
				<option value = "300" selected disabled="disabled">学生</option>
				</c:when>
				<c:when test="${member.job == '400' }">
				<option value = "400" selected disabled="disabled">その他</option>
				</c:when>
			</c:choose>
		</c:if>
		</select>
		</dd>

		<dt>■電話番号</dt>
		<dd>
		<input type = "tel" name = "phone_number"  value = "${member.phone_number}" disabled="disabled">
		</dd>

		<dt>■メールアドレス</dt>
		<dd>
		<input type = "text" name = "mail_address"  value = "${member.mail_address}" disabled="disabled">
		</dd>

		<dd>
		<input type = "button" name = "back"  onclick="location.href = '../views/menu.jsp'" value = "戻る" class = "button">
		<input type = "reset" name = "reset" value = "リセット" class = "button">
		<input type = "submit" name = "delete" value = "削除" class = "button">
		</dd>
		</dl>
	</form>
</section>

<%@include file = "footer.html" %>