//
//  RocketLaunchViewModelTests.swift
//  
//
//  Created by Lukáš Matuška on 22.03.2024.
//

import XCTest
@testable import Rockets
@testable import SharedDomain
import UIToolkit
import Resolver

final class RocketLaunchViewModelTests: XCTestCase {
    
    private var viewModel: RocketLaunchViewModel!
    @MainActor
    private let flowController = FlowControllerMock<RocketsFlow>(navigationController: UINavigationController())
    
    private let startMonitoringDeviceMotionUseCase = StartMonitoringDeviceMotionUseCaseSpy()
    private let stopMonitoringDeviceMotionUseCase = StopMonitoringDeviceMotionUseCaseSpy()

    @MainActor
    override func setUp() {
        Resolver.register { self.startMonitoringDeviceMotionUseCase }.implements(StartMonitoringDeviceMotionUseCase.self)
        Resolver.register { self.stopMonitoringDeviceMotionUseCase }.implements(StopMonitoringDeviceMotionUseCase.self)
        viewModel = RocketLaunchViewModel()
    }

    @MainActor
    func testAppearSuccess() {
        startMonitoringDeviceMotionUseCase.executeThrowableError = nil
        
        viewModel.onAppear()
        
        XCTAssertEqual(startMonitoringDeviceMotionUseCase.executeCallsCount, 1)
        XCTAssertTrue(viewModel.state.canLaunch!)
    }
    
    @MainActor
    func testAppearFail() {
        startMonitoringDeviceMotionUseCase.executeThrowableError = DeviceMotionError.notAvailible
        
        viewModel.onAppear()
        
        XCTAssertEqual(startMonitoringDeviceMotionUseCase.executeCallsCount, 1)
        XCTAssertFalse(viewModel.state.canLaunch!)
    }
    
    @MainActor
    func testDisappear() {
        viewModel.onDisappear()
        
        XCTAssertEqual(stopMonitoringDeviceMotionUseCase.executeCallsCount, 1)
    }
    
    @MainActor
    func testReceiveNotification() {
        NotificationCenter.default.post(name: DeviceMotionNotification.onDeviceUpMovement, object: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.viewModel.state.isLaunched)
        }
    }

}
