//
//  Created by Lukáš Matuška on 21.03.2024.
//

@testable import SharedDomain
import XCTest

final class StartMonitoringDeviceMotionUseCaseTests: XCTestCase {
    
    func testSuccess() {
        let repository = DeviceMotionRepositorySpy()
        repository.startDetectingThrowableError = nil
        
        let useCase = StartMonitoringDeviceMotionUseCaseImpl(repository: repository)
        
        XCTAssertNoThrow(try useCase.execute())
        XCTAssertEqual(repository.startDetectingCallsCount, 1)
    }
    
    func testError() {
        let repository = DeviceMotionRepositorySpy()
        repository.startDetectingThrowableError = DeviceMotionError.notAvailible
        
        let useCase = StartMonitoringDeviceMotionUseCaseImpl(repository: repository)
        
        XCTAssertThrowsError(try useCase.execute())
        XCTAssertEqual(repository.startDetectingCallsCount, 1)
    }
}
