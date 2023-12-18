//
//  DepartureFlightView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 30/10/2023.
//

import SwiftUI

enum Terminal: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case all = "전체"
    case terminal1 = "제 1 터미널"
    case terminal2 = "제 2 터미널"
}

import SwiftUI

struct DepartureFlightView: View {
    @ObservedObject var viewModel = DepartResponseViewModel()
    @State private var selectedTerminal: Terminal = .all
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            HeaderView()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("여객 출발시간표")
                    Spacer()
                    Picker("Select Terminal", selection: $selectedTerminal) {
                        ForEach(Terminal.allCases, id: \.self) { terminal in
                            Text(terminal.rawValue).tag(terminal)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Text("출발시간")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("목적지")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("항공사")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("운항편명")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .font(.headline)
                .padding(.horizontal, 20)
                
                List(viewModel.filteredItems, id: \.self) { item in
                    HStack(spacing: 10) {
                        VStack {
                            if DateTimeFormatter.formatTime(item.scheduleDateTime) != DateTimeFormatter.formatTime(item.estimatedDateTime) {
                                Text(DateTimeFormatter.formatTime(item.scheduleDateTime))
                                    .foregroundColor(Color.red)
                                    .strikethrough()
                                    .frame(maxWidth: .infinity, alignment: .center)
                                Text(DateTimeFormatter.formatTime(item.estimatedDateTime))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                Text(DateTimeFormatter.formatTime(item.scheduleDateTime))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        
                        VStack(alignment: .center) {
                            Text(item.airport ?? "에러")
                            Text("(\(item.cityCode ?? "에러"))")
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(item.airline ?? "에러")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(item.flightId ?? "에러")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 12))
                }
                .listStyle(PlainListStyle())
            }
        }
        .onChange(of: selectedTerminal) { newTerminal in
            viewModel.selectedTerminal = newTerminal
        }
    }
}

struct DepartureFlightView_Previews: PreviewProvider {
    static var previews: some View {
        DepartureFlightView()
    }
}
