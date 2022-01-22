//
//  AddStakeholderViewModel.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation

class AddStakeholderViewModel: ObservableObject {
    
    // Form variables
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var website: String = ""
    @Published var fundedProjects: [String] = [""]
    @Published var amountFunded: String = ""
    @Published var presentAlert = false
    
    var saved = false
    
    // View values
    let fullnameLabel = "Stakeholder fullname"
    let emailLabel = "stakeholder@email.com"
    let websiteLabel = "https://www.stakeholderwebsite.com/"
    
    // Stakeholders array
    var Stakeholders: [Stakeholder] = []
    
    func saveStakeholder() {
        
        if isValidEmailAddress(email: email) {
            
            presentAlert = false
            Stakeholders.append(Stakeholder(id: UUID(), fullName: fullName, email: email, website: website, fundedProjects: fundedProjects, fundedAmount: Int(amountFunded)!))
            
            saved = true
            cleanValues()
        } else {
            
            presentAlert = true
        }
    }
    
    func cleanValues() {
        
        fullName = ""
        email = ""
        website = ""
        fundedProjects = [""]
        amountFunded = ""
    }
    
    var formIsEmpty: Bool {
        
        fullName.isEmpty || email.isEmpty || website.isEmpty || fundedProjects.isEmpty || amountFunded.isEmpty
    }
    
    func isValidEmailAddress(email: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch _ as NSError {
            print("invalid")
            returnValue = false
        }
        
        return  returnValue
    }
}
