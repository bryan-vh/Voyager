//
//  RouterTests.swift
//  
//
//  Created by Bryan Van Horn on 11/23/23.
//

import Voyager
import XCTest

final class RouterTests: XCTestCase {
    
    private var router: Router<TestRoute>!
    
    override func setUp() {
        super.setUp()
        
        router = Router<TestRoute>(root: .route1)
    }

    func test_router_init() {
        XCTAssertEqual(router.root, .route1)
        XCTAssertEqual(router.routes, [])
    }
    
    func test_router_updateRoot() {
        XCTAssertEqual(router.root, .route1)
        XCTAssertEqual(router.routes, [])
        router.push(.route3)
        router.updateRoot(.route2)
        XCTAssertEqual(router.root, .route2)
        XCTAssertEqual(router.routes, [])
    }
    
    func test_router_push() {
        XCTAssertEqual(router.routes, [])
        router.push(.route2)
        XCTAssertEqual(router.routes, [.route2])
        router.push(.route3)
        XCTAssertEqual(router.routes, [.route2, .route3])
    }
    
    func test_router_pop() {
        XCTAssertEqual(router.routes, [])
        router.push(.route2)
        XCTAssertEqual(router.routes, [.route2])
        router.push(.route3)
        XCTAssertEqual(router.routes, [.route2, .route3])
        router.pop()
        XCTAssertEqual(router.routes, [.route2])
        router.pop()
        XCTAssertEqual(router.routes, [])
    }
    
    func test_router_presentAndDismiss_sheet() {
        XCTAssertNil(router.sheet)
        router.presentSheet(.route1)
        XCTAssertEqual(router.sheet, .route1)
        router.dismiss()
        XCTAssertNil(router.sheet)
    }
    
    func test_router_presentAndDismiss_fullscreenCover() {
        XCTAssertNil(router.fullscreenCover)
        router.presentFullscreenCover(.route1)
        XCTAssertEqual(router.fullscreenCover, .route1)
        router.dismiss()
        XCTAssertNil(router.fullscreenCover)
    }
    
    func test_router_presentAndDismiss_popover() {
        XCTAssertNil(router.popover)
        router.presentPopover(.route1)
        XCTAssertEqual(router.popover, .route1)
        router.dismiss()
        XCTAssertNil(router.popover)
    }

}
