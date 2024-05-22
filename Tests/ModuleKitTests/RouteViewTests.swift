//
//  RouteViewTests.swift
//
//
//  Created by Jimmy Sambuo on 5/21/24.
//

import XCTest
import SwiftUI
@testable import ModuleKit

final class RouteViewTests: XCTestCase {

    struct TestModule: Module {
        var routes: [Route] = [
            Route(path: "/test") { _ in
                Text("Test View")
            }
        ]
        var actions: [Action] = []
    }

    func testRouteViewInitialization() {
        let moduleManager = ModuleManager(modules: [TestModule()])
        let routeView = RouteView("/test")
            .environmentObject(moduleManager)
        
        // Here you can add assertions to verify the view's behavior
    }
}
