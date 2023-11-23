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
@StateObject var router = Router<Route>(root: .route1)

BaseVoyagerView(router: router) { route in
  switch route {
  case route1: Route1View()
  case route2: Route2View()
  // ...
  }
}
```

The simplest of all Voyager views. For those views that don't need navigation or tabs. If you do need navigation or tabs, use the corresponding VoyagerView below.

### `NavVoyagerView`
```swift
@StateObject var router = Router<Route>(root: .route1)

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
@StateObject var router = Router<Route>(root: .route1)

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

  // You can then use the router to push, pop, present modals, or dismiss views as needed.
}
```

You can access a router in any child view of the parent Voyager view.

## License
[MIT License](LICENSE)
