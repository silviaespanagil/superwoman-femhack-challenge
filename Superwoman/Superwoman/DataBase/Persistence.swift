//
//  Persistence.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation

protocol Persistence {
    
    // Save stakeholder to DB
    func saveStakeholder(stakeholder: Stakeholder)
    
    // Stakeholder exist in DB
//    func existStakeholder(stakeholder: Stakeholder) -> Bool
}
