//
//  Created by Lukáš Matuška on 22.02.2024.
//

import Foundation

public struct Rocket: Identifiable {
    public let id: String
    public let name: String
    public let firstFlight: String
    
    public let height: Distance
    public let diameter: Distance
    public struct Distance: Decodable {
        var meters: Double
    }
    
    public let mass: Weight
    public struct Weight: Decodable {
        var kg: Double
    }
    
    public let imageUrls: [String]
    
    public let firstStage: RocketStage
    public let secondStage: RocketStage
}

extension Rocket: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id, name, height, mass, diameter
        case firstFlight = "first_flight"
        case imageUrls = "flickr_images"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
    }
}
