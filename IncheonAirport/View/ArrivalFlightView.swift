//
//  ArrivalFlightView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 21/9/2023.
//

import SwiftUI

struct ArrivalFlightView: View {
    @ObservedObject var viewModel = ArrivalResponseViewModel()
    @State private var selectedTerminal: Terminal = .all
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            HeaderView()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("여객 도착시간표")
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
                    Text("도착시간")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("출발지")
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
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        VStack(alignment: .center) {
                            Text(item.airport ?? "에러")
                            Text("(\(item.airportCode ?? "에러"))")
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

struct ArrivalFlightView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalFlightView()
    }
}


struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onSubmit(onSearch)
                .submitLabel(.search)
            
            if !text.isEmpty {
                Button("Cancel") {
                    self.text = ""
                    onSearch()
                }
                .foregroundColor(.blue)
            }
        }
        .padding(.horizontal, 10)
    }
}
