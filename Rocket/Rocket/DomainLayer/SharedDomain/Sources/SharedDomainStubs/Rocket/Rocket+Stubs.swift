//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SharedDomain

public extension Rocket {
    static let stub = Rocket(id: "test",
                             name: "Falcon",
                             description: "This is a rocket",
                             firstFlight: "20-01-2020",
                             height: Distance(meters: 20.1),
                             diameter: Distance(meters: 4.3),
                             mass: Weight(kg: 1000),
                             imageUrls: [],
                             firstStage: .stub,
                             secondStage: .stub)
}
