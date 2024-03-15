 //
//  Created by Lukáš Matuška on 14.03.2024.
//

import SharedDomain
import DeviceMotionProvider
import CoreMotion

final public class DeviceMotionRepositoryImpl: DeviceMotionRepository {
    
    var provider: DeviceMotionProvider
    
    public init(provider: DeviceMotionProvider) {
        self.provider = provider
        
        // Set handler for motion updates
        self.provider.handler = { (data, error) in
            self.handleMotionUpdate(data)
        }
    }
    
    public func startDetecting() throws {
        try provider.startMonitoring()
    }
    
    public func stopDetecting() {
        provider.stopMonitoring()
    }
    
    private func handleMotionUpdate(_ data: CMDeviceMotion?) {
        if let data {
            if data.userAcceleration.y > 0.4 {
                // Send device moved up notification
                NotificationCenter.default.post(name: DeviceMotionNotification.onDeviceUpMovement, object: nil)
            }
        }
    }
    
}
