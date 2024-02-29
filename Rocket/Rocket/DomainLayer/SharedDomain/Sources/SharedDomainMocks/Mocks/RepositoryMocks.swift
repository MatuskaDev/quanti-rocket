//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SharedDomain

public final class RocketRepositoryMock: RocketRepository {
    
    public init() { }
    
    public func fetchRockets() async throws -> [Rocket]? {
        return [.stub]
    }
}
