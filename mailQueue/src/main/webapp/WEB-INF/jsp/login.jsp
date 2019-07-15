<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>MailQueue - LoginPage</title>
</head>
<body>
<%--<%@include file="fragments/header.jspf" %>--%>
<h2 align="center">Logowanie</h2>
<form id="loginForm" action="/login" method="POST">
    <table width="350" border="0" cellpadding="4" cellspacing="1"
           align="center">
        <tr>
            <td colspan="2" align="center">
                <c:if test="${not empty param.error}">
                    <font color="red">Loging faild</font>
                </c:if>
            </td>
        </tr>
        <tr>
            <td align="right" width="140">
                Register email
            </td>
            <td align="left">
                <input type="text" name="username" id="username"
                       size="30"/>
            </td>
        </tr>
        <tr>
            <td align="right" width="140">
                Register password
            </td>
            <td align="left">
                <input type="password" name="password" id="password" size="30"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="#ffffff"><input
                    type="submit" value="Log in"/></td>
        </tr>
    </table>
</form>
<%--<%@include file="fragments/footer.jspf" %>--%>
</body>
</html>