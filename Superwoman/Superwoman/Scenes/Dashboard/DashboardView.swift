//
//  DashboardView.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var viewModel: DashboardViewModel
    
    var body: some View {
        
        VStack {
            
            Text("Welcome to your dashboard")
                .font(.title)
                .foregroundColor(Color.peach)
            
            LazyVGrid(columns: viewModel.columns, spacing: viewModel.spacing) {
                
                DashboardItem(text: "Funded projects", value: "")
                DashboardItem(text: "Total of stakeholders", value: String(viewModel.stakeholders.count))
                DashboardItem(text: "Money raised", value: "")
                DashboardItem(text: "Average funds", value: "")
            }
     
        }.padding(.horizontal)
            .onAppear {
                
                viewModel.getStakeholders()
            }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel())
    }
}
