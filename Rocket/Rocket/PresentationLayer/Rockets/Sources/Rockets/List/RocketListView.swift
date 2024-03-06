//
//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SwiftUI
import UIToolkit

public struct RocketListView: View {
    
    @StateObject var model: RocketListViewModel
    
    public init(model: RocketListViewModel) {
        _model = StateObject(wrappedValue: model)
    }
    
    public var body: some View {
        
        Group {
            if let rockets = model.state.rockets {
                List {
                    ForEach(rockets) { rocket in
                        Button {
                            model.onIntent(.showRocketDetail(rocket))
                        } label: {
                            HStack(spacing: 15) {
                                Asset.Images.rocket.image
                                VStack(alignment: .leading) {
                                    Text(rocket.name)
                                        .bold()
                                    Text("First flight: \(rocket.firstFlight)")
                                        .font(.caption)
                                        .foregroundStyle(Color.gray)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .refreshable {
                    model.onIntent(.updateData)
                }
            } else {
                ProgressView()
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Rockets")
        .lifecycle(model)
    }
}

#Preview {
    MockedPreviewWrapper {
        RocketListView(model: RocketListViewModel(flowController: nil))
    }
}
