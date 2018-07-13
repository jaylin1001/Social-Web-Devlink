<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="hccmt" items="${hccmt}">
<c:if test="${hccmt.m_name eq sessionScope.no}">
  <c:if test="${empty hccmt.path }">
    <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="margin-left:10px ;border-radius: 50%;width:25px; height: 25px;"></a>
  </c:if>
  <c:if test="${not empty hccmt.path }">
    <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${hccmt.path}" style="margin-left:10px ;border-radius: 50%;width:25px; height: 25px;"></a>
  </c:if>
</c:if>
<c:if test="${hccmt.m_name ne sessionScope.no}">
  <c:if test="${empty hccmt.path }">
    <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hccmt.m_no}"><img src="resources/img/home/default.png" style="margin-left:10px ;border-radius: 50%;width:25px; height: 25px;"></a>
  </c:if>
  <c:if test="${not empty hccmt.path }">
    <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hccmt.m_no}"><img src="resources/img/profile/${hccmt.path}" style="margin-left:10px ;border-radius: 50%;width:25px; height: 25px;"></a>
  </c:if>
</c:if>
<!-- <p><img src="resources/img/home/userimage.png" style="margin-left:10px ;border-radius: 50%;width:25px; height: 25px;"> -->
<b>${hccmt.m_name}</b><br />&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;${hccmt.cmt}<p><br />
</c:forEach>