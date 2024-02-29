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
    public struct Distance: Decodable, Equatable {
        var meters: Double
        
        public init(meters: Double) {
            self.meters = meters
        }
    }
    
    public let mass: Weight
    public struct Weight: Decodable, Equatable {
        var kg: Double
        
        public init(kg: Double) {
            self.kg = kg
        }
    }
    
    public let imageUrls: [String]
    
    public let firstStage: RocketStage
    public let secondStage: RocketStage
    
    public init(id: String, 
                name: String,
                firstFlight: String,
                height: Distance,
                diameter: Distance,
                mass: Weight,
                imageUrls: [String],
                firstStage: RocketStage,
                secondStage: RocketStage) {
        self.id = id
        self.name = name
        self.firstFlight = firstFlight
        self.height = height
        self.diameter = diameter
        self.mass = mass
        self.imageUrls = imageUrls
        self.firstStage = firstStage
        self.secondStage = secondStage
    }
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
