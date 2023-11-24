import Foundation

open class DeeplinkHandler<T: Route> {
    
    public init() {}
    
    open func handleDeeplink(url: URL) -> (T, PresentationOption)? {
        fatalError("Handle the deeplink in your own subclass that implements this method.")
    }
}
