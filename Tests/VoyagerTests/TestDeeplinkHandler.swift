import Foundation
import Voyager

final class TestDeeplinkHandler: DeeplinkHandler {
    
    func handleDeeplink(url: URL) -> (TestRoute, PresentationOption)? {
        return (.route1, .sheet)
    }
}
