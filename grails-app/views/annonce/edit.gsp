<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div id="edit-annonce" class="content scaffold-edit" role="main">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"><g:message code="default.edit.label" args="[entityName]"/></h6>
        </div>
    </div>
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
    <div class="card shadow mb-2">
        <div class="card-body">
            <g:uploadForm controller="annonce" action="update" id="${annonce.id}">
                <g:hiddenField name="version" value="${this.annonce?.version}"/>
                <fieldset class="form">
                    <div class="col-lg-6 fieldcontain required">
                        <label for="title">Title<span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="title" value="${annonce.title}" required="" id="title">
                    </div>
                    <div class="col-lg-6 fieldcontain required">
                        <label for="description">Description
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="description" value="${annonce.description}" required=""
                               id="description">
                    </div>

                    <div class="col-lg-6 fieldcontain required">
                        <label for="price">Price
                            <span class="required-indicator">*</span>
                        </label><input type="number decimal" name="price" value="${annonce.price}" required="" min="0.0" id="price">
                    </div>
                    <div class="col-lg-6 fieldcontain">
                        <label for="file">Upload</label>
                        <input style="display: inline" type="file" name="file" id="file"/>
                    </div>

                    <div class="col-lg-12 fieldcontain required">
                        <label for="author">Author
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select name="author.id" from="${userList}" optionKey="id" optionValue="username" />
                    </div>
                    <script>
                        function test(id){
                            document.getElementById(id).style.visibility = "hidden";

                            var deleteIllustration = document.getElementById("deleteIllustration").value
                            deleteIllustration+=id+","
                            document.getElementById("deleteIllustration").value = deleteIllustration
                            console.log(document.getElementById("deleteIllustration").value)
                        }
                    </script>

                    <div class="col-lg-12 fieldcontain">
                        <label for="illustrations">Illustrations</label>
                        <g:each in="${annonce.illustrations}" var="illustration">
                            <div style="display: inline-block" id="${illustration.id}" >
                                <img src="${baseUrl + illustration.filename}" />
                                <asset:image onClick="test(${illustration.id})" src="remove.png" width="20"></asset:image>
                            </div>
                        </g:each>
                    </div>
                    <input id="deleteIllustration" name="deleteIllustration" type="hidden" value="" />
                </fieldset>
                <br>
                    <button  type="submit" class="class="btn btn-primary btn-icon-split align-items-lg-cente"
                         <span class="text">update</span>
                    </button>

            </g:uploadForm>
        </div>
    </div>

</div>
</body>
</html>