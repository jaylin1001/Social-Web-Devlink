<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<br>
<c:forEach var="item" items="${msgList }">
	<c:choose>
		<c:when test="${item.msg_from eq sessionScope.no }">
			<div class="card text-white bg-info mb-3" style="width:60%;  float:right">
    			<p class="card-text" style="padding:4%">${item.msg }</p>
			</div>
		</c:when>
		<c:otherwise>
			<div class="card border-info mb-3" style="width:60%;float:left">
    			<p class="card-text" style="padding:4%">${item.msg }</p>	
			</div><br>
		</c:otherwise>
	</c:choose>
</c:forEach>
