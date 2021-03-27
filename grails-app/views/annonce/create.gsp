<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>


<div id="create-annonce" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.annonce}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Basic Form Elements
                </div>

                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <g:uploadForm controller="annonce" action="save" method="POST">
                                <fieldset class="form">
                                    <f:all bean="annonce" except="illustrations,author"/>
                                </fieldset>

                                <div class="fieldcontain">
                                    <label for="file">Upload</label>
                                    <input style="display: inline" type="file" name="file" id="file"/>
                                </div>
                                <div class="fieldcontain required">
                                    <label for="author">Author
                                        <span class="required-indicator">*</span>
                                    </label>
                                    <g:select name="author.id" from="${userList}" optionKey="id" optionValue="username" />
                                </div>
                                <a href="#" class="btn btn-success btn-icon-split">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-check"></i>
                                    </span>
                                    <span class="text">Split Button Success</span>
                                </a>
                                <fieldset class="buttons">
                                    <g:submitButton class="btn btn-success btn-icon-split" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                                </fieldset>
                            </g:uploadForm>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

