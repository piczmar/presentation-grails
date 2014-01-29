modules = {
    application {
        resource url:'js/application.js'
    }
	bootstrap{
		dependsOn 'jquery'
		resource url: 'bootstrap-3.0.3/dist/js/bootstrap.min.js'
		resource url: 'bootstrap-3.0.3/dist/css/bootstrap.min.css'
		resource url: 'bootstrap-3.0.3/dist/css/bootstrap-theme.min.css'
	}
}
