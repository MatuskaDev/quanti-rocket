//
//  Repositories+Injection.swift
//  Rocket
//
//  Created by Lukáš Matuška on 29.02.2024.
//

import Resolver
import SharedDomain
import RocketToolkit
import DeviceMotionToolkit

extension Resolver {
    public static func registerRepositories() {
        register { RocketRepositoryImpl() }.implements(RocketRepository.self)
        register { DeviceMotionRepositoryImpl(provider: self.resolve() )}.implements(DeviceMotionRepository.self)
    }
}
