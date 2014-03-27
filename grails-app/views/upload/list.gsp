<%@ page import="grailsprojectdirectory.Report" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-report" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="show"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-report" class="content scaffold-list">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="reportName" title="${message(code: 'report.reportName.label', default: 'Report Name')}" />
					
						<th><g:message code="report.reportLocation.label" default="Company" /></th>
						
						<th><g:message code="report.reportLocation.label" default="Location" /></th>
					
						<g:sortableColumn property="publicationDate" title="${message(code: 'report.publicationDate.label', default: 'Publication Date')}" />
						
						<th>Download</th>
					
											
					</tr>
				</thead>
				<tbody>
				<g:each in="${reportInstanceList}" status="i" var="reportInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<td>${fieldValue(bean: reportInstance, field: "reportName")}</td>
					
						<td>${fieldValue(bean: reportInstance, field: "reportLocation.locationCompany")}</td>
						
						<td>${fieldValue(bean: reportInstance, field: "reportLocation")}</td>
					
						<td><g:formatDate date="${reportInstance.publicationDate}" /></td>
						
						<td><g:link class="btn btn-primary btn-sm" action="download" id="${fieldValue(bean: reportInstance, field: "reportName")}">Download</g:link></td>
													
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${reportInstanceTotal == 0}">
				<h4>There are no currently reports available</h4>
			</g:if>
			<div class="pagination">
				<g:paginate total="${reportInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
