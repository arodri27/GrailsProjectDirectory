import grailsprojectdirectory.Role
import grailsprojectdirectory.User
import grailsprojectdirectory.UserRole
import grailsprojectdirectory.Company


class BootStrap {

    def init = { servletContext ->
				
		//create two companies
		def company1 = new Company(companyName: 'LCM').save(flush: true)
		def company2 = new Company(companyName: 'testCompany').save(flush: true)
		
		//create two roles (admin and user)
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
		
		//create two users
		def admin = new User(username: 'admin', password: 'password', userCompany: company1, enabled:true)
		admin.save(flush: true)
		def sampleUser = new User(username: 'sampleUser', password: 'password', userCompany: company2, enabled:true)
		sampleUser.save(flush: true)
		
		//link the role and the users together
		UserRole.create admin, adminRole, true
		UserRole.create sampleUser, userRole, true
		
		
    }
    def destroy = {
    }
}
