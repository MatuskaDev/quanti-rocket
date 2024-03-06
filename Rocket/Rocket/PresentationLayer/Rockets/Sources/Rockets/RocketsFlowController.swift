//
//  Created by Lukáš Matuška on 06.03.2024.
//

import UIToolkit
import SharedDomain
import UIKit

enum RocketsFlow: Flow {
    case rockets(Rockets)
    
    enum Rockets: Equatable {
        case showDetailFor(rocket: Rocket)
        case showLaunch
    }
}

public final class RocketsFlowController: FlowController {
    
    override public func setup() -> UIViewController {
        let vm = RocketListViewModel(flowController: self)
        return BaseHostingController(rootView: RocketListView(model: vm))
    }
    
    override public func handleFlow(_ flow: any Flow) {
        guard let rocketsFlow = flow as? RocketsFlow else { return }
        switch rocketsFlow {
        case .rockets(let rocketsFlow): handleRocketsFlow(rocketsFlow)
        }
    }
}

// MARK: Rockets flow
extension RocketsFlowController {
    func handleRocketsFlow(_ flow: RocketsFlow.Rockets) {
        switch flow {
        case .showDetailFor(let rocket):
            showRocketDetailFor(rocket: rocket)
        case .showLaunch:
            showRocketLaunch()
        }
    }
    
    private func showRocketDetailFor(rocket: Rocket) {
        //let vm = UserDetailViewModel(userId: userId, flowController: self)
        let vc = BaseHostingController(rootView: RocketDetailView(rocket: rocket))
        navigationController.show(vc, sender: nil)
    }
    
    private func showRocketLaunch() {
        let vc = BaseHostingController(rootView: RocketLaunchView())
        navigationController.show(vc, sender: nil)
    }
}
