import Foundation
import Voyager

final class TestDeeplinkHandler: DeeplinkHandler<TestRoute> {
    
    override func handleDeeplink(url: URL) -> (TestRoute, PresentationOption)? {
        return (.route1, .sheet)
    }
}
