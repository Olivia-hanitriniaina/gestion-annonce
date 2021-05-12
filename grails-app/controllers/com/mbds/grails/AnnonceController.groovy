package com.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_MODO'])
class AnnonceController {

    AnnonceService annonceService
    @Secured(['ROLE_ADMIN','ROLE_MODO'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model:[
                annonceCount: annonceService.count(),
                userList: User.list(),
                baseUrl: grailsApplication.config.annonces.illustrations.url
        ]
    }
    def indexuser(Integer max,Integer id) {
        def annonces=Annonce.findAllByAuthor(User.findById(id),[max: max,offset: 10])
        respond annonces
    }

    @Secured(['ROLE_ADMIN','ROLE_MODO'])
    def show(Long id) {
        respond annonceService.get(id)
    }
    @Secured('ROLE_ADMIN')
    def create() {
        respond new Annonce(params),model: [userList: User.list()]
    }
    @Secured('ROLE_ADMIN')
    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }
        def f = request.getFile('file')

        if (!f.empty) {

            def filen = f.originalFilename
            def path = 'O:\\' + filen
            def illu=new Illustration(
                    filename: filen
            )
            f.transferTo(new File(path))
            annonce.addToIllustrations(illu)
        }
        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }


    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond annonceService.get(id), model: [userList: User.list(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }
    @Secured('ROLE_ADMIN')
    def update() {
        def annonce = Annonce.get(params.id)

        if(params.deleteIllustration) {
            def idsIllustration = params.deleteIllustration.split(',')
            idsIllustration.each {
                def illustration = Illustration.get(it)
                annonce.removeFromIllustrations(illustration)
            }
        }
        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Double.parseDouble(params.price)

//        annonce.author = User.get(params.author.id)
        if (annonce == null) {
            notFound()
            return
        }

        def f = request.getFile('file')
       // def image = annonce.illustrations.find { it.filename == "whatever" }
        if (!f.empty) {

            def filen = f.originalFilename
            def path = 'D:\\ITU\\M2\\Galli\\grails-itu-mbds-groupe-4\\grails-app\\assets\\images\\' + filen
            def illu=new Illustration(
                    filename: filen
            )
            f.transferTo(new File(path))
            annonce.addToIllustrations(illu)
        }
        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }
    @Secured('ROLE_ADMIN')
    def editImage() {
        def annonce = params.id
        def image= params.idimage
//        annonce.author = User.get(params.author.id)
        if (annonce == null) {
            notFound()
            return
        }
        /**
         * 1. Récupérer le fichier dans la requête
         * 2. Sauvegarder le fichier localement
         * 3. Créer un illustration sur le fichier que vous avez sauvegardé
         * 4. Attacher l'illustration nouvellement créée à l'annonce
         */

        try {
            System.out.println(image)
            //annonceService.save(annonce)
        } catch (ValidationException e) {
           // respond annonce.errors, view:'edit'
            return
        }
    }
    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
