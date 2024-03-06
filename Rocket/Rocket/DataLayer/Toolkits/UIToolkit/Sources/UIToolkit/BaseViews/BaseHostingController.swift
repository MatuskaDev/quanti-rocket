//
//  Created by Lukáš Matuška on 06.03.2024.
//

import SwiftUI

public class BaseHostingController<Content>: UIHostingController<Content> where Content: View {
    
    private var statusBarStyle: UIStatusBarStyle?
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle ?? navigationController?.preferredStatusBarStyle ?? .default
    }
    
    public convenience init(rootView: Content, statusBarStyle: UIStatusBarStyle) {
        self.init(rootView: rootView)
        self.statusBarStyle = statusBarStyle
    }
    
    override public init(rootView: Content) {
        super.init(rootView: rootView)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
