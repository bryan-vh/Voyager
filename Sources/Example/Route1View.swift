//
//  Route1View.swift
//

import Voyager
import SwiftUI

struct Route1View: View {
    
    @EnvironmentObject var router: Router<ExampleRoute>
    
    var body: some View {
        Text("Route 1")
        NavigationLink(value: ExampleRoute.route2) {
            Text("Go to route 2")
        }
        Button("Present route 2 (sheet)") {
            router.present(.route2, option: .sheet)
        }
    }
}

#Preview {
    Route1View()
}
