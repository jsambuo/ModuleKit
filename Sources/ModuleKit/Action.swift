//
//  Action.swift
//
//
//  Created by Jimmy Sambuo on 5/21/24.
//

import Foundation

/// A struct representing an action handler with a key and a handler function.
public struct Action {
    /// The key for the action.
    public let key: String
    /// The handler function to run when the action is triggered, accepting a dictionary of parameters.
    public let handler: ([String: Any]) -> Void
    
    /// Initializes a new Action.
    /// - Parameters:
    ///   - key: The key for the action.
    ///   - handler: The handler function to run when the action is triggered, accepting a dictionary of parameters.
    public init(key: String, handler: @escaping ([String: Any]) -> Void) {
        self.key = key
        self.handler = handler
    }
    
    /// Initializes a new Action with a handler that takes no parameters.
    /// - Parameters:
    ///   - key: The key for the action.
    ///   - handler: The handler function to run when the action is triggered.
    public init(key: String, handler: @escaping () -> Void) {
        self.init(key: key) { _ in handler() }
    }
}
