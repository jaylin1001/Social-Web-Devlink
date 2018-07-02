<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <h5 class="card-title"><b>${exp.title }</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a>&ensp;<a href="#"><i class="fas fa-times"></i></a></h5>
    <p>
    Company Name : ${exp.group }<br>
	Date Employed : ${exp.start }<c:if test ="${not empty exp.end }">&nbsp;– ${exp.end }</c:if><br>
	<c:if test ="${not empty exp.duration }">Employment Duration : ${exp.duration } days<br></c:if>
    Location : ${exp.place }<br>
    Contents : ${exp.contents }<br>
    </p>
<br>