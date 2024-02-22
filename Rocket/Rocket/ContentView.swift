//
//  ContentView.swift
//  Rocket
//
//  Created by Lukáš Matuška on 22.02.2024.
//

import SwiftUI
import RocketToolkit
import SharedDomain

struct ContentView: View {
    var body: some View {
        VStack {
            Image(asset: Asset.rocketIdle)
            Text("Rocket!")
        }
        .padding()
        .onAppear(perform: {
            Task {
                let data: [Rocket]?
                do {
                    data = try await RocketRepositoryImpl().fetchRockets()
                    print(data!.first!.name)
                }
                catch {
                    print(error)
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
