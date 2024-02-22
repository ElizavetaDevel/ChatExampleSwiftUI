//
//  ChatExampleSwiftUIApp.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24.
//

import SwiftUI

@main
struct ChatExampleSwiftUIApp: App {
    
    init() {
        DependencyManager.shared.registerOnAppStart()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}
