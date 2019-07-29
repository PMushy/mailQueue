<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Users</title>
    <link rel="stylesheet" href="/resources/css/main.css"/>
</head>
<body>
<%@include file="../fragments/header.jspf" %>
<h2 align="center">Users</h2>

<table width="1000" border="0" cellpadding="6" cellspacing="2" align="center">
    <tr>
        <td width="40" align="center"></td>
        <td width="40" align="center"><b>User id</b></td>
        <td width="190" align="center"><b>Nick</b></td>
        <td width="200" align="center"><b>Email</b></td>
        <td width="100" align="center"><b>Active</b></td>
        <td width="190" align="center"><b>Role</b></td>
        <td width="50"></td>
    </tr>
    <c:forEach var="u" items="${userList }">
        <c:set var="licznik" value="${licznik+1}"/>
        <tr onmouseover="changeTrBg(this)" onmouseout="defaultTrBg(this)">
            <td align="center"><c:out value="${licznik }"/></td>
            <td align="center"><a href="edit/${u.id }"><c:out value="${u.id}"/></a></td>
            <td align="center"><a href="edit/${u.id }"><c:out value="${u.nick}"/></a></td>
            <td align="center"><a href="edit/${u.id }"><c:out value="${u.email}"/></a></td>
            <td align="center">
                <c:choose>
                    <c:when test="${u.active == 1 }">
                        <font color="green">Yes</font>
                    </c:when>
                    <c:otherwise>
                        <font color="red">No</font>
                    </c:otherwise>
                </c:choose>
            </td>
            <td align="center">
                <c:choose>
                    <c:when test="${u.roleNr == 1 }">
                        <font color="green"><s:message code="word.admin"/></font>
                    </c:when>
                    <c:otherwise>
                        <s:message code="word.user"/>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${u.roleNr == 1 }">
                        <img src="https://png.pngtree.com/svg/20160922/f68e9a579d.png" width="16" height="16"/>
                    </c:when>
                    <c:otherwise>
                        <a href="delete/${u.id }">
                            <img src="https://png.pngtree.com/svg/20160922/f68e9a579d.png" width="16" height="16"
                                 title="<s:message code="delete.user"/>"/>
                        </a>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>