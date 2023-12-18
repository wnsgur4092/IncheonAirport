//
//  ArrivalResponseModel.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 21/9/2023.
//

import Foundation

struct ArrivalResponseModel: Codable {
    let response: ArrivalResponse
}

struct ArrivalResponse: Codable {
    let header: Header
    let body: ArrivalBody
}

struct ArrivalBody: Codable {
    let items: [ArrivalItem]
}

struct ArrivalItem: Codable, Hashable {
    let typeOfFlight: String?
    let airline: String?
    let flightId: String?
    let scheduleDateTime: String?
    let estimatedDateTime: String?
    let airport: String?
    let gatenumber: String?
    let carousel: String?
    let exitnumber: String?
    let remark: String?
    let codeshare: String?
    let masterflightid: String?
    let airportCode: String?
    let cityCode: String?
    let terminalId: String?
    let elapsetime: String?
    // Omit the stopover fields if they are not relevant for arrivals
}

extension ArrivalItem {
    static var dummyData: [ArrivalItem] {
        let dummyDataURL = Bundle.main.url(forResource: "arrivalFlights", withExtension: "json")!
        let data = try! Data(contentsOf: dummyDataURL)
        
        let jsonDecoder = JSONDecoder()
        let apiResponse = try! jsonDecoder.decode(ArrivalResponseModel.self, from: data)
        return apiResponse.response.body.items
    }
}
