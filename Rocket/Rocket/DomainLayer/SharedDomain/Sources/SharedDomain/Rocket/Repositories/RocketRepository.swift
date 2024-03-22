//
//  Created by Lukáš Matuška on 22.02.2024.
//

import Spyable

@Spyable
public protocol RocketRepository {
    func fetchRockets() async throws -> [Rocket]?
}
