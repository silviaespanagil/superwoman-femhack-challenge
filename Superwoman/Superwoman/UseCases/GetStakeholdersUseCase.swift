//
//  GetStakeholdersUseCase.swift
//  Superwoman
//
//  Created by Silvia España on 16/2/22.
//

import Foundation

class GetStakeholdersUseCase {
    
    private let repository: StakeholderRepository
    
    init(repository: StakeholderRepository = StakeholderRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> [Stakeholder] {
        
        repository.getStakeholders()
    }
}
