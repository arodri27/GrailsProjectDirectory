package grailsprojectdirectory

class Location {
	
	String locationName
	String address
	
	static belongsTo = [locationCompany: Company]
	
    static constraints = {
		locationName unique:true, blank:false
		address blank:false
		locationCompany blank:false
    }
	String toString() {
		"$locationName"
	}
	
}