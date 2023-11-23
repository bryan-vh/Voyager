@testable import Voyager
import XCTest

final class TabRouterTests: XCTestCase {
    
    private var router: TabRouter<TestRoute>!
    
    override func setUp() {
        super.setUp()
        
        router = TabRouter(tabs: [.route1, .route2, .route3], selected: .route1)
    }

    func test_router_init() {
        XCTAssertEqual(router.tabs, [.route1, .route2, .route3])
        XCTAssertEqual(router.selected, .route1)
    }
    
    func test_router_updateCurrentTab() {
        XCTAssertEqual(router.selected, .route1)
        router.updateSelectedTab(.route2)
        XCTAssertEqual(router.selected, .route2)
    }

}
