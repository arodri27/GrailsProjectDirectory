<%@ page import="grailsprojectdirectory.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyName', 'error')} ">
	<label for="companyName">
		<g:message code="company.companyName.label" default="Company Name" />
		
	</label>
	<g:textField name="companyName" value="${companyInstance?.companyName}"/>
</div>

