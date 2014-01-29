class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
		
		'/mvc/test/test'(view: '/mvc/test.dispatch')

		"/blog"(view:'/blog/wall')
	}
}
