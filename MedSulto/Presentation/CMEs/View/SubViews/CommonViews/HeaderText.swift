//
//  HeaderText.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct HeaderText: View {
    var headerTxt: String
    var body: some View {
            HStack{
                Text(headerTxt)
                    .fontWeight(.semibold)
                Spacer()
                
            }
            .padding(.horizontal,10)
    }
}
