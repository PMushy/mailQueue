<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/main.css"/>
    <title>New mail</title>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h1>Create new e-mail</h1>
<from:form action="/mail/create" method="POST" modelAttribute="mail">
    To: <form:input path="recipients"/><br/>
    Title: <form:input path="title"/><br/>
    Message text: <form:input path="message"/><br/>
    <%--TODO
    sending in progres--%>
    <input type="submit" value="Send"/>
    <input type="submit" value="Add to queue"/>
</from:form>
</body>
</html>