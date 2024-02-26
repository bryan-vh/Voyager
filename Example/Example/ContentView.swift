//
//  ContentView.swift
//  Example
//
//  Created by Bryan Van Horn on 2/26/24.
//

import Voyager
import SwiftUI

enum ExampleRoute: Route {
    case route1
    case route2
}

struct ContentView: View {
    
    @StateObject var router = Router<ExampleRoute>(root: .route1)
    
    var body: some View {
        NavVoyagerView(router: router) { (route: ExampleRoute) in
            switch route {
            case .route1:
                Route1View()
            case .route2:
                Route2View()
            }
        }
    }
}

#Preview {
    ContentView()
}
