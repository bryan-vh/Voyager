<img src="https://images.ctfassets.net/ooa29xqb8tix/6MFFWO1k38yxTrLKRZ26e8/2c07fa6c2c4653bfae00dd87625d6e56/swift-logo.png?w=400&q=50" alt="Voyager" width="200">

> Framework for navigation & routing in SwiftUI

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

<br>

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

<br>

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

<br>

### `Route`
```swift
struct Route1View: View {

  @EnvironmentObject var router: Router<Route>

  // You can then use the router to push, pop, present modals, or dismiss views as needed.
}
```
