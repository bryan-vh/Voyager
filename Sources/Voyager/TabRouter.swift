import Foundation

public class TabRouter<T: Route>: ObservableObject {
    
    @Published var tabs: [T]
    @Published var selected: T
    @Published var routers: [Router<T>]
    
    public init(tabs: [T], selected: T) {
        self.tabs = tabs
        self.selected = selected
        self.routers = tabs.map { Router<T>(root: $0) }
    }
    
    public func updateSelectedTab(_ to: T) {
        selected = to
    }
}
