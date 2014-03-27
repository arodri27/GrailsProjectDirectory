<%@ page import="grailsprojectdirectory.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div class="form-group upload-report">
		<div id="create-location" class="content scaffold-create">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${locationInstance}">
			<ul class="errors">
				<g:eachError bean="${locationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save"  autocomplete='off'>
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<br />
<%--				<fieldset class="buttons">--%>
					<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
<%--				</fieldset>--%>
			</g:form>
		</div>
		</div>
	</body>
</html>
