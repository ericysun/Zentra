//
//  ZentraApp.swift
//  Zentra
//  An open source meditation app. No Paywalls. No Fees.
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI

@main
struct ZentraApp: App {
    init() {
        // Configure navigation bar appearance globally
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
