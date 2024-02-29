//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SharedDomain
import Resolver

extension Resolver {
    public static func registerUseCaseMocks() {
        register { GetRocketsUseCaseMock(executeReturnValue: [.stub]) }.implements(GetRocketsUseCase.self)
    }
}
