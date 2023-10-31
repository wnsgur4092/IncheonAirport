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
                
                HStack(spacing: 10){
                    ForEach(["출발시간", "목적지","항공사","운항편명", "탑승구"], id:\.self) { type in
                        Text(type)
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 14))
                    }
                }
                .foregroundColor(.black.opacity(0.8))
                
                Rectangle()
                    .fill(.black.opacity(0.2))
                    .frame(height: 1)
                
                ScrollView(showsIndicators: false){
                    ForEach(viewModel.filteredItems, id:\.self) { item in
                        HStack(spacing: 10){
                            VStack{
                                Text(item.scheduleDateTime ?? "에러")
                                Text(item.estimatedDateTime ?? "에러")
                            }
                            .frame(maxWidth:.infinity, alignment: .center)
                            
                            
                            VStack(alignment: .center) {
                                    Text(item.airport ?? "에러")
                                    Text("(\(item.airportCode ?? "에러"))")
                                }
                            .frame(maxWidth:.infinity, alignment: .center)
                            
                            Text(item.airline ?? "에러")
                                .frame(maxWidth:.infinity, alignment: .center)
                            
                            Text(item.flightId ?? "에러")
                                .frame(maxWidth:.infinity, alignment: .center)
                            
                            Text(item.gatenumber ?? "에러")
                                .frame(maxWidth:.infinity, alignment: .center)
                        }
                        .font(.system(size: 14))
                        
                        Rectangle()
                            .fill(.black.opacity(0.2))
                            .frame(height: 1)
                    }
                    
                }
                .background{
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.yellow)
                }
                
            }
        }
    }
    //    }
}
#Preview {
    DepartureFlightView()
}
