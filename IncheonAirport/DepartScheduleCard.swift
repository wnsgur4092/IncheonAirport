//
//  DepartScheduleCard.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//

import SwiftUI

struct DepartScheduleCard: View {
    var departTime : String
    var destination : String
    var cityCode : String
    var airline : String
    var flightNumber : String
    var gateNumber : String
    
    let rows: [GridItem] = [
         GridItem(.flexible()),
         GridItem(.flexible())
     ]
    
    //MARK: - BODY
    var body: some View {
        HStack{
            Text(departTime)
            
            Spacer()
            
            VStack{
                Text(destination)
                Text("(\(cityCode))")
            }
            
            Spacer()
            
            VStack{
                Text(flightNumber)
                Text(airline)
            }
            
            Spacer()
            
            Text(gateNumber)
        }
    }
}

struct DepartScheduleCard_Previews: PreviewProvider {
    static var previews: some View {
        DepartScheduleCard(departTime: "16:26", destination: "샌프란 시스코", cityCode: "SFO", airline: "대한항공", flightNumber: "KE023", gateNumber: "231")
    }
}
