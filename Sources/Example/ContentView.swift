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
    
    @State var router = TabRouter<ExampleRoute>(tabs: [.route1, .route2],
                                                selected: .route1,
                                                deeplinkHandler: ExampleRouteDeeplinkHandler())
    
    var body: some View {
        TabVoyagerView(router: router) { route in
            switch route {
            case .route1: Route1View()
            case .route2: Route2View()
            }
        } tabItem: { route in
            EmptyView()
        }
    }
}

struct ExampleRouteDeeplinkHandler: DeeplinkHandler {
    
    func handleDeeplink(url: URL) -> (ExampleRoute, PresentationOption)? {
        return nil
    }
}

#Preview {
    ContentView()
}
