import SwiftUI

public struct NavVoyagerView<T: Route, Content: View>: View {
    
    @ObservedObject private var router: Router<T>
    private let content: (T) -> Content
    
    public init(
        router: Router<T>,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.router = router
        self.content = content
    }
    
    public var body: some View {
        NavigationStack(path: $router.routes) {
            content(router.root)
                .navigationDestination(for: T.self) { route in
                    content(route)
                }
        }
        .sheet(item: $router.sheet) {
            router.onDismiss?()
        } content: { route in
            content(route)
        }
        .fullScreenCover(item: $router.fullscreenCover) {
            router.onDismiss?()
        } content: { route in
            content(route)
        }
        .popover(item: $router.popover) { route in
            content(route)
        }
        .environmentObject(router)
    }
}
