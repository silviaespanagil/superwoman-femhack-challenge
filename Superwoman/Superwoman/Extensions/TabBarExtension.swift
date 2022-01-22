//
//  TabBarExtension.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI

extension TabBarView {
    
    func tabBarAppearance() {
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(named:"LightBlue")
    }
}
