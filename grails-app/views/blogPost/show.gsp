
<%@ page import="gjvm.BlogPost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogPost.label', default: 'BlogPost')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blogPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blogPost" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blogPost">
			
				<g:if test="${blogPostInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="blogPost.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${blogPostInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogPostInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="blogPost.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${blogPostInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogPostInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="blogPost.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${blogPostInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogPostInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="blogPost.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${blogPostInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>

		<g:if test="${sec.loggedInUserInfo(field:'id') as Long == blogPostInstance.author.id as Long}">
			<g:form url="[resource:blogPostInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${blogPostInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</g:if>
	</div>
	</body>
</html>
