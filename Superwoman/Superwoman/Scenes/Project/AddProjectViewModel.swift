//
//  AddProjectViewModel.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation
import SwiftUI

class AddProjectViewModel: ObservableObject {
    
    // Form variables
    @Published var projectName: String = ""
    @Published var website: String = ""
    @Published var description: String = ""
    @Published var image: Image?
    @Published var budget: String = ""
    @Published var closingDate: Date = Date()
    @Published var presentAlert = false
    
    // Method variables
    @Published  var inputImage: UIImage?
    
    
    // View values
    let headerInfo = "Project infomation"
    let projectNameLabel = "Project name"
    let websiteLabel = "www.projectwebsite.com"
    let descriptionLabel = "Project description"
    let budgetLabel = "Project budget. Ej: 250.4"
    let dateLabel = "Closing date"
    let imageLabel = "Tap to load an image"
    let imageLoadedLabel = "Image loaded"
    
    let saveButtonLabel = "Save"
    let cancelButtonLabel = "Cancel"
    
    let saveSystemName = "person.crop.circle.badge.checkmark"
    let cancelSystemName = "person.crop.circle.badge.exclamationmark"
    
    let alertTitle = "Project is not valid"
    let alertText = "Please check the websote is right and that the budget is a valid number"
    let alertDismiss = "Close"
    
    // Project array
    var projects: [Project] = []
    
    func saveProject() {
        
        if isValidAmount(amount: budget) && isValidWebsite(website: website) {
    
            presentAlert = false
            projects.append(Project(id: UUID(), projectName: projectName, website: website, description: description, image: inputImage ?? UIImage(imageLiteralResourceName: ""), budget: Double(budget)!, closindDate: closingDate))
            
            cleanValues()
        } else {
            
            presentAlert = true
        }
    }
    
    func cleanValues() {
        
        projectName = ""
        website = ""
        description = ""
        image = nil
        budget = ""
        closingDate = Date()
    }
    
    func loadImage() {
        
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)

    }
    
    var formIsEmpty: Bool {
        
        projectName.isEmpty || website.isEmpty || description.isEmpty || image == nil || budget.isEmpty
    }
    
    func isValidWebsite(website: String) -> Bool {
        
        var returnValue = true
        let websiteRegEx = "[w]{3}+[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: websiteRegEx)
            let nsString = website as NSString
            let results = regex.matches(in: website, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch _ as NSError {
            print("invalid")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func isValidAmount(amount: String) -> Bool {
        
        var returnValue = true
        let budgetRegex = "^[0-9.]{1,10}$"
        
        do {
            let regex = try NSRegularExpression(pattern: budgetRegex)
            let nsString = budget as NSString
            let results = regex.matches(in: budget, range: NSRange(location: 0, length: nsString.length))
            
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
