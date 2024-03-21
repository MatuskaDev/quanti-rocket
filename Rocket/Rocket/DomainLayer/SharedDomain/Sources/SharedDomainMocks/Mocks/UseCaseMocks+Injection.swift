//
//  Created by Lukáš Matuška on 29.02.2024.
//

@testable import SharedDomain
import Resolver

extension Resolver {
    public static func registerUseCaseMocks() {
        register { GetRocketsUseCaseMock(executeReturnValue: [.stub]) }.implements(GetRocketsUseCase.self)
        register { StartMonitoringDeviceMotionUseCaseSpy() }.implements(StartMonitoringDeviceMotionUseCase.self)
        register { StopMonitoringDeviceMotionUseCaseSpy() }.implements(StopMonitoringDeviceMotionUseCase.self)
    }
}
