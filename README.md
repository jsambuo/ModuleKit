# ModuleKit

ModuleKit is a Swift Package for modularizing your Swift codebase with customizable routes and actions. It is compatible with iOS, macOS, watchOS, and tvOS.

## Installation

To install ModuleKit, add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/jsambuo/ModuleKit.git", from: "1.0.0")
]
```

## Usage

### Defining a Module

Define a module by conforming to the `Module` protocol. Each module must provide an array of routes and an array of actions.

```swift
import ModuleKit
import SwiftUI

struct MyModule: Module {
    var routes: [Route] {
        [
            Route(path: "/my/route") { parameters in
                VStack {
                    Text("Route matched with parameters: \(parameters)")
                }
            },
            Route(path: "/simple/route") {
                VStack {
                    Text("Simple route matched with no parameters")
                }
            }
        ]
    }

    var actions: [Action] {
        [
            Action(key: "myAction") { parameters in
                print("My action executed with parameters: \(parameters)")
            }
        ]
    }
}
```

### Using `ModuleManager` and `RouteView`

```swift
import SwiftUI
import ModuleKit

@main
struct MyApp: App {
    private let moduleManager = ModuleManager(modules: [MyModule()])

    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack {
                    RouteView("/my/route", parameters: ["param1": "value1"])
                    RouteView("/simple/route")
                }
                .environmentObject(moduleManager)
            }
        }
    }
}
```

### API

#### ModuleManager

`ModuleManager` is responsible for managing and handling routes and actions for multiple modules.

```swift
public class ModuleManager: ObservableObject {
    public init(modules: [any Module] = [])
    public func registerModule(_ module: any Module)
    public func registerModules(_ modules: [any Module])
    public func viewForRoute(path: String, parameters: [String: Any]) -> (any View)?
    public func performAction(key: String, parameters: [String: Any] = [:])
}
```

#### RouteView

`RouteView` is a SwiftUI view that renders a view for a given route path using the `ModuleManager`.

```swift
public struct RouteView: View {
    public init(_ path: String, parameters: [String: Any] = [:])
}
```

### License

ModuleKit is released under the MIT license. See [LICENSE](LICENSE) for details.
