//
//  ModuleManagerTests.swift
//
//
//  Created by Jimmy Sambuo on 5/21/24.
//

import XCTest
import SwiftUI
@testable import ModuleKit

final class ModuleManagerTests: XCTestCase {

    struct TestModule: Module {
        var routes: [Route] = [
            Route(path: "/test") { _ in
                Text("Test View")
            }
        ]
        var actions: [Action] = [
            Action(key: "testAction") { _ in
                print("Test Action Executed")
            }
        ]
    }

    func testRegisterModule() {
        let moduleManager = ModuleManager()
        let testModule = TestModule()
        moduleManager.registerModule(testModule)
        
        XCTAssertNotNil(moduleManager.viewForRoute(path: "/test", parameters: [:]))
    }
    
    func testViewForRoute() {
        let moduleManager = ModuleManager(modules: [TestModule()])
        let view = moduleManager.viewForRoute(path: "/test", parameters: [:])
        
        XCTAssertNotNil(view)
        XCTAssertTrue(view is Text)
    }
    
    func testPerformAction() {
        let moduleManager = ModuleManager(modules: [TestModule()])
        moduleManager.performAction(key: "testAction")
        
        // Check the output to ensure the action was performed
        // This can be done through a mock or spy in a real-world scenario
    }
}
