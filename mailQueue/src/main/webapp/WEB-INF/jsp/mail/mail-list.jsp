<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Mail list</title>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h2>Mail list</h2>

<c:if test="${empty mails}">
    <h3>Sorry, no records found... :(</h3>
</c:if>

<c:forEach items="${mails}" var="mail">
    Mail id: ${mail.id} <br/>
    Sender: ${mail.sender} <br/>
    Recipient/s: ${mail.recipients} <br/>
    Title: ${mail.title} <br/>
    Message: ${mail.message} <br/>
    <a href="/mail/mail-send/${mail.id}">Send</a>
    <a href="/mail/mail-edit/${mail.id}">Edit</a>
    <a href="/mail/mail-delete/${mail.id}">Delete</a>
    <br/><br/>
</c:forEach>
</body>
</html>