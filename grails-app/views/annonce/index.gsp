<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-annonce" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>

                    <th class="sortable"><a href="/projet/annonce/index?sort=title&amp;max=10&amp;order=asc">Title</a></th>

                    <th class="sortable"><a href="/projet/annonce/index?sort=description&amp;max=10&amp;order=asc">Description</a></th>

                    <th class="sortable"><a href="/projet/annonce/index?sort=price&amp;max=10&amp;order=asc">Price</a></th>

                    <th class="sortable"><a href="/projet/annonce/index?sort=illustrations&amp;max=10&amp;order=asc">Illustrations</a></th>

                    <th class="sortable"><a href="/projet/annonce/index?sort=author&amp;max=10&amp;order=asc">Author</a></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${annonceList}" var="annonce">
                <tr class="even">
                    <td><a href="/projet/annonce/show/${annonce.id}">${annonce.title}</a></td>
                    <td>${annonce.description}</td>
                    <td>${annonce.price}</td>
                    <td>
                            <g:each in="${annonce.illustrations}" var="illustration">
                                <img src="${baseUrl + illustration.filename}" />
                            </g:each>
                    </td>
                    <td>
                        ${annonce.author.username}
                    </td>
%{--                    <td><a href="/projet/user/show/1">${userList.findByAnnonceId(1)}User(username:admin)</a></td>--}%
                </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
