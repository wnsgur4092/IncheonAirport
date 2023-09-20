//
//  ContentView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel = DepartResponseViewModel()
    
    
    //MARK: - BODY
    var body: some View {
        ScrollView {
            ForEach(viewModel.items, id:\.self) { item in
                DepartScheduleCard(departTime: item.scheduleDateTime, destination: item.airport, cityCode: item.cityCode, airline: item.airline, flightNumber: item.flightId, gateNumber: item.gatenumber)
                    .padding(.vertical, 10)
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
