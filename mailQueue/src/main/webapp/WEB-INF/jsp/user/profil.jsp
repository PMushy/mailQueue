<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../resources/css/main.css"/>
    <title>Profile</title>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<div align="center">
    <h2>Profile</h2>
</div>

<table width="500" border="0" cellpadding="4" cellspacing="1" align="center">

    <tr>
        <td width="130" align="right">
            <s:message code="register.email"/>
        </td>
        <td width="270" align="left">
            <c:out value="${user.email}"/>
        </td>
    </tr>
    <tr>
        <td width="130" align="right">
            Nick:
        </td>
        <td width="270" align="left">
            <c:out value="${user.nick}"/>
        </td>
    </tr>
    <tr>
        <td width="130" align="right">
            Active:
        </td>
        <td width="270" align="left">
            <c:choose>
                <c:when test="${user.active == 1}">Yes</c:when>
                <c:otherwise>No</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td width="130" align="right">
            Role:
        </td>
        <td width="270" align="left">
            <c:choose>
                <c:when test="${user.roleNr == 1}">
                    <s:message code="word.admin"/>
                </c:when>
                <c:otherwise>
                    <s:message code="word.user"/>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>

<table width="500" border="0" cellpadding="4" cellspacing="1" align="center">
    <td align="center">
        <input type="button" value="<s:message code="button.zmianaHasla"/>"
               onclick="window.location.href='${pageContext.request.contextPath}/edit-password'"/>
    </td>
</table>

<%@include file="../fragments/footer.jspf" %>
</body>
</html>