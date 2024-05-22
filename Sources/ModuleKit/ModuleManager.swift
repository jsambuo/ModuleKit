//
//  ModuleManager.swift
//
//
//  Created by Jimmy Sambuo on 5/21/24.
//

import Foundation
import SwiftUI

/// Manages the registration and handling of routes and actions for multiple modules.
public class ModuleManager: ObservableObject {
    private var routes: [String: ([String: Any]) -> any View] = [:]
    private var actions: [String: ([String: Any]) -> Void] = [:]
    
    /// Initializes a new ModuleManager with an array of modules.
    /// - Parameter modules: An array of modules to register.
    public init(modules: [any Module] = []) {
        registerModules(modules)
    }
    
    /// Registers a single module, adding its routes and actions to the manager.
    /// - Parameter module: The module to register.
    public func registerModule(_ module: any Module) {
        module.routes.forEach { route in
            routes[route.path] = route.handler
        }
        module.actions.forEach { action in
            actions[action.key] = action.handler
        }
    }
    
    /// Registers multiple modules, adding their routes and actions to the manager.
    /// - Parameter modules: An array of modules to register.
    public func registerModules(_ modules: [any Module]) {
        modules.forEach { registerModule($0) }
    }
    
    /// Returns the view for a given route path and parameters.
    /// - Parameters:
    ///   - path: The path of the route.
    ///   - parameters: A dictionary of parameters to pass to the route handler.
    /// - Returns: An optional view if the route is found, otherwise nil.
    public func viewForRoute(path: String, parameters: [String: Any]) -> (any View)? {
        return routes[path]?(parameters)
    }
    
    /// Executes an action for a given key and parameters.
    /// - Parameters:
    ///   - key: The key of the action.
    ///   - parameters: A dictionary of parameters to pass to the action handler.
    public func performAction(key: String, parameters: [String: Any] = [:]) {
        actions[key]?(parameters)
    }
}
