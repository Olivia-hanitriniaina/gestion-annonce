<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <th class="sortable"><a href="/projet/user/index?sort=username&amp;max=10&amp;order=asc">Username</a></th>
                    <th class="sortable"><a href="/projet/user/index?sort=passwordExpired&amp;max=10&amp;order=asc">Password Expired</a></th>
                    <th class="sortable"><a href="/projet/user/index?sort=accountLocked&amp;max=10&amp;order=asc">Account Locked</a></th>
                    <th class="sortable"><a href="/projet/user/index?sort=accountExpired&amp;max=10&amp;order=asc">Account Expired</a></th>
                    <th class="sortable"><a href="/projet/user/index?sort=enabled&amp;max=10&amp;order=asc">Enabled</a></th>
                    <th class="sortable"><a href="/projet/user/index?sort=annonces&amp;max=10&amp;order=asc">Annonces</a></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${userList}" var="user">
                <tr class="even">
                    <td><a href="/projet/user/show/${user.id}">${user.username}</a></td>
                    <td>${user.passwordExpired}</td>
                    <td>${user.accountLocked}</td>
                    <td>${user.passwordExpired}</td>
                    <td>${user.enabled}</td>
                    <td>
                        <ul>
                            <g:each in="${user.annonces}" var="annonce">
                                <li><a href="/projet/annonce/show/${annonce.id}">${annonce.title}</a></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>