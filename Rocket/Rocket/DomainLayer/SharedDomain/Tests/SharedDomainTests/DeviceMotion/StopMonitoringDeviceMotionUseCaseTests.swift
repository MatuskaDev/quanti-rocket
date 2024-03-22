//
//  Created by Lukáš Matuška on 21.03.2024.
//

@testable import SharedDomain
import XCTest

final class StopMonitoringDeviceMotionUseCaseTests: XCTestCase {
    
    func testExecute() {
        let repository = DeviceMotionRepositorySpy()
        repository.startDetectingThrowableError = nil
        
        let useCase = StopMonitoringDeviceMotionUseCaseImpl(repository: repository)
        useCase.execute()
        
        XCTAssertEqual(repository.stopDetectingCallsCount, 1)
    }
}

