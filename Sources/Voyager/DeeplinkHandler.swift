import Foundation

public protocol DeeplinkHandler {
    associatedtype RouteType: Route
    func handleDeeplink(url: URL) -> (RouteType, PresentationOption)?
}
