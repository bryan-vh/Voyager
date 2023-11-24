@testable import Voyager
import XCTest

final class RouterTests: XCTestCase {
    
    private var router: Router<TestRoute>!
    private let deeplinkHandler = TestDeeplinkHandler()
    private let testUrl = URL(string: "https://apple.com")!
    
    override func setUp() {
        super.setUp()
        
        router = Router<TestRoute>(root: .route1, deeplinkHandler: deeplinkHandler)
    }

    func test_router_init() {
        XCTAssertEqual(router.root, .route1)
        XCTAssertEqual(router.routes, [])
        XCTAssertNotNil(router.deeplinkHandler)
    }
    
    func test_router_updateRoot() {
        XCTAssertEqual(router.root, .route1)
        XCTAssertEqual(router.routes, [])
        router.present(.route1)
        router.updateRoot(.route2)
        XCTAssertEqual(router.root, .route2)
        XCTAssertEqual(router.routes, [])
    }
    
    func test_router_presentAndDismiss_navigation() {
        XCTAssertEqual(router.routes, [])
        router.present(.route2, option: .navigation)
        XCTAssertEqual(router.routes, [.route2])
        router.present(.route3, option: .navigation)
        XCTAssertEqual(router.routes, [.route2, .route3])
        router.dismiss()
        XCTAssertEqual(router.routes, [.route2])
        router.dismiss()
        XCTAssertEqual(router.routes, [])
    }
    
    func test_router_presentAndDismiss_sheet() {
        XCTAssertNil(router.sheet)
        router.present(.route1, option: .sheet)
        XCTAssertEqual(router.sheet, .route1)
        router.dismiss()
        XCTAssertNil(router.sheet)
    }
    
    func test_router_presentAndDismiss_fullscreenCover() {
        XCTAssertNil(router.fullscreenCover)
        router.present(.route1, option: .fullscreenCover)
        XCTAssertEqual(router.fullscreenCover, .route1)
        router.dismiss()
        XCTAssertNil(router.fullscreenCover)
    }
    
    func test_router_presentAndDismiss_popover() {
        XCTAssertNil(router.popover)
        router.present(.route1, option: .popover)
        XCTAssertEqual(router.popover, .route1)
        router.dismiss()
        XCTAssertNil(router.popover)
    }
    
    func test_router_withDeeplinkHandler_handleDeeplink() {
        XCTAssertNil(router.sheet)
        router.handleDeeplink(url: testUrl)
        XCTAssertEqual(router.sheet, .route1)
    }
    
    func test_router_withoutDeeplinkHandler_doesNotHandleDeeplink() {
        let router = Router<TestRoute>(root: .route1)
        XCTAssertNil(router.sheet)
        router.handleDeeplink(url: testUrl)
        XCTAssertNil(router.sheet)
    }
}
