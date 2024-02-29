//
//  Repositories+Injection.swift
//  Rocket
//
//  Created by Lukáš Matuška on 29.02.2024.
//

import Resolver
import SharedDomain
import RocketToolkit

extension Resolver {
    static func registerRepositories() {
        register { RocketRepositoryImpl() }.implements(RocketRepository.self)
    }
}
