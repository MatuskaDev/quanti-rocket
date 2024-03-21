//
//  Created by Lukáš Matuška on 14.03.2024.
//

import Spyable

@Spyable
public protocol StopMonitoringDeviceMotionUseCase {
    func execute()
}

public struct StopMonitoringDeviceMotionUseCaseImpl: StopMonitoringDeviceMotionUseCase {
    
    private let repository: DeviceMotionRepository
    
    public init(repository: DeviceMotionRepository) {
        self.repository = repository
    }
    
    public func execute()  {
        self.repository.stopDetecting()
    }
}

