//
//  Route.swift
//
//
//  Created by Jimmy Sambuo on 5/21/24.
//

import Foundation
import SwiftUI

/// A struct representing a route handler with a path and a handler function.
public struct Route {
    /// The path for the route.
    public let path: String
    /// The handler function to run when the route is matched, accepting a dictionary of parameters and returning a view.
    public let handler: ([String: Any]) -> any View
    
    /// Initializes a new Route.
    /// - Parameters:
    ///   - path: The path for the route.
    ///   - handler: The handler function to run when the route is matched, accepting a dictionary of parameters and returning a view.
    public init(path: String, handler: @escaping ([String: Any]) -> any View) {
        self.path = path
        self.handler = handler
    }
    
    /// Initializes a new Route with a handler that takes no parameters.
    /// - Parameters:
    ///   - path: The path for the route.
    ///   - handler: The handler function to run when the route is matched, returning a view.
    public init(path: String, handler: @escaping () -> any View) {
        self.init(path: path) { _ in handler() }
    }
}
