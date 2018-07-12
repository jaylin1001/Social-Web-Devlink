<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty srResult }">
	<c:forEach var="sr" items="${srResult}" begin="0" end="1" step="1">
		<a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${sr.m_no}" class="list-group-item list-group-item-action">${sr.nm}</a>
    </c:forEach>
</c:if> 