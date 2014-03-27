package grailsprojectdirectory

class Company {
	
	String companyName
	
    static constraints = {
		companyName unique:true, blank:false
    }
	
	String toString() {
		"$companyName"
	}
	
}
