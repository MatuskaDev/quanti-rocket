//
//
//  Created by Lukáš Matuška on 06.03.2024.
//

import UIToolkit
import SwiftUI
import SharedDomain

final class RocketDetailViewModel: ViewModel, ObservableObject {
    
    // MARK: Dependencies
    private weak var flowController: FlowController?
    
    init(flowController: FlowController?, rocket: Rocket) {
        self.flowController = flowController
        self.state = State(rocket: rocket)
    }
    
    // MARK: Lifecycle
    func onAppear() {
        //
    }
    
    func onDisappear() {
        //
    }
    
    // MARK: State
    @Published private(set) var state: State
    struct State {
        let rocket: Rocket
    }
    
    // MARK: Intent
    enum Intent {
        case launchRocket
    }
    
    func onIntent(_ intent: Intent) {
        switch intent {
        case .launchRocket: showLaunch()
        }
    }
    
    // MARK: Private
    private func showLaunch() {
        flowController?.handleFlow(RocketsFlow.rockets(.showLaunch))
    }
}
