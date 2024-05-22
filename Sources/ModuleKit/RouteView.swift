//
//  RouteView.swift
//
//
//  Created by Jimmy Sambuo on 5/21/24.
//

import SwiftUI

/// A SwiftUI view that renders a view for a given route path using the ModuleManager.
public struct RouteView: View {
    @EnvironmentObject private var moduleManager: ModuleManager
    private let path: String
    private let parameters: [String: Any]
    
    /// Initializes a new RouteView.
    /// - Parameters:
    ///   - path: The path to match for the route.
    ///   - parameters: A dictionary of parameters to pass to the route handler. Defaults to an empty dictionary.
    public init(_ path: String, parameters: [String: Any] = [:]) {
        self.path = path
        self.parameters = parameters
    }
    
    public var body: some View {
        if let view = moduleManager.viewForRoute(path: path, parameters: parameters) {
            AnyView(view)
        } else {
            AnyView(Text("Route not found"))
        }
    }
}
