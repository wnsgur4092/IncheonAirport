//
//  ArrivalResponseViewModel.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 21/9/2023.
//

import Foundation
import Alamofire

class ArrivalResponseViewModel: ObservableObject {
    @Published var items: [ArrivalItem] = []
    @Published var error: String? // For handling and displaying errors
    @Published var isLoading: Bool = true
    @Published var selectedTerminal: Terminal = .all

    var filteredItems: [ArrivalItem] {
        switch selectedTerminal {
        case .all:
            return items
        case .terminal1:
            return items.filter { $0.terminalId == "P01" }
        case .terminal2:
            return items.filter { $0.terminalId == "P02" }
        }
    }

    init() {
        loadDummyData()
    }

    func loadDummyData() {
        guard let url = Bundle.main.url(forResource: "arrivalFlights", withExtension: "json") else {
            self.error = "Failed to locate arrivalFlights.json in bundle."
            self.isLoading = false
            return
        }

        guard let data = try? Data(contentsOf: url) else {
            self.error = "Failed to load arrivalFlights.json from bundle."
            self.isLoading = false
            return
        }

        let decoder = JSONDecoder()
        if let decodedResponse = try? decoder.decode(ArrivalResponseModel.self, from: data) {
            DispatchQueue.main.async {
                self.items = decodedResponse.response.body.items
                self.isLoading = false
            }
        } else {
            self.error = "Failed to decode arrivalFlights.json."
            self.isLoading = false
        }
    }
}
