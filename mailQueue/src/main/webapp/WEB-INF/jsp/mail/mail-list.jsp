<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/main.css"/>
    <title>Mail list</title>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h2 align="center">Mail list</h2>

<c:if test="${empty mails}">
    <h3>Sorry, no records found... :(</h3>
</c:if>

<c:forEach items="${mails}" var="mail">
    <table width="350" border="0" cellpadding="4" cellspacing="1" align="center">
        <tr>
            <td align="left" width="140">Mail id: ${mail.id}</td>
        </tr>
        <tr>
            <td align="left" width="140">Sender: ${mail.sender}</td>
        </tr>
        <tr>
            <td align="left" width="140">Recipient: ${mail.recipients}</td>
        </tr>
        <tr>
            <td align="left" width="140">Title: ${mail.title}</td>
        </tr>
        <tr>
            <td align="left" width="140">Message: ${mail.message}</td>
        </tr>
        <tr>
            <td colspan="2" align="center"><a href="/mail/mail-send/${mail.id}" class="button">Send</a>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a href="/mail/mail-edit/${mail.id}" class="button">Edit</a>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a href="/mail/mail-delete/${mail.id}" class="button">Delete</a>
                </sec:authorize>
            </td>
        </tr>


    </table>
</c:forEach>
</body>
</html>