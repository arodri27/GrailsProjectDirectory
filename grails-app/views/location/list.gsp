
<%@ page import="grailsprojectdirectory.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-location" class="content scaffold-list">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'location.address.label', default: 'Address')}" />
					
						<th><g:message code="location.locationCompany.label" default="Location Company" /></th>
					
						<g:sortableColumn property="locationName" title="${message(code: 'location.locationName.label', default: 'Location Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationInstanceList}" status="i" var="locationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" class="btn btn-primary" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: locationInstance, field: "locationCompany")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "locationName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${locationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
