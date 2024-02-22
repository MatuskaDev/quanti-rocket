//
//  ContentView.swift
//  Rocket
//
//  Created by Lukáš Matuška on 22.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(asset: Asset.rocketIdle)
            Text("Rocket!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
