package com.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.HttpServletResponse

@Secured('ROLE_ADMIN')
class ApiController {

//    GET / PUT / PATCH / DELETE
//    url : localhost:8081/projet/api/annonce(s)/{id}
    def annonce() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
//                response.withFormat {
//                    xml { render annonceInstance as XML }
//                    json { render annonceInstance as JSON }
//                }
                serializeData(annonceInstance, request.getHeader("Accept"))
                break
            case "PUT":
                break
            case "PATCH":
                break
            case "DELETE":
                break
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST
    def annonces() {

    }

//    GET / PUT / PATCH / DELETE
    def user() {

    }

//    GET / POST
    def users() {

    }

    def serializeData(object, format)
    {
        switch (format)
        {
            case 'json':
            case 'application/json':
            case 'text/json':
                render object as JSON
                break
            case 'xml':
            case 'application/xml':
            case 'text/xml':
                render object as XML
                break
        }
    }
}
