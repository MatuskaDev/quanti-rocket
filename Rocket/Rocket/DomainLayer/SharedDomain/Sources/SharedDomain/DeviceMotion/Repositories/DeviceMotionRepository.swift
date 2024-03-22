//
//  Created by Lukáš Matuška on 14.03.2024.
//
import Spyable

@Spyable
public protocol DeviceMotionRepository {
    func startDetecting() throws
    func stopDetecting()
}
