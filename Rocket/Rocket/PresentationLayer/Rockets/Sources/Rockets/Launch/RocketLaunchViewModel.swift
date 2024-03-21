//
//
//  Created by Lukáš Matuška on 06.03.2024.
//

import UIToolkit
import SwiftUI
import SharedDomain
import Resolver

final class RocketLaunchViewModel: ViewModel, ObservableObject {
    
    @Injected var startMonitoringUseCase: StartMonitoringDeviceMotionUseCase
    @Injected var stopMonitoringUseCase: StopMonitoringDeviceMotionUseCase
    
    public init() {
        // Add observer for device moved up notification
        NotificationCenter.default.addObserver(self, selector: #selector(onDeviceUpMovement), name: DeviceMotionNotification.onDeviceUpMovement, object: nil)
    }
    
    // MARK: Lifecycle
    func onAppear() {
        do {
            try startMonitoringUseCase.execute()
            state.canLaunch = true
        } catch {
            print("Error: Device motion not availible")
            state.canLaunch = false
        }
    }
    
    func onDisappear() {
        stopMonitoringUseCase.execute()
    }
    
    // MARK: State
    @Published private(set) var state: State = State()
    struct State {
        var canLaunch: Bool? = nil
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
    
    // Handle device motion notification
    @objc private func onDeviceUpMovement() {
        DispatchQueue.main.async {
            self.launchRocket()
        }
    }
}
