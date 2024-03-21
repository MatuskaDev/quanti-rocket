//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SwiftUI
import Resolver
import DependencyInjectionMocks

/**
 Registers use case mocks for SwftiUI previews
 */
public struct MockedPreviewWrapper<Content: View>: View {
    
    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        Resolver.registerUseCaseMocks()
        self.content = content()
    }
    
    public var body: some View {
        content
    }
}

#Preview {
    MockedPreviewWrapper {
        Text("Ahoj")
    }
}
