//
//  UseCase+Injection.swift
//  Rocket
//
//  Created by Lukáš Matuška on 29.02.2024.
//

import Resolver
import SharedDomain

extension Resolver {
    static func registerUseCases() {
        register { GetRocketsUseCaseImpl(repository: self.resolve() )}.implements(GetRocketsUseCase.self)
    }
}
