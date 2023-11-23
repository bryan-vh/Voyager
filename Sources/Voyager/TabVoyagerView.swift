import SwiftUI

public struct TabVoyagerView<T: Hashable & Identifiable, Content: View, TabItem: View>: View {
    
    @ObservedObject var router: TabRouter<T>
    @ViewBuilder var content: (T) -> Content
    @ViewBuilder var tabItem: (T) -> TabItem
    
    public init(router: TabRouter<T>, content: @escaping (T) -> Content, tabItem: @escaping (T) -> TabItem) {
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
