//
//  RocketDetailViewModelTests.swift
//  
//
//  Created by Lukáš Matuška on 22.03.2024.
//

import XCTest
@testable import Rockets
@testable import SharedDomain
import UIToolkit

final class RocketDetailViewModelTests: XCTestCase {
    
    private var viewModel: RocketDetailViewModel!
    @MainActor
    private var flowController = FlowControllerMock<RocketsFlow>(navigationController: UINavigationController())

    @MainActor
    override func setUp() {
        viewModel = RocketDetailViewModel(flowController: flowController, rocket: .stub)
    }

    @MainActor
    func testLaunchRocketIntent() {
        viewModel.onIntent(.launchRocket)
        
        XCTAssertEqual(flowController.handleFlowCount, 1)
        XCTAssertEqual(flowController.handleFlowValue, .rockets(.showLaunch))
    }
}
