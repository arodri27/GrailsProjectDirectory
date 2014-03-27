package grailsprojectdirectory

import grailsprojectdirectory.Location
import groovy.time.TimeCategory
import grails.plugins.springsecurity.SpringSecurityService
import grails.plugins.springsecurity.Secured

class UploadController {
	
	def springSecurityService
		
    def index () {
		if (springSecurityService.currentUser) {
			if (springSecurityService.currentUser.userCompany.toString() != 'LCM'){
				redirect(action:"list")
			}
			else {
				redirect(action:"show")
			}
		}
		else {
			redirect(controller:"login", action:"auth")
		}
	}
	
	@Secured(['ROLE_ADMIN'])
	def show () {
	}
	
	@Secured(['ROLE_ADMIN'])
	def upload() {
		
		Location repLoc = Location.find { locationName == params.reportLocation }
			
		params.publicationDate = new Date()
		params.reportLocation = repLoc
		params.filename = "Report " + params.reportName
			
		def f = request.getFile("reportFile")
		def nameOfFile = f.getOriginalFilename()
		def cursor = nameOfFile.lastIndexOf(".")
		def extension = nameOfFile.substring(cursor + 1)
		
		if (!params.reportName || !params.publicationDate || !params.filename || !params.reportLocation || f.empty || extension!="pdf"){
			flash.message = "An error occurred. Please, fill in all the fields and upload a valid PDF file"
			redirect (action:"show", params:params)
		}		
		else {
			def reportToSave = new Report(params)
			reportToSave.save(flush:true, failOnError:true)
			f.transferTo(new File("./Reports/" + params.filename + ".pdf"))
			redirect(action: "list", params:params)
		}
					
	}
	
	@Secured(['ROLE_ADMIN','ROLE_USER'])
	def list(Integer max) {
		def now = new Date()
		def aYearAgo
		use (TimeCategory) {
			aYearAgo = now - 1.year
		}
		
		def userLoggedIn = springSecurityService.currentUser
		
		def theCompany = Company.find { companyName == userLoggedIn.userCompany.toString() }
				
		def allLocations = Location.findAll { locationCompany == theCompany }
		
		def reportCompany = []
		
		for (i in allLocations) {
			reportCompany += Report.findAll { (reportLocation == i) && (publicationDate > aYearAgo) }
		}
		
		def provisionalList = []
		def orderedList = []
		def buffer
		
		if (reportCompany){
			reportCompany.groupBy{it.reportLocation}
			buffer = reportCompany[0].reportLocation
			for (i in reportCompany){
				if (i.reportLocation == buffer) {
					provisionalList += i
				}
				else {
					provisionalList.sort{it.publicationDate}.reverse(true)
					orderedList += provisionalList
					provisionalList = []
					provisionalList += i
				}
				buffer = i.reportLocation
			}
			provisionalList.sort{it.publicationDate}.reverse(true)
			orderedList += provisionalList
		}
		
		params.max = Math.min(max ?: 10, 100)
		[reportInstanceList: orderedList, reportInstanceTotal: reportCompany.size()]
	}
	
	def download(String id) {
		
		def iwannadownload = id + ".pdf"
		
		def fileToDownload = "./Reports/Report " + iwannadownload
  
		if (fileToDownload){
			File myReport = new File(fileToDownload)
			response.setContentType("application/octet-stream")
			response.setHeader("Content-disposition", "attachment;filename=${iwannadownload}")
			response.outputStream << myReport.newInputStream()
	   }else{
		   println "This doesn't work!"
	   }
  
	 }
	
}
