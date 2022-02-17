//
//  SaveStakeholderUseCase.swift
//  Superwoman
//
//  Created by Silvia España on 16/2/22.
//

import Foundation

class SaveStakeholderUseCase {
    
    private let repository: StakeholderRepository
    
    init(repository: StakeholderRepository = StakeholderRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(stakeholder: Stakeholder) {
        
        repository.saveStakeholder(stakeholder: stakeholder)
    }
}
