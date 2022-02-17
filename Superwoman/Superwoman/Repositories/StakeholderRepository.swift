//
//  StakeholderRepository.swift
//  Superwoman
//
//  Created by Silvia España on 16/2/22.
//

import Foundation
import Combine

protocol StakeholderRepository {
    
    func saveStakeholder(stakeholder: Stakeholder)
    func getStakeholders() -> [Stakeholder]
}
