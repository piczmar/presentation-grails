package gjvm



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON;
import grails.transaction.Transactional
@Transactional(readOnly = true)
class BlogPostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	def helloService
	
	def hello(){
		render helloService.hello()
	}
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
        respond BlogPost.list(params), model:[blogPostInstanceCount: BlogPost.count()]
    }

    def indexAjax(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def result = BlogPost.list(params)
		def size = BlogPost.count()
		request.withFormat {
            form {
                respond result, model:[blogPostInstanceCount: size]
            }
			json{
				render text: result as JSON, contentType: 'text/json', status: 200
			}
            '*' { respond blogPostInstance, [status: CREATED] }
        }
        
    }

	def my(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def result = BlogPost.withCriteria{
			eq('author',springSecurityService.currentUser)
		}
		render text: result as JSON, contentType: 'text/json', status: 200
		//respond result, model:[blogPostInstanceCount: result.size()]
	}
	
	def search(){
		def query = params.q
		// **** dynamic finders ****
		//def result = BlogPost.findAllByTitleLike('%'+query+'%')
		
		// **** where queries ****
/*
		def result = BlogPost.where{
			title ==~ '%'+query+'%'	
		}.findAll()
*/
		// **** with projections ****
/*
		def c = BlogPost.createCriteria()
		def count = c.get {
			projections {
				countDistinct('title')
			}
			like('title','%'+query+'%')
			
		}
		def result = [count: count]
*/
		// **** HQL ****
		def result = BlogPost.findAll("from BlogPost as b where b.title like ?", ["%"+query+"%"])

		
		render text: result as JSON, contentType:'text/json', status: 200
	}
	
    def show(BlogPost blogPostInstance) {
        respond blogPostInstance
    }

    def create() {
        respond new BlogPost(params)
    }

    @Transactional
    def save(BlogPost blogPostInstance) {
        if (blogPostInstance == null) {
            notFound()
            return
        }
		def other = new BlogPost(blogPostInstance.properties)
		other.setAuthor(springSecurityService.currentUser)
		
        if (other.hasErrors()) {
            respond other.errors, view:'create'
			println "errors : " + other.errors
            return
        }

        other.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'blogPostInstance.label', default: 'BlogPost'), blogPostInstance.id])
                redirect other
            }
            '*' { respond blogPostInstance, [status: CREATED] }
        }
    }


    def edit(BlogPost blogPostInstance) {
		if(blogPostInstance.author != SpringSecurityService.currentUser){
			throw Error("You can only edit your posts")
		}
        respond blogPostInstance
    }

    @Transactional
    def update(BlogPost blogPostInstance) {
        if (blogPostInstance == null) {
            notFound()
            return
        }

        if (blogPostInstance.hasErrors()) {
            respond blogPostInstance.errors, view:'edit'
            return
        }

        blogPostInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BlogPost.label', default: 'BlogPost'), blogPostInstance.id])
                redirect blogPostInstance
            }
            '*'{ respond blogPostInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BlogPost blogPostInstance) {

        if (blogPostInstance == null) {
            notFound()
            return
        }

        blogPostInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BlogPost.label', default: 'BlogPost'), blogPostInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blogPostInstance.label', default: 'BlogPost'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
