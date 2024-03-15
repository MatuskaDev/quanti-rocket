//
//  Created by Lukáš Matuška on 14.03.2024.
//

import CoreMotion
import SharedDomain

public final class SystemDeviceMotionProvider: CMMotionManager, DeviceMotionProvider {
    
    public var handler: CMDeviceMotionHandler?
    private var motionQueue = OperationQueue()
    
    public func startMonitoring() throws {
        if !isDeviceMotionAvailable {
            throw DeviceMotionError.notAvailible
        }
        if let handler {
            startDeviceMotionUpdates(to: self.motionQueue, withHandler: handler)
        } else {
            throw DeviceMotionError.handlerNotSet
        }
    }
    
    public func stopMonitoring() {
        stopDeviceMotionUpdates()
    }
}
