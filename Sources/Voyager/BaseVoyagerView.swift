import SwiftUI

struct BaseVoyagerView<T: Hashable & Identifiable, Content: View>: View {
    
    @ObservedObject var router: Router<T>
    @ViewBuilder var content: (T) -> Content
    
    var body: some View {
        content(router.root)
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
            .environmentObject(router)
    }
}
