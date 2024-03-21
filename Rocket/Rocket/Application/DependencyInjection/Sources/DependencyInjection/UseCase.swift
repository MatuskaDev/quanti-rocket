//
//  UseCase+Injection.swift
//  Rocket
//
//  Created by Lukáš Matuška on 29.02.2024.
//

import Resolver
import SharedDomain

extension Resolver {
    public static func registerUseCases() {
        register { GetRocketsUseCaseImpl(repository: self.resolve() )}.implements(GetRocketsUseCase.self)
        register { StartMonitoringDeviceMotionUseCaseImpl(repository: self.resolve() )}.implements(StartMonitoringDeviceMotionUseCase.self)
        register { StopMonitoringDeviceMotionUseCaseImpl(repository: self.resolve() )}.implements(StopMonitoringDeviceMotionUseCase.self)
    }
}
