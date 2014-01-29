
<%@ page import="gjvm.BlogPost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogPost.label', default: 'BlogPost')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blogPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blogPost" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'blogPost.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'blogPost.text.label', default: 'Text')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'blogPost.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'blogPost.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blogPostInstanceList}" status="i" var="blogPostInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${blogPostInstance.id}">${fieldValue(bean: blogPostInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: blogPostInstance, field: "text")}</td>
					
						<td><g:formatDate date="${blogPostInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${blogPostInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blogPostInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
