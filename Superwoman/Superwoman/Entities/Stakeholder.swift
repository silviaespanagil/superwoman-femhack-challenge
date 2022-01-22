//
//  Stakeholder.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation

struct Stakeholder: Identifiable {

    let id: Int
    let fullName: String
    let email: String
    let website: String
    let fundedProjects: [FundedProject]
    let fundedAmount: Int
    
    func getFundedProject() -> String {
        
        var result = ""
        
        for project in fundedProjects {
            
            result = "\(result), \(project.name)"
        }
        
        if fundedProjects.count > 0 {
        
            result.remove(at: result.startIndex)
            result.remove(at: result.startIndex)
        }
        
        return result
    }
}
