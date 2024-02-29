//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SharedDomain
import SharedDomainMocks
import XCTest

final class GetRocketsUseCaseTests: XCTestCase {
    
    private let rocketRepository = RocketRepositoryMock()
    
    // MARK: Test
    
    func testExecute() async throws {
        let useCase = GetRocketsUseCaseImpl(repository: rocketRepository)
        let rockets = try await useCase.execute()
        
        for rocket in rockets ?? [] {
            XCTAssert(rocket.id == Rocket.stub.id)
        }
    }
}
