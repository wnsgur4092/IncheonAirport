//
//  ContentView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//

import SwiftUI

struct ContentView: View {
    // Assuming you have a state variable to keep track of the selected tab
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            DepartureFlightView()
                .tabItem {
                    Label("Departures", systemImage: "airplane.departure")
                }
                .tag(1)

            ArrivalFlightView()
                .tabItem {
                    Label("Arrivals", systemImage: "airplane.arrival")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

