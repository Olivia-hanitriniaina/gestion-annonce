<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>


<div id="show-user" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Username</h6>
                        </div>

                        <div class="card-body">
                            ${user.username}
                        </div>
                    </div>
                </div>

                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Password expired</h6>
                        </div>

                        <div class="card-body">${user.passwordExpired}</div>
                    </div>
                </div>

                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Account Locked</h6>
                        </div>

                        <div class="card-body">${user.accountLocked}</div>
                    </div>
                </div>

                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Account Expired</h6>
                        </div>

                        <div class="card-body">${user.accountExpired}</div>
                    </div>
                </div>

                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Enabled</h6>
                        </div>

                        <div class="card-body">${user.enabled}</div>
                    </div>
                </div>

                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Type</h6>
                        </div>

                        <div class="card-body">${role}</div>
                    </div>
                </div>
            </div>
        </div>
        <g:form resource="${this.user}" method="DELETE" style="margin-top: 2%;">
            <fieldset style="
            display: block;
            width: fit-content;
            margin: auto;
            ">
                <g:link class="btn btn-primary btn-icon-split" action="edit" resource="${this.user}">
                    <span class="icon text-white-50">
                        <i class="fas fa-edit"></i>
                    </span>
                    <span class="text">Edit</span>
                </g:link>
                <div class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-trash"></i>
                    </span>
                    <span class="text"><input class="btn btn-danger btn-icon-split" type="submit"
                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
                </div>
            </fieldset>
        </g:form>
    </div>

    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Annonces</h6>
        </div>
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th class="sortable"><a href="/projet/annonce/index?sort=title&amp;max=10&amp;order=asc">Title</a>
                </th>
                <th class="sortable"><a
                        href="/projet/annonce/index?sort=description&amp;max=10&amp;order=asc">Date created</a></th>
                <th class="sortable"><a
                        href="/projet/annonce/index?sort=price&amp;max=10&amp;order=asc">Date last update</a>
                </th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${annoncelist}" var="annonce">
                <tr class="even">
                    <td><a href="/projet/annonce/show/${annonce.id}">${annonce.title}</a></td>
                    <td>${annonce.dateCreated}</td>
                    <td>${annonce.lastUpdated}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="dataTables_paginate paging_simple_numbers"
                     id="dataTable_paginate">
                    <ul class="pagination">
                        <g:paginate params="[id: user.id]" total="${anncount ?: 0}"/>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
