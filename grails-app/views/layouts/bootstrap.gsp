<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<g:layoutHead />
<g:javascript library="bootstrap" />
<r:layoutResources />
</head>
<body>

	<div class="container">

      <div class="masthead">
        <h3 class="text-muted">${grailsApplication.config.appName}</h3>
        <ul class="nav nav-justified">
          <li class="active"><g:link uri="/">Home</g:link></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </div>

<sec:ifLoggedIn>
		<sec:loggedInUserInfo field="username" />
		<g:link controller='logout'>Logout</g:link>
	</sec:ifLoggedIn>



	<sec:ifNotLoggedIn>
		<g:link controller='login'>Login</g:link>
	</sec:ifNotLoggedIn>
      <!-- Jumbotron -->
      <div class="jumbotron">
        <h1>Grails Demo Blog</h1>
        <p class="lead">This is to present what you can do with Grails and Twitter BootStrap 3</p>
        <p><a class="btn btn-lg btn-success" href="#" role="button">Get started today</a></p>
      </div>


	


	<g:layoutBody />

		<!-- Site footer -->
      <div class="footer">
        <p>&copy; Company 2013</p>
      </div>

    </div> <!-- /container -->
	<r:layoutResources />
</body>
</html>
