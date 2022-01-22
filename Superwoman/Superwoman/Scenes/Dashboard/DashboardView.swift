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
         
            Text("Soon you will be able to see all this information here")
                .font(.footnote)
                .foregroundColor(Color.darkBlue)
            
            LazyVGrid(columns: viewModel.columns, spacing: viewModel.spacing) {
                
                DashboardItem(text: "Funded projects")
                DashboardItem(text: "Total of stakeholders")
                DashboardItem(text: "Money raised")
                DashboardItem(text: "Average funds")
            }
     
        }.padding(.horizontal)
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel())
    }
}
