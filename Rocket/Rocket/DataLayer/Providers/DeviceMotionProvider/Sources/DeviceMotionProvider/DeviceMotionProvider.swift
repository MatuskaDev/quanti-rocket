import CoreMotion

public protocol DeviceMotionProvider {
    
    /// Handler which gets called with each motion update
    var handler: CMDeviceMotionHandler? { get set }
    
    /// Starts tracking device movements
    func startMonitoring() throws
    
    /// Stops tracking device movements
    func stopMonitoring()
}
