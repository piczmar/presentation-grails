import gjvm.BlogPost
import gjvm.User
import gjvm.Role
import gjvm.UserRole
import grails.converters.JSON

class BootStrap {

	def init = { servletContext ->
		
		JSON.registerObjectMarshaller(BlogPost) {
			def returnArray = [:]
			returnArray['title'] = it.title
			returnArray['text'] = it.text
			returnArray['author'] = it.author.id
			return returnArray
		}
		
		environments { 
			development {
				def u1 = new User(username: 'user1', password: 'user1').save(flush:true, failOnError:true)
				def u2 = new User(username: 'user2', password: 'user2').save(flush:true, failOnError:true)
				def role = new Role(authority: "ROLE_USER").save(flush:true, failOnError:true)
				UserRole.create(u1, role, true)
				UserRole.create(u2, role, true)
				
				(1..10).each {
					if(it<5)
						new BlogPost(author: u1, title: "title${it}", text: "some demo blog message ${it}").save(flush: true, failOnError: true)
					else
						new BlogPost(author: u2, title: "title${it}", text: "some demo blog message ${it}").save(flush: true, failOnError: true)
				}
			} 
		}
	}
	def destroy = {
	}
}
