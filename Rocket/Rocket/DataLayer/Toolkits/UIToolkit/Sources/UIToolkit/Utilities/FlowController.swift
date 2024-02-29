//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SwiftUI

public protocol Flow: Hashable {}

@MainActor
open class FlowController: ObservableObject {
    
    public init() {
    }
    
    /// Override this method in a subclass and setup handlings for all flow cases.
    open func handleFlow(_ flow: any Flow) {}
    
    /// Changes current navigation state to display desired flow
    open func displayFlow(_ flow: (any Flow)?) {}
}

