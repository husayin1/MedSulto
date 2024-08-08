//
//  FilterSheetHeader.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct FilterSheetHeader: View {
    var body: some View {
        HStack {
            Text("Filters").font(.headline)
            Spacer()
            Button {
                print("Reset Filters")
            } label: {
                Text("Reset")
                    .foregroundColor(.black)
            }
        }
        .padding()
        
    }
}

struct FilterSheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        FilterSheetHeader()
    }
}
