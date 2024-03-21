//
//  Created by Lukáš Matuška on 06.03.2024.
//

import SwiftUI
import UIToolkit

struct RocketLaunchView: View {
    
    @ObservedObject var model: RocketLaunchViewModel = RocketLaunchViewModel()
    
    var body: some View {
        Group {
            if let canLaunch = model.state.canLaunch {
                if canLaunch {
                    GeometryReader { geo in
                        Group {
                            model.state.isLaunched ? Asset.Images.rocketFlying.image : Asset.Images.rocketIdle.image
                        }
                        .position(x: geo.size.width/2, y: geo.size.height*model.state.animationValue)
                        Text(model.state.isLaunched ?
                             "Launch successfull!" : "Move your phone up\nto launch the rocket")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .position(x: geo.size.width/2, y: geo.size.height*0.8)
                    }
                } else {
                    VStack {
                        Spacer()
                        Text("Cannot launch rocket")
                            .font(.title.bold())
                        Asset.Images.rocketError.image
                            .resizable()
                            .scaledToFit()
                    }
                    .ignoresSafeArea()
                }
            } else {
                ProgressView()
            }
        }
        .lifecycle(model)
    }
}

#Preview {
    MockedPreviewWrapper {
        RocketLaunchView()
    }
}
