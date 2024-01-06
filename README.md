[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbryan-vh%2FVoyager%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/bryan-vh/Voyager)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbryan-vh%2FVoyager%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/bryan-vh/Voyager)

<img src="https://images.ctfassets.net/ooa29xqb8tix/6MFFWO1k38yxTrLKRZ26e8/2c07fa6c2c4653bfae00dd87625d6e56/swift-logo.png?w=400&q=50" alt="Voyager" width="200">

> Lightweight framework for navigation & routing in SwiftUI

# Voyager

**Voyager** empowers developers to power their SwiftUI-based apps with routing that not only applies to navigation, but also tabs.

## Installation

In Xcode add the dependency to your project via *File > Add Packages > Search or Enter Package URL* and use the following url:
```
https://github.com/bryan-vh/Voyager.git
```

Once added, import the package in your code:
```swift
import Voyager
```

## Usage

### `Route`
```swift
enum ExampleRoute: Route {
  case route1
  case route2
  case route3(String)
  case route4(Int)
}
```

To start off, create an enum that will represent your set of routes. These can be parameterized by using Swift's enum with associated values.

### `BaseVoyagerView`
```swift
@StateObject var router = Router<ExampleRoute>(root: .route1)

BaseVoyagerView(router: router) { route in
  switch route {
  case route1: Route1View()
  case route2: Route2View()
  // ...
  }
}
```

The simplest of all Voyager views. Use when you don't need navigation or tabs. If you do need navigation or tabs, use the corresponding Voyager view below.

### `NavVoyagerView`
```swift
@StateObject var router = Router<ExampleRoute>(root: .route1)

NavVoyagerView(router: router) { route in
  switch route {
  case route1: Route1View()
  case route2: Route2View()
  // ...
  }
}
```

NavVoyagerView uses NavigationStack under the hood so you are able to use NavigationLink views as needed in child views.

### `TabVoyagerView`
```swift
@StateObject var router = TabRouter<ExampleRoute>(tabs: [.route1, .route2], selected: .route1)

TabVoyagerView(router: router) { route in
  switch route {
  case route1: Route1View()
  case route2: Route2View()
  // ...
  }
} tabItem: { route in
  // Design a label for your tab item
}
```

TabVoyagerView uses a TabView with an array of NavVoyagerViews under the hood, so navigation works for each tab separately.

### `Router`
```swift
struct Route1View: View {

  @EnvironmentObject var router: Router<ExampleRoute>

  // You can then use the router to push, pop, present modals, or dismiss as needed.
}
```

You can access a router in any child view of the parent Voyager view.

### `DeeplinkHandler`
```swift
final class ExampleDeeplinkHandler: DeeplinkHandler<ExampleRoute> {

  override func handleDeeplink(url: URL) -> (ExampleRoute, PresentationOption)? {
    // Transform the deeplink into a route with a given presentation option.
  }
}
```

By injecting a route-specific **DeeplinkHandler** into a **Router**, you will be able to
handle any deeplinks that would present some route from that router.

## License
[MIT License](LICENSE)
