//
//  Created by Lukáš Matuška on 29.02.2024.
//

@testable import SharedDomain
import SharedDomainStubs
import XCTest

final class GetRocketsUseCaseTests: XCTestCase {
    
    // MARK: Test
    
    func testExecute() async throws {
        let rocketRepository = RocketRepositorySpy()
        rocketRepository.fetchRocketsReturnValue = [Rocket.stub]
        
        let useCase = GetRocketsUseCaseImpl(repository: rocketRepository)
        let rockets = try await useCase.execute()
        
        XCTAssertEqual(rockets, [Rocket.stub])
        XCTAssertEqual(rocketRepository.fetchRocketsCallsCount, 1)
    }
}
