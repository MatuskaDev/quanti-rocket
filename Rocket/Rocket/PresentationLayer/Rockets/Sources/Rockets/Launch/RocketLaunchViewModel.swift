//
//
//  Created by Lukáš Matuška on 06.03.2024.
//

import UIToolkit
import SwiftUI
import CoreMotion

final class RocketLaunchViewModel: CMMotionManager, ViewModel, ObservableObject {
    
    // MARK: Lifecycle
    func onAppear() {
        startMotionUpdates()
    }
    
    func onDisappear() {
        stopDeviceMotionUpdates()
    }
    
    // MARK: State
    @Published private(set) var state: State = State()
    struct State {
        var isLaunched: Bool = false
        var animationValue: Double = 0.6
    }
    
    // MARK: Intent
    enum Intent { }
    func onIntent(_ intent: Intent) { }
    
    // MARK: Private
    private func launchRocket() {
        state.isLaunched = true
        withAnimation(.easeIn(duration: 1.5)) {
            state.animationValue = -0.5
        }
    }
    
    // MARK: Device motion
    
    private var motionQueue = OperationQueue()
    private func startMotionUpdates() {
        if isDeviceMotionAvailable {
            startDeviceMotionUpdates(to: self.motionQueue, withHandler: { (data, error) in
                if let data {
                    if data.userAcceleration.y > 0.4 {
                        DispatchQueue.main.async {
                            self.launchRocket()
                        }
                        self.stopDeviceMotionUpdates()
                    }
                }
            })
        }
    }
}
