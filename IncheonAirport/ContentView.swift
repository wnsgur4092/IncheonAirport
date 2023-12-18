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
            Text("Home VIEW")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(1)
            
            DepartureFlightView()
                .tabItem {
                    Label("Departures", systemImage: "airplane.departure")
                }
                .tag(2)

            ArrivalFlightView()
                .tabItem {
                    Label("Arrivals", systemImage: "airplane.arrival")
                }
                .tag(3)
            
            Text("Car Park")
                .tabItem {
                    Label("Car Park", systemImage: "car")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

