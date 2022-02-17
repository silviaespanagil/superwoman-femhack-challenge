//
//  DashboardItem.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

struct DashboardItem: View {
    var text: String
    var value: String
    
    init(text: String, value: String) {
        
        self.text = text
        self.value = value
    }
    
    var body: some View {
        
        VStack {
            
        Text(text)
            .padding()
            .foregroundColor(.darkBlue)
        Text(value)
        Rectangle()
            .frame(height: 1.0, alignment: .bottom)
            .foregroundColor(Color.red)}
    }
}
