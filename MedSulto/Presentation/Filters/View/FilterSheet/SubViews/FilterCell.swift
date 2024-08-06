//
//  FilterCell.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct FilterCell: View {
    var headerText:String
    var body: some View {
        HStack {
            Text(headerText)
            Spacer()
            Button {
                print("view all specialities")
            } label: {
                Text("View all")
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }.padding()
        
    }
}

struct FilterCell_Previews: PreviewProvider {
    static var previews: some View {
        FilterCell(headerText: "specialties")
    }
}
