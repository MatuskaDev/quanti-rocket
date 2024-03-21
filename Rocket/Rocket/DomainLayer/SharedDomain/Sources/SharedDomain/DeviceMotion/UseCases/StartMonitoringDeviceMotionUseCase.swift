//
//  Created by Lukáš Matuška on 14.03.2024.
//

import Spyable

@Spyable
public protocol StartMonitoringDeviceMotionUseCase {
    func execute() throws
}

public struct StartMonitoringDeviceMotionUseCaseImpl: StartMonitoringDeviceMotionUseCase {
    
    private let repository: DeviceMotionRepository
    
    public init(repository: DeviceMotionRepository) {
        self.repository = repository
    }
    
    public func execute() throws {
        try self.repository.startDetecting()
    }
    
}
