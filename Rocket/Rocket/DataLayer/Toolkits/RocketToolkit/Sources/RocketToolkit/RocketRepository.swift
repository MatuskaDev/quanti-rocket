//
//  Created by Lukáš Matuška on 22.02.2024.
//

import SharedDomain
import Foundation

public struct RocketRepositoryImpl: RocketRepository {
    
    public init() {
        
    }
    
    public func fetchRockets() async throws -> [Rocket]? {
        let url = URL(string: "https://api.spacexdata.com/v4/rockets")
        let (data, _) = try await URLSession.shared.data(from: url!)
        let decoder = JSONDecoder()
        return try decoder.decode([Rocket].self, from: data)
    }
}
