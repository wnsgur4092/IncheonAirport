//
//  ContentView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 20/9/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = DepartResponseViewModel()
    
    var uniqueTerminalNames: [String] {
        let terminalNames = viewModel.items.map { $0.terminalName }
        return ["전체"] + Array(Set(terminalNames)).sorted()
    }
    
    @State private var selectedTerminal = "전체"
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("여객 출발시간표")
                
                Picker("Select Terminal", selection: $selectedTerminal) {
                    ForEach(uniqueTerminalNames, id: \.self) { terminal in
                        Text(terminal).tag(terminal)
                    }
                }
                .pickerStyle(.segmented)
                
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
                    ForEach(viewModel.items, id:\.self) { item in
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
        .padding()
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
