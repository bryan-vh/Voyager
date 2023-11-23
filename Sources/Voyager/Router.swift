import Foundation

public class Router<T: Hashable & Identifiable>: ObservableObject {
    
    @Published var root: T
    @Published var routes: [T]
    @Published var sheet: T?
    @Published var fullscreenCover: T?
    @Published var popover: T?
    @Published var onDismiss: (() -> Void)?
    
    public init(root: T) {
        self.root = root
        self.routes = []
    }
    
    public func updateRoot(_ route: T) {
        root = route
        routes.removeAll()
    }
    
    public func push(_ route: T) {
        routes.append(route)
    }
    
    public func pop() {
        routes.removeLast()
    }
    
    public func presentSheet(_ route: T, onDismiss: (() -> Void)? = nil) {
        sheet = route
        self.onDismiss = onDismiss
    }
    
    public func presentFullscreenCover(_ route: T, onDismiss: (() -> Void)? = nil) {
        fullscreenCover = route
        self.onDismiss = onDismiss
    }
    
    public func presentPopover(_ route: T) {
        popover = route
    }
    
    public func dismiss(_ completion: (() -> Void)? = nil) {
        onDismiss = completion
        
        if sheet != nil {
            sheet = nil
        } else if fullscreenCover != nil {
            fullscreenCover = nil
        } else if popover != nil {
            popover = nil
        }
    }
}
