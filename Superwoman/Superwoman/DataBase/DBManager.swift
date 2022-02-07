//
//  DBManager.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation
import CoreData

class DBManager: Persistence {

    //MARK: Properties
    
    let coreDataStack: CoreDataStack
    
    //MARK: Methods
    
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        
        self.coreDataStack = coreDataStack
    }
    
    func saveStakeholder(stakeholder: Stakeholder) {
        
        var dbFundedProjects: [DBFundedProject] = []
        for project in stakeholder.fundedProjects {
            
            let dbFundedProject = DBFundedProject(context: coreDataStack.managedContext)
            dbFundedProject.id = project.id
            dbFundedProject.name = project.name
            dbFundedProjects.append(dbFundedProject)
        }
        
        let dbStakeholder = DBStakeholder(context: coreDataStack.managedContext)
        dbStakeholder.id = stakeholder.id
        dbStakeholder.fullName = stakeholder.fullName
        dbStakeholder.email = stakeholder.email
        dbStakeholder.website = stakeholder.website
        dbStakeholder.fundedAmount = Int64(stakeholder.fundedAmount)
        
        dbStakeholder.fundedProject?.addingObjects(from: dbFundedProjects)
        
        coreDataStack.saveContext()
    }
}
