<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit mail</title>
    <link rel="stylesheet" href="/resources/css/main.css"/>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h2 align="center">Edit mail</h2>
<form action="/mail/mail-edit/${mail.id}" method="POST" modelAttribute="mail">
    <form:hidden path="mail.id"/>
    <table width="350" border="0" cellpadding="4" cellspacing="1" align="center">
        <tr>
            <td colspan="2" align="center">
                <c:if test="${not empty param.error}">
                    <font color="red">Adding faild</font>
                </c:if>
            </td>
        </tr>
        <tr>
            <td align="right" width="140"> To</td>
            <td align="left">
                <input type="text" name="recipients" id="recipients" size="30"/>
            </td>
        </tr>
        <tr>
            <td align="right" width="140"> Title</td>
            <td align="left">
                <input type="text" name="title" id="title" size="30"/>
            </td>
        </tr>
        <tr>
            <td align="right" width="140"> Message</td>
            <td align="left">
                <input type="text" name="message" id="message" size="30"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
                <input type="button" value="Back" onclick="history.back()"/></td>
        </tr>
    </table>
</form>
</body>
</html>