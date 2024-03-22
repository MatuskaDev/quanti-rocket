//
//  Created by Lukáš Matuška on 22.03.2024.
//

public class FlowControllerMock<T: Flow & Equatable>: FlowController {
    
    public var handleFlowCount = 0
    public var handleFlowValue: T?
    
    override public func handleFlow(_ flow: Flow) {
        handleFlowCount += 1
        handleFlowValue = flow as? T
    }
}
