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


<div id="edit-annonce" class="content scaffold-edit" role="main" style="width: 58%;">
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
    <div class="card shadow mb-2" >
        <div class="card-body">
            <g:uploadForm controller="annonce" action="update" id="${annonce.id}">
                <g:hiddenField name="version" value="${this.annonce?.version}"/>
                <fieldset class="form">
                    <div class="col-lg-12 fieldcontain fieldcontainedit required">
                        <label for="title">Title<span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="title" value="${annonce.title}" required="" id="title">
                    </div>
                    <div class="col-lg-12 fieldcontain fieldcontainedit required">
                        <label for="description">Description
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="description" value="${annonce.description}" required=""
                               id="description">
                    </div>

                    <div class="col-lg-12 fieldcontain fieldcontainedit required">
                        <label for="price">Price
                            <span class="required-indicator">*</span>
                        </label><input type="number decimal" name="price" value="${annonce.price}" required="" min="0.0" id="price">
                    </div>
                    <div class="col-lg-12 fieldcontain">
                        <label for="file">Upload</label>
                        <input style="display: inline ;height: 100%;" type="file" name="file" id="file"/>
                    </div>

                    <div class="col-lg-12 fieldcontain fieldcontainedit required">
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

                    <div class="col-lg-12 fieldcontainedit" style="margin-top: 15px;margin-bottom: 26px;">
                        <label for="illustrations">Illustrations</label>
                        <div style="display: flex;flex-wrap: wrap">
                            <g:each in="${annonce.illustrations}" var="illustration">
                                <div id="${illustration.id}" style="margin-right: 15px;" >
                                    <img class="miniature" src="${baseUrl + illustration.filename}" />
                                    <asset:image onClick="test(${illustration.id})" src="remove.png" width="20" class="icondel"></asset:image>
                                </div>
                            </g:each>
                        </div>

                    </div>
                    <input id="deleteIllustration" name="deleteIllustration" type="hidden" value="" />
                        <button  type="submit"  class="btn btn-success btn-icon-split" style="height: 50px;width: 70%;margin: auto;display: block;">
                            <span class="text">Update</span>
                        </button>
                </fieldset>

            </g:uploadForm>
        </div>
    </div>

</div>
</body>
</html>
