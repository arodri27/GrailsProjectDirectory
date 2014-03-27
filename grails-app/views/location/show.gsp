
<%@ page import="grailsprojectdirectory.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-location" class="content scaffold-show">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<ol class="property-list location">
			
				<g:if test="${locationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="location.address.label" default="Address" /></span>
					
						<span class="property-value"><g:fieldValue bean="${locationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.locationCompany}">
				<li class="fieldcontain">
					<span id="locationCompany-label" class="property-label"><g:message code="location.locationCompany.label" default="Location Company" /></span>
					
						<span class="property-value"><g:link controller="company" action="show" id="${locationInstance?.locationCompany?.id}">${locationInstance?.locationCompany?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.locationName}">
				<li class="fieldcontain">
					<span id="locationName-label" class="property-label"><g:message code="location.locationName.label" default="Location Name" /></span>
					
						<span class="property-value"><g:fieldValue bean="${locationInstance}" field="locationName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
