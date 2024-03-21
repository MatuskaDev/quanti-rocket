//
//  Created by Lukáš Matuška on 21.03.2024.
//

@testable import SharedDomain
import Resolver
import SharedDomainStubs

extension Resolver {
    public static func registerUseCaseMocks() {
        
        let getRocketsUseCaseSpy = GetRocketsUseCaseSpy()
        getRocketsUseCaseSpy.executeReturnValue = [Rocket.stub]
        register { getRocketsUseCaseSpy }.implements(GetRocketsUseCase.self)
        register { StartMonitoringDeviceMotionUseCaseSpy() }.implements(StartMonitoringDeviceMotionUseCase.self)
        register { StopMonitoringDeviceMotionUseCaseSpy() }.implements(StopMonitoringDeviceMotionUseCase.self)
    }
}
