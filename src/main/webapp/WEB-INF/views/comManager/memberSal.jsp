<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h1>사원 급여목록</h1>
<hr>

<br><br>
<table style="width: 1200px;" border="1" frame="below" rules="rows">
    <tr style="height: 50px">
        <th style="width: 100px">이름</th>
        <th style="width: 100px">부서</th>
        <th style="width: 300px">지급총액</th>    
        <th style="width: 100px">소득세</th>    
        <th style="width: 100px">지방소득세</th>    
        <th style="width: 100px">국민연금</th>    
        <th style="width: 100px">건강보험</th>
        <th style="width: 100px">고용보험</th>
        <th style="width: 100px">실수령</th>   
    </tr>
    <c:forEach var="member" items="${list}">
        <%-- 각 사원의 소득세 계산 --%>
        <c:set var="incomeTaxRate" value="${(member.sal <= 14000000) ? 0.06 : (member.sal <= 50000000) ? 0.15 : 0.24}" />
        <c:set var="incomeTax" value="${Math.round(member.sal * incomeTaxRate)}" />
        
        <%-- 각 사원의 지방소득세 계산 --%>
        <c:set var="localIncomeTaxRate" value="${incomeTaxRate * 0.1}" />
        <c:set var="localIncomeTax" value="${Math.round(member.sal * localIncomeTaxRate)}" />
        
        <%-- 각 사원의 국민연금, 건강보험, 고용보험 계산 --%>
        <c:set var="nationalPension" value="${Math.round(member.sal * 0.045)}" />
        <c:set var="healthInsurance" value="${Math.round(member.sal * 0.035)}" />
        <c:set var="employmentInsurance" value="${Math.round(member.sal * 0.009)}" />
        
        <%-- 각 사원의 실수령액 계산 --%>
        <c:set var="netSalary" value="${member.sal - incomeTax - localIncomeTax - nationalPension - healthInsurance - employmentInsurance}" />
        
        <%-- 각 사원의 정보 출력 --%>
        <tr style="height: 50px">
            <td><a class="link" href='javascript:void(0);' onclick="update('${member.id}');">${member.name}</a></td>
            <td>${member.dept}</td>
            <td><fmt:formatNumber value="${member.sal}" pattern="#,###" /></td>
            <td><fmt:formatNumber value="${incomeTax}" pattern="#,###" /></td>
            <td><fmt:formatNumber value="${localIncomeTax}" pattern="#,###" /></td>
            <td><fmt:formatNumber value="${nationalPension}" pattern="#,###" /></td>
            <td><fmt:formatNumber value="${healthInsurance}" pattern="#,###" /></td>
            <td><fmt:formatNumber value="${employmentInsurance}" pattern="#,###" /></td>
            <td><fmt:formatNumber value="${netSalary}" pattern="#,###" /></td>
        </tr>
    </c:forEach>
</table>
