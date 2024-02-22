//
//  Created by Lukáš Matuška on 22.02.2024.
//

public protocol GetRocketsUseCase {
    func execute() async throws -> [Rocket]?
}

public struct GetRocketsUseCaseImpl: GetRocketsUseCase {
    private let repository: RocketRepository
    
    public init(repository: RocketRepository) {
        self.repository = repository
    }
    
    public func execute() async throws -> [Rocket]? {
        return try await repository.fetchRockets()
    }
}
