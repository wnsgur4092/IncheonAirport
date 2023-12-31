//
//  IncheonAirportApp.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//

import SwiftUI

@main
struct IncheonAirportApp: App {
    @ObservedObject var viewModel = DepartResponseViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
