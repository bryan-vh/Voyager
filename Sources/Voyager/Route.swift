//
//  File.swift
//  
//
//  Created by Bryan Van Horn on 11/23/23.
//

import Foundation

public protocol Route: Hashable, Identifiable {}

public extension Route {
    var id: Self { self }
}
