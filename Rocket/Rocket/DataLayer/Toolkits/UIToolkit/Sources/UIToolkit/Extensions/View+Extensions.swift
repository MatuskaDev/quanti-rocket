//
//  Created by Lukáš Matuška on 29.02.2024.
//

import SwiftUI

@MainActor
public extension View {
    @inlinable func lifecycle(_ viewModel: any ViewModel) -> some View {
        self
            .onAppear {
                viewModel.onAppear()
            }
            .onDisappear {
                viewModel.onDisappear()
            }
    }
}
