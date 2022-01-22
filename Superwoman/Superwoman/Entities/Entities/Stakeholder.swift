//
//  Stakeholder.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation

struct Stakeholder: Identifiable {

    let id: UUID
    let fullName: String
    let email: String
    let website: String
    let fundedProjects: [String]
    let fundedAmount: Int
}
