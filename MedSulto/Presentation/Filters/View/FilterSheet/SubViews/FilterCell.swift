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
            ViewAllButton(callBack: {print ("Filter Cell")})
        }.padding()
        
    }
}

struct FilterCell_Previews: PreviewProvider {
    static var previews: some View {
        FilterCell(headerText: "specialties")
    }
}
