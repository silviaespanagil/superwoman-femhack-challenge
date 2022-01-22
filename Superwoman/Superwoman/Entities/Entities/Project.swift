//
//  Project.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation

struct Project: Identifiable {

    let id: UUID
    let projectName: String
    let website: String
    let description: String
    let image: String
    let budget: Double
    let closindDate: Date
}
