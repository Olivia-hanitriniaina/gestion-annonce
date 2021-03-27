<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="show-annonce" class="content scaffold-show" role="main">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"><g:message code="default.show.label" args="[entityName]" /></h6>
        </div>
    </div>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="card shadow mb-2">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th class="sortable"><a href="#">Title</a>
                        </th>
                        <th class="sortable"><a href="#">Description</a></th>
                        <th class="sortable"><a href="#">Price</a>
                        </th>
                        <th class="sortable"><a
                                href="#">Illustrations</a>
                        </th>
                        <th class="sortable"><a href="#">Author</a>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr class="even">
                            <td>${annonce.title}</td>
                            <td>${annonce.description}</td>
                            <td>${annonce.price}</td>
                            <td>
                                <g:each in="${annonce.illustrations}" var="illustration">
                                    <asset:image src="${illustration.filename}"></asset:image>
                                </g:each>
                            </td>
                            <td>
                                <a href="/projet/user/show/${annonce.id}">${annonce.author}</a>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <g:form resource="${this.annonce}" method="DELETE">
                            <fieldset class="buttons">
                                <g:link class="edit" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
