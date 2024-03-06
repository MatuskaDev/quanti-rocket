//
//  Created by Lukáš Matuška on 29.02.2024.
//

import UIToolkit
import SharedDomain
import SwiftUI
import Resolver

public class RocketListViewModel: ObservableObject, ViewModel {
    
    private weak var flowController: FlowController?
    
    @Injected private(set) var getRocketsUseCase: GetRocketsUseCase
    
    public init(flowController: FlowController?) {
        self.flowController = flowController
    }

    // MARK: Lifecycle
    public func onAppear() {
        Task {
            do {
                self.state.rockets = try await getRocketsUseCase.execute()
            } catch {
                print("Error")
            }
        }
    }
    
    public func onDisappear() {
        //
    }
    
    // MARK: State
    public struct State {
        var rockets: [Rocket]?
    }
    @Published public var state = State()
    
    // MARK: Intent
    public enum Intent {
        case showRocketDetail(Rocket)
        case updateData
    }
    
    public func onIntent(_ intent: Intent) {
        switch intent {
        case .showRocketDetail(let rocket):
            showRocketDetail(rocket: rocket)
        case .updateData:
            fetchNewData()
        }
    }
    
    // MARK: Private
    
    func fetchNewData() {
        Task {
            do {
                self.state.rockets = try await getRocketsUseCase.execute()
            } catch {
                print("Error")
            }
        }
    }
    
    func showRocketDetail(rocket: Rocket) {
        flowController?.handleFlow(RocketsFlow.rockets(.showDetailFor(rocket: rocket)))
    }
}
