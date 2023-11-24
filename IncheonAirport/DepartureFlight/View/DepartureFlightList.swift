//
//  DepartureFlightList.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 24/11/2023.
//

import SwiftUI

struct DepartureFlightList: View {
    var flightItem : FlightItem
    
    var body: some View {
        HStack {
            // VStack for the airline logo and name
            VStack(alignment: .center, spacing: 20) {
                Image("KE")
                    .resizable()
                    .scaledToFit()
                    .frame(width:120, height: 120)

                Text(flightItem.airline ?? "Airline Error")
                
                Text(flightItem.flightId ?? "FlightID Error")
            }
            
            HStack(spacing: 20) {
                VStack(alignment:.leading) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("목적지")
                        Text(flightItem.airport ?? "Airport Error")
                    }

                    Spacer()

                    VStack(alignment: .leading, spacing: 10) {
                        Text("출발시간")
                        Text(flightItem.scheduleDateTime ?? "ScheudleDateTime Error")
                 
                    }
                }
                .background(Color.blue)

                Spacer()

                VStack(alignment:.leading) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("탑승구")
                        Text(flightItem.gatenumber ?? "Gate Not opened")
                    }


                    Spacer()

                    VStack(alignment: .leading, spacing: 10) {
                        Text("예정시간")
                        Text(flightItem.estimatedDateTime ?? "Estimated Date time error")
                    }
                   
                }
                .background(Color.red)
            }

        }
        .frame(maxWidth:.infinity)
        .padding()
        .background(Color.yellow)
        .cornerRadius(10)
    }
}

struct DepartureFlightList_Previews: PreviewProvider {
    static var previews: some View {
        DepartureFlightList(flightItem: .dummyData[0])
            .fixedSize()
    }
}
