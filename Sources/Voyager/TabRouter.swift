import Foundation

@MainActor
class TabRouter<T: Hashable & Identifiable>: ObservableObject {
    
    @Published var tabs: [T]
    @Published var selected: T
    @Published var routers: [Router<T>]
    
    init(tabs: [T], selected: T) {
        self.tabs = tabs
        self.selected = selected
        self.routers = tabs.map { Router<T>(root: $0) }
    }
    
    func updateCurrentTab(_ to: T) {
        selected = to
    }
}
