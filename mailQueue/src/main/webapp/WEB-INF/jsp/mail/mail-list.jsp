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

    <a href="/mail/mail-send/${mail.id}" class="button">Send</a>


    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="/mail/mail-edit/${mail.id}">Edit</a>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="/mail/mail-delete/${mail.id}">Delete</a>
    </sec:authorize>
    <br/><br/>
</c:forEach>
</body>
</html>