//
//  LocalStakeholderDataSource.swift
//  Superwoman
//
//  Created by Silvia España on 16/2/22.
//

import Foundation

class LocalStakeholderDataSource {
    
    private let dbManager: Persistence
    
    init(dbManager: Persistence = DBManager()) {
        
        self.dbManager = dbManager
    }
    
    func saveStakeholder(stakeholder: Stakeholder) {
        
        dbManager.saveStakeholder(stakeholder: stakeholder)
    }
    
    func getStakeholders() -> [Stakeholder] {
        
        dbManager.getStakeholders()
    }
}
