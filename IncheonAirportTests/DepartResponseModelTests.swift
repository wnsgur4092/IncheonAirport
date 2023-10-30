//
//  DepartResponseModelTests.swift
//  IncheonAirportTests
//
//  Created by JunHyuk Lim on 22/9/2023.
//

//import XCTest
//@testable import IncheonAirport
//
//class DepartResponseModelTests: XCTestCase {
//
//    func testDecodeDepartResponseModel() {
//        let jsonData = """
//        {
//            "response": {
//                "header": {
//                    "resultCode": "0000",
//                    "resultMsg": "Success"
//                },
//                "body": {
//                    "items": [
//                        {
//                            "typeOfFlight": "Domestic",
//                            "airline": "Korean Air",
//                            "flightId": "KE123",
//                            // ... other properties ...
//                        }
//                    ]
//                }
//            }
//        }
//        """.data(using: .utf8)!
//
//        let decoder = JSONDecoder()
//        do {
//            let model = try decoder.decode(DepartResponseModel.self, from: jsonData)
//            XCTAssertEqual(model.response.header.resultCode, "0000")
//            XCTAssertEqual(model.response.header.resultMsg, "Success")
//            XCTAssertEqual(model.response.body.items.first?.typeOfFlight, "Domestic")
//            XCTAssertEqual(model.response.body.items.first?.airline, "Korean Air")
//            // ... other assertions ...
//        } catch {
//            XCTFail("Decoding failed: \(error)")
//        }
//    }
//}
