//
//  DepartResponseViewModel.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//

import Foundation
import Alamofire

class DepartResponseViewModel: ObservableObject {
    @Published var items: [FlightItem] = []
    @Published var error: String? // For handling and displaying errors

    var serviceKey = "k4jpWaE5PfYiyJ4IsR6NqKeiI3ZjNG8KL0Aw3kH65f8fOmRJIcPFACAdVGbs0yG7wIKFV8KTNXNGhKSrpryQRQ%3D%3D"

    private var urlString: String {
    "http://apis.data.go.kr/B551177/StatusOfPassengerFlightsOdp/getPassengerDeparturesOdp?serviceKey=\(serviceKey)&from_time=2000&to_time=2400&lang=K&type=json"
    }
    
    init() {
        fetchDepartAirplanes()
    }
    

    func fetchDepartAirplanes() {
        AF.request(urlString).responseDecodable(of: DepartResponseModel.self) { [weak self] response in
            switch response.result {
            case .success(let apiResponse):
                DispatchQueue.main.async {
                    self?.items = apiResponse.response.body.items
                }
                print("Successfully fetched \(apiResponse.response.body.items.count) items.")
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
