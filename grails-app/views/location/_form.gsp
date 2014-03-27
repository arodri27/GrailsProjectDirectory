<%@ page import="grailsprojectdirectory.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="location.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${locationInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'locationCompany', 'error')} required">
	<label for="locationCompany">
		<g:message code="location.locationCompany.label" default="Location Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="locationCompany" name="locationCompany.id" from="${grailsprojectdirectory.Company.list()}" optionKey="id" required="" value="${locationInstance?.locationCompany?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'locationName', 'error')} ">
	<label for="locationName">
		<g:message code="location.locationName.label" default="Location Name" />
		
	</label>
	<g:textField name="locationName" value="${locationInstance?.locationName}"/>
</div>

