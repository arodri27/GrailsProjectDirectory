<%@page import="grailsprojectdirectory.Location"%>
<head>
	<meta name="layout" content="main">
</head>

<body>
	<g:if test='${flash.message}'>
		<div class='errors'>${flash.message}</div>
	</g:if>
	
	<div class="nav">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		</ul>
	</div>
	<div class="form-group upload-report">
	<h1>Upload PDF!</h1>
	<g:uploadForm action="upload" autocomplete='off'>
	
		<label for="exampleInputEmail1">Report name</label>
		<input class="form-control" placeholder="Report name" name="reportName" type="text" />
		<br />
		<label for="exampleInputFile">Upload a report</label>
		<input type="file" name="reportFile" /><br />
		<p class="help-block">Report must be in .pdf format</p>
		<br />
		<label for="exampleInputEmail1">Select a location</label>
		<g:select name="reportLocation" from="${Location.list()}"/>
		<br />
		<br />
		<button type="submit" class="btn btn-primary">Submit</button>
	</g:uploadForm>
	</div>
	
</body>