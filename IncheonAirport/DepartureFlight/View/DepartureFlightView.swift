//
//  DepartureFlightView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 30/10/2023.
//

import SwiftUI

struct DepartureFlightView: View {
    @ObservedObject var viewModel = DepartResponseViewModel()
    @State private var selectedTerminal : Terminal = .all
    @State private var showingSelection: Bool = false
    
    
    var body: some View {
        //        if viewModel.isLoading{
        //            LoadingView()
        //        } else {
        
        VStack{
            VStack(alignment: .leading){
                
                HStack {
                    Text("여객 출발시간표")
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            showingSelection.toggle()
                        }
                    } label: {
                        HStack{
                            Text(selectedTerminal.rawValue)
                            Image(systemName: "chevron.down")
                                .rotationEffect(.degrees(showingSelection ? 180 : 0))
                        }
                    }
                }
                
                if showingSelection {
                    VStack(spacing: 0) {
                        ForEach(Terminal.allCases, id: \.self) { terminal in
                            VStack{
                                Button {
                                    withAnimation {
                                        viewModel.selectedTerminal = terminal
                                        showingSelection = false
                                    }
                                } label: {
                                    Text(terminal.rawValue)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                                    .frame(height: 1)
                            }
                            
                        }
                    }
                    .background(Color.gray.opacity(0.1))
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach(viewModel.filteredItems, id: \.self) { item in
                            DepartureFlightList(flightItem: item)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    DepartureFlightView()
}
