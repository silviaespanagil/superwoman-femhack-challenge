//
//  StakeholderRepositoryImplementation.swift
//  Superwoman
//
//  Created by Silvia España on 16/2/22.
//

import Foundation

class StakeholderRepositoryImplementation: StakeholderRepository {
    
    private let localDataSource: LocalStakeholderDataSource
    
    init(localDataSource: LocalStakeholderDataSource = LocalStakeholderDataSource()) {
        
        self.localDataSource = localDataSource
    }
    
    func saveStakeholder(stakeholder: Stakeholder) {
        
        return localDataSource.saveStakeholder(stakeholder: stakeholder)
    }
    
    func getStakeholders() -> [Stakeholder] {
        
        return localDataSource.getStakeholders()
    }
}
