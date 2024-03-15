//
//  Created by Lukáš Matuška on 14.03.2024.
//

public protocol DeviceMotionRepository {
    func startDetecting() throws
    func stopDetecting()
}
