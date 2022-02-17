//
//  DashboardViewModel.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    
    @Published public private(set) var stakeholders: [Stakeholder] = []
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    let spacing: CGFloat = 20
    
    func getStakeholders() {
        
        stakeholders = GetStakeholdersUseCase().execute()
    }
    
}
