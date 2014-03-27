package grailsprojectdirectory

class Report {
	
	String reportName
	Date publicationDate
	String filename
	
	static belongsTo = [reportLocation: Location]

    static constraints = {
		reportName unique:true, blank:false
		publicationDate blank:false
		filename blank:false
		reportLocation blank:false
    }
	
	String toString() {
		"$reportName $publicationDate $filename $reportLocation"
	}
	
}
