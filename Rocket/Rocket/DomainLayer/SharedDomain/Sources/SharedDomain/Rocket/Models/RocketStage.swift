 //
//  Created by Lukáš Matuška on 22.02.2024.
//

public struct RocketStage {
    public let reusable: Bool
    public let engines: Int
    public let fuelAmount: Double
    public let burnTime: Double?
}

extension RocketStage: Decodable {
    public enum CodingKeys: String, CodingKey {
        case reusable = "reusable"
        case engines = "engines"
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
}
