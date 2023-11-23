import SwiftUI

public struct TabVoyagerView<T: Route, Content: View, TabItem: View>: View {
    
    @ObservedObject private var router: TabRouter<T>
    private let content: (T) -> Content
    private let tabItem: (T) -> TabItem
    
    public init(
        router: TabRouter<T>,
        @ViewBuilder content: @escaping (T) -> Content,
        @ViewBuilder tabItem: @escaping (T) -> TabItem
    ) {
        self.router = router
        self.content = content
        self.tabItem = tabItem
    }
    
    public var body: some View {
        TabView(selection: $router.selected) {
            ForEach(router.tabs) { tab in
                NavVoyagerView(router: getRouter(for: tab)) { route in
                    content(route)
                }
                .tabItem {
                    tabItem(tab)
                        .onTapGesture {
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()
                        }
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color(uiColor: .systemBackground), for: .tabBar)
            }
        }
        .environmentObject(router)
    }
    
    private func getRouter(for tab: T) -> Router<T> {
        guard let index = router.tabs.firstIndex(of: tab) else {
            fatalError("Tab found no longer exists")
        }
        return router.routers[index]
    }
}
