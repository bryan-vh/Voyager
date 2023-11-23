import Foundation

public protocol Route: Equatable, Hashable, Identifiable {}

public extension Route {
    var id: Self { self }
}
