//
//  Created by Lukáš Matuška on 14.03.2024.
//

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

