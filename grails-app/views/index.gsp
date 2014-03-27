<%@page import="grailsprojectdirectory.User"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to LCM</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 0.6em;
				width: 12em;
				float: left;
				text-align: center;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
				text-align: left;
				text-align: justify;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
					text-align: left;
					text-align: justify;
				}

				#page-body h1 {
					margin-top: 0;
					text-align: left;
					text-align: justify;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<sec:ifLoggedIn>
				<div id="status">
					<h2><strong>What to do</strong></h2>
					<g:set var="currentUser" value="${sec.loggedInUserInfo(field:'username')}" />
			
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<g:if test="${c.logicalPropertyName == 'company'}" >
							<g:if test="${currentUser == 'admin'}">
								<g:link class="btn btn-primary btn-block" controller="company">Add a company</g:link><br />
							</g:if>
						</g:if>
						<g:if test="${c.logicalPropertyName == 'location'}" >
							<g:if test="${currentUser == 'admin'}">
								<g:link class="btn btn-primary btn-block" controller="location">Add a location</g:link><br />
							</g:if>
						</g:if>
						<g:if test="${c.logicalPropertyName == 'upload'}" >
							<g:if test="${currentUser == 'admin'}">
								<g:link class="btn btn-primary btn-block" controller="upload">Upload a report</g:link><br />
								<g:link class="btn btn-primary btn-block" controller="upload" action="list">View your reports</g:link><br />
							</g:if>
							<g:if test="${(currentUser != 'admin')}">
								<g:link class="btn btn-primary btn-block" controller="upload">View your reports</g:link><br />
							</g:if>
						</g:if>
					</g:each>
				</div>
			</sec:ifLoggedIn>
		
		<div id="page-body">
			<h1>Welcome!</h1>
				<h2><strong>Company Overview</strong></h2>
					<p>Lambert Condition Monitoring Ltd.’s experience spans over 21 years in the industrial sector of the East Coast of both islands, covering horticultural, agricultural and manufacturing industries such as timber processing companies, cool storage companies, apple packing facilities and meat processing factories. We have found that the technology is invaluable for maintaining production and protecting client’s safety and assets. These programs can greatly minimize repair and labour costs, reduce inventory of parts, and avoid product variation and production loss.</p>
				<h2><strong>Mission Statement</strong></h2>
					<p>Lambert Condition Monitoring Ltd.’s goal is to offer the latest world technologies in predictive maintenance to aid industry to reduce production losses and assist in their productivity, quality, safety and profitability.</p>
				<h2><strong>Thermography</strong></h2>
					<p>Thermal imaging has emerged as an effective predictive maintenance technology by identifying variations that can lead to equipment failure.</p>
					<p>By using a different spectrum of light, problems that are invisible to the naked eye become clear with an image of a thermal nature. With regular inspection, issues can be highlighted before damage occurs, saving production losses and damage to plant and equipment, leaving the machinery operating in a safe condition.</p>
		</div>
	</body>
</html>
