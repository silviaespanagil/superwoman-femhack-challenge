//
//  DashboardItem.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

struct DashboardItem: View {
    var text: String
    
    init(text: String) {
        
        self.text = text
    }
    
    var body: some View {
        
        VStack {
            
        Text(text)
            .padding()
            .foregroundColor(.darkBlue)
        Rectangle()
            .frame(height: 1.0, alignment: .bottom)
            .foregroundColor(Color.red)}
    }
}
