import SwiftUI

public struct TabVoyagerView<T: Route, Content: View, TabItem: View, TabBar: View>: View {
    
    @ObservedObject private var router: TabRouter<T>
    private let content: (T) -> Content
    private let tabItem: (T) -> TabItem
    private let shouldUseCustomTabBar: Bool
    private let tabBar: () -> TabBar
    
    public init(
        router: TabRouter<T>,
        shouldUseCustomTabBar: Bool = false,
        @ViewBuilder content: @escaping (T) -> Content,
        @ViewBuilder tabItem: @escaping (T) -> TabItem,
        @ViewBuilder tabBar: @escaping () -> TabBar = { EmptyView() }
    ) {
        self.router = router
        self.shouldUseCustomTabBar = shouldUseCustomTabBar
        self.content = content
        self.tabItem = tabItem
        self.tabBar = tabBar
    }
    
    public var body: some View {
        ZStack {
            TabView(selection: $router.selected) {
                ForEach(router.tabs) { tab in
                    NavVoyagerView(router: getRouter(for: tab)) { route in
                        content(route)
                            .toolbar(shouldUseCustomTabBar ? .hidden : .visible, for: .tabBar)
                    }
                    .tabItem {
                        tabItem(tab)
                    }
                }
            }
            .environmentObject(router)
            .ignoresSafeArea(edges: shouldUseCustomTabBar ? [.bottom] : [])
            
            if shouldUseCustomTabBar {
                VStack {
                    Spacer()
                    tabBar()
                }
            }
        }
    }
    
    private func getRouter(for tab: T) -> Router<T> {
        guard let index = router.tabs.firstIndex(of: tab) else {
            fatalError("Tab found no longer exists")
        }
        return router.routers[index]
    }
}
