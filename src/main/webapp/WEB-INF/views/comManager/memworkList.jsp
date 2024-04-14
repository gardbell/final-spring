<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h1>사원 근태관리</h1>
<hr>
<c:forEach var="member" items="${list}">
    <c:if test="${member.status==0}">
        <h3>새 신청목록</h3>
        <table style="width: 1200px;" border=1 frame=below rules=rows>
            <tr style="height: 50px">
                <th style="width: 100px">이름</th>
                <th style="width: 100px">부서</th>    
                <th style="width: 100px">신청내역</th>
                <th style="width: 100px">신청일</th>
                <th style="width: 100px">신청일수</th>    
                <th style="width: 300px">특이사항</th>
                <th style="width: 50px">승인</th>    
            </tr>
            <tr style="height: 50px">
                <td><a class="link" href='javascript:void(0);' onclick="update('${member.id}');">${member.name }</a></td>
                <td>${member.dept}</td>
                <td>
                    <c:choose>
                        <c:when test="${member.work == 0}">연차</c:when>
                        <c:when test="${member.work == 1}">반차</c:when>
                        <c:when test="${member.work == 2}">외근</c:when>
                        <c:when test="${member.work == 3}">출장</c:when>
                        <c:when test="${member.work == 4}">휴가</c:when>
                        <c:when test="${member.work == 5}">경조</c:when>
                    </c:choose>
                </td>
                <td>${member.work_date}</td>
                <td>${member.work_day}</td>
                <td>${member.note }</td>
                <td><input class="push2" type="button" value="승인" onclick="workpromotion('${member.idx}')"></td>
            </tr>
         </table>   
    </c:if>
</c:forEach>
<br>
<h3>전체 신청목록</h3>
<table style="width: 1200px;" border=1  frame=below rules=rows>
    <tr style="height: 50px">
        <th style="width: 100px">이름</th>
        <th style="width: 100px">직급</th>    
        <th style="width: 100px">신청내역</th>
        <th style="width: 100px">신청일</th>
        <th style="width: 100px">신청일수</th>    
        <th style="width: 300px">특이사항</th>
        <th style="width: 50px">승인</th> 
    </tr>
    <c:forEach var="member" items="${list }">
        <tr style="height: 50px">
            <td><a class="link" href='javascript:void(0);' onclick="update('${member.id}');">${member.name }</a></td>
            <td>${member.dept}</td>
            <td>
                <c:choose>
                    <c:when test="${member.work == 0}">연차</c:when>
                    <c:when test="${member.work == 1}">반차</c:when>
                    <c:when test="${member.work == 2}">외근</c:when>
                    <c:when test="${member.work == 3}">출장</c:when>
                    <c:when test="${member.work == 4}">휴가</c:when>
                    <c:when test="${member.work == 5}">경조</c:when>
                </c:choose>
            </td>
            <td>${member.work_date}</td>
            <td>${member.work_day}</td>
            <td>${member.note }</td>
            <c:if test="${member.status==0}">
                <td><input class="push2" type="button" value="승인" onclick="workpromotion('${member.idx}')"></td>
            </c:if>
            <c:if test="${member.status!=0}">
                <td style="text-align: center"><b>승인</b></td>
            </c:if>
        </tr>
    </c:forEach>
</table>
