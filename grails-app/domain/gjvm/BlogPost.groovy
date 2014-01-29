package gjvm

import org.grails.datastore.gorm.events.AutoTimestampEventListener;

class BlogPost {
	String title
	String text
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [author: User]
	
    static constraints = {
		title unique: true, maxSize: 10
		text size: 1..5000 
    }
	static mapping = {
		autoTimestamp true
		table 'posts'
		title column: 'ttl'
	}
	
	def beforeCreate(){
		println 'creating new BlogPost'
	}
}
