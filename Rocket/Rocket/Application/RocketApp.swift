//
//  RocketApp.swift
//  Rocket
//
//  Created by Lukáš Matuška on 22.02.2024.
//

import SwiftUI
import Resolver

@main
struct RocketApp: App {
    
    init() {
        Resolver.registerRepositories()
        Resolver.registerUseCases()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
