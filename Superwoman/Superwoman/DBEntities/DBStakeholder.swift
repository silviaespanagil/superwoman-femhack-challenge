//
//  DBStakeholder.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//
//
import Foundation
import CoreData

extension DBStakeholder {
    
    func convertToEntity() -> Stakeholder {
        
        var fundProj: [FundedProject] = []
        
        if let fundedProjects = fundedProject?.allObjects as? [DBFundedProject] {
            fundProj = fundedProjects.map({ $0.convertToEntity()})
        }
        if let fundedProjects = fundedProject, let dbFundedProjects = fundedProjects.allObjects as? [DBFundedProject] {

            fundProj = dbFundedProjects.map({ $0.convertToEntity()})
        }
        
        return Stakeholder(id: UUID(),
                           fullName: fullName ?? "",
                           email: email ?? "",
                           website: website ?? "",
                           fundedProjects: fundProj,
                           fundedAmount: Double(fundedAmount))
    }
}
