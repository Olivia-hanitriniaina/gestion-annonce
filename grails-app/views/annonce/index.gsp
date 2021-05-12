<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800"><g:message code="default.list.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<!-- DataTales Example -->
<div class="card shadow mb-4">

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-success" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th class="sortable"><a href="/projet/annonce/index?sort=title&amp;max=10&amp;order=asc">Title</a>
                    </th>
                    <th class="sortable"><a
                            href="/projet/annonce/index?sort=description&amp;max=10&amp;order=asc">Description</a></th>
                    <th class="sortable"><a href="/projet/annonce/index?sort=price&amp;max=10&amp;order=asc">Price</a>
                    </th>
                    <th class="sortable"><a href="/projet/annonce/index?sort=author&amp;max=10&amp;order=asc">Author</a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${annonceList}" var="annonce">
                    <tr class="even">
                        <td><a href="/projet/annonce/show/${annonce.id}">${annonce.title}</a></td>
                        <td>${annonce.description}</td>
                        <td>${annonce.price}</td>
                        <td>
                            ${annonce.author.username}
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-7">
                <div class="dataTables_paginate paging_simple_numbers"
                     id="dataTable_paginate">
                    <ul class="pagination">
                        <g:paginate total="${annonceCount ?: 0}"/>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
