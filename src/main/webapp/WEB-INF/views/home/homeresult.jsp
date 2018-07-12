<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="hccmt" items="${hccmt}">
<p><img src="resources/img/home/userimage.png" style="margin-left:10px ;border-radius: 50%;width:25px; height: 25px;">
<b>${hccmt.m_no}</b><br />&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;${hccmt.cmt}<p><br />
</c:forEach>