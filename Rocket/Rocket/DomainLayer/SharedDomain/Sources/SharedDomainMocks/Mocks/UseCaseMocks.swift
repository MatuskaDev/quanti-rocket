//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SharedDomain

public final class GetRocketsUseCaseMock: GetRocketsUseCase {
    public var executeReturnValue: [Rocket]?
    
    public init(executeReturnValue: [Rocket]? = nil) {
        self.executeReturnValue = executeReturnValue
    }
    
    public func execute() async throws -> [Rocket]? {
        return executeReturnValue
    }
}
