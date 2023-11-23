import Foundation

public class TabRouter<T: Route>: ObservableObject {
    
    @Published public var tabs: [T]
    @Published public var selected: T
    @Published public var routers: [Router<T>]
    
    public init(tabs: [T], selected: T) {
        self.tabs = tabs
        self.selected = selected
        self.routers = tabs.map { Router<T>(root: $0) }
    }
    
    public func updateCurrentTab(_ to: T) {
        selected = to
    }
}
