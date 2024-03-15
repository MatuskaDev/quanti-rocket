//
//  Providers+Injection.swift
//  Rocket
//
//  Created by Lukáš Matuška on 14.03.2024.
//

import Resolver
import SharedDomain
import DeviceMotionProvider

extension Resolver {
    static func registerProviders() {
        register { SystemDeviceMotionProvider() }.implements(DeviceMotionProvider.self)
    }
}
