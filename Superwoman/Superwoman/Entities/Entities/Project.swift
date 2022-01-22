//
//  Project.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation
import UIKit

struct Project: Identifiable {

    let id: UUID
    let projectName: String
    let website: String
    let description: String
    let image: UIImage
    let budget: Double
    let closindDate: Date
}
