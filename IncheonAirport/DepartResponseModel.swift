//
//  DepartResponseModel.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//
import Foundation

struct DepartResponseModel: Codable {
    let response: Response
}

struct Response: Codable {
    let header: Header
    let body: Body
}

struct Header: Codable {
    let resultCode: String
    let resultMsg: String
}

struct Body: Codable {
    let items: [FlightItem]
}

struct FlightItem: Codable,Hashable {
    let typeOfFlight: String?
    let airline: String?
    let flightId: String?
    let scheduleDateTime: String?
    let estimatedDateTime: String?
    let airport: String?
    let chkinrange: String?
    let gatenumber: String?
    let remark: String?
    let codeshare: String?
    let masterflightid: String?
    let airportCode: String?
    let cityCode: String?
    let terminalId: String?
    let elapsetime: String?
    let firstopover: String?
    let firstopovername: String?
    let secstopover: String?
    let secstopovername: String?
    let thistopover: String?
    let thistopovername: String?
    let foustopover: String?
    let foustopovername: String?
    let fifstopover: String?
    let fifstopovername: String?
    let sixstopover: String?
    let sixstopovername: String?
    let sevstopover: String?
    let sevstopovername: String?
    let eigstopover: String?
    let eigstopovername: String?
    let ninstopover: String?
    let ninstopovername: String?
    let tenstopover: String?
    let tenstopovername: String?
}

