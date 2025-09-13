import SwiftUI

public struct TabVoyagerView<T: Route, Content: View, TabItem: View, TabBar: View>: View {
    
    @ObservedObject
    private var router: TabRouter<T>
    
    private let content: (T) -> Content
    private let tabItem: (T) -> TabItem
    private let shouldUseCustomTabBar: Bool
    private let tabBar: () -> TabBar
    
    @State
    private var customTabBarHeight: CGFloat = 0
    
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
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: customTabBarHeight)
            }
            
            if shouldUseCustomTabBar {
                VStack(spacing: 0) {
                    Spacer()
                    tabBar()
                        .onGeometryChange(for: CGSize.self) { proxy in
                            proxy.size
                        } action: { newValue in
                            updateTabBarHeight(newValue.height)
                        }
                }
            }
        }
    }
    
    private func updateTabBarHeight(_ height: CGFloat) {
        customTabBarHeight = height
    }
    
    private func getRouter(for tab: T) -> Router<T> {
        guard let index = router.tabs.firstIndex(of: tab) else {
            fatalError("Tab found no longer exists")
        }
        return router.routers[index]
    }
}
