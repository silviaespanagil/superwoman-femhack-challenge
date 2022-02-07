//
//  DBFundedProject.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation

extension DBFundedProject {
    
    func convertToEntity() -> FundedProject {
        
        return FundedProject(id: UUID(),
                             name: name ?? "")
    }
}
