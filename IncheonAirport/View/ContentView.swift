//
//  ContentView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//

import SwiftUI

enum Terminal: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case all = "전체"
    case terminal1 = "제 1 터미널"
    case terminal2 = "제 2 터미널"
}


struct ContentView: View {
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
                    
                    HStack {
                        Text(selectedTerminal.rawValue)
                        Button {
                            withAnimation {
                                showingSelection.toggle()
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                                .rotationEffect(.degrees(showingSelection ? 180 : 0))
                        }
                    }
                }
                
                if showingSelection {
                    VStack(spacing: 0) {
                        ForEach(Terminal.allCases, id: \.self) { terminal in
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
                        }
                    }
                    .background(Color.gray.opacity(0.1))
                }
                
                HStack(spacing: 12){
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
                        HStack(spacing: 12){
                            VStack{
                                Text(item.scheduleDateTime ?? "에러")
                                Text(item.estimatedDateTime ?? "에러")
                            }
                            .frame(maxWidth:.infinity, alignment: .center)
                            
                            
                            VStack{
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
    }
}
