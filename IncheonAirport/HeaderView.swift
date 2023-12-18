//
//  HeaderView.swift
//  IncheonAirport
//
//  Created by JunHyuk Lim on 18/12/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("IncheonAirport")
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.vertical, 10)
    }
}
#Preview {
    HeaderView()
}
