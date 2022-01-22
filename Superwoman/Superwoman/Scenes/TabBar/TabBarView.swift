//
//  TabBarView.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

struct TabBarView: View {
    
    @State var activeTab: TabNames = TabNames.dashboard
    @Environment(\.colorScheme) var currentMode
    
    init() {
        
        tabBarAppearance()
    }
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            
//Dashboard
            AddStakeholderView(viewModel: AddStakeholderViewModel())
                .tabItem {
                    Image(systemName: "folder.badge.person.crop")
                    Text("Add stakeholder")
                }
                .tag(TabNames.stakeholders)
            
            AddProjectView(viewModel: AddProjectViewModel())
                .tabItem {
                    Image(systemName: "plus.rectangle.on.folder")
                    Text("Add project")
                }
                .tag(TabNames.projects)
        }
        .navigationTitle(getNavBarTitle(for: activeTab))
        .navigationBarTitleDisplayMode(.large)
        .accentColor(Color.peach)
        
    }
    
    func getNavBarTitle(for tabItemType: TabNames) -> String {
        
        switch tabItemType {
        case .dashboard:
            return "Dashboard"
        case .stakeholders:
            return "Add new stakeholders"
        case .projects:
            return "Add new projects"
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
