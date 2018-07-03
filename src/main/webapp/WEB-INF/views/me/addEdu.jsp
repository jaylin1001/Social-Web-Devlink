<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <h5 class="card-title"><b>${edu.title }</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a>&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${edu.no}"><i class="fas fa-times"></i></a></h5>
	<p>
		${edu.degree }'s Degree, ${edu.contents }<br>
		${edu.start }<c:if test ="${not empty edu.end }">&nbsp;– ${edu.end }</c:if><br>
	</p>