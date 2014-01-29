<%@ page import="gjvm.BlogPost" %>



<div class="fieldcontain ${hasErrors(bean: blogPostInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="blogPost.title.label" default="Title" />
		
	</label>
	<g:textField name="title" maxlength="10" value="${blogPostInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogPostInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="blogPost.text.label" default="Text" />
		
	</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="5000" value="${blogPostInstance?.text}"/>
</div>

