//
//  Module.swift
//
//
//  Created by Jimmy Sambuo on 5/21/24.
//

import Foundation

/// A protocol that defines a module with routes and actions.
public protocol Module {
    /// An array of routes provided by the module.
    var routes: [Route] { get }
    
    /// An array of actions provided by the module.
    var actions: [Action] { get }
}
