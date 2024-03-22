//
//  RocketListViewModelTests.swift
//  
//
//  Created by Lukáš Matuška on 22.03.2024.
//

import XCTest
@testable import Rockets
import UIToolkit
import Resolver
@testable import SharedDomain

final class RocketListViewModelTests: XCTestCase {
    
    private var viewModel: RocketListViewModel!
    
    @MainActor
    private let flowController = FlowControllerMock<RocketsFlow>(navigationController: UINavigationController())
    private let getRocketsUseCase = GetRocketsUseCaseSpy()
    
    @MainActor
    override func setUp() {
        getRocketsUseCase.executeReturnValue = [Rocket.stub]
        Resolver.register { self.getRocketsUseCase }.implements(GetRocketsUseCase.self)
        viewModel = RocketListViewModel(flowController: flowController)
    }


    @MainActor
    func testAppear() async {
        viewModel.onAppear()
        
        await viewModel.awaitAllTasks()
        
        XCTAssertEqual(getRocketsUseCase.executeCallsCount, 1)
        XCTAssertEqual(viewModel.state.rockets, [Rocket.stub])
    }
    
    @MainActor
    func testShowRocketDetailIntent() {
        viewModel.onIntent(.showRocketDetail(Rocket.stub))
        
        XCTAssertEqual(flowController.handleFlowCount, 1)
        XCTAssertEqual(flowController.handleFlowValue, .rockets(.showDetailFor(rocket: Rocket.stub)))
    }
    
    @MainActor
    func testUpdateData() async {
        viewModel.onIntent(.updateData)
        
        await viewModel.awaitAllTasks()
        
        XCTAssertEqual(viewModel.state.rockets, [Rocket.stub])
        XCTAssertEqual(getRocketsUseCase.executeCallsCount, 1)
    }
}
