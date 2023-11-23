import SwiftUI

struct NavVoyagerView<T: Hashable & Identifiable, Content: View>: View {
    
    @ObservedObject var router: Router<T>
    @ViewBuilder var content: (T) -> Content
    
    var body: some View {
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
