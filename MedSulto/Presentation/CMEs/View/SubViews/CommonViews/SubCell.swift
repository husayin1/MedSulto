//
//  SubCell.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct SubCell: View {
    var headerText: String
    var bodyText: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(headerText)
                .font(.caption2)
            Text(bodyText)
                .font(.system(size: 10.0))
                .fontWeight(.bold)
        }
    }
}

struct SubCell_Previews: PreviewProvider {
    static var previews: some View {
        SubCell(headerText: "body", bodyText: "header")
    }
}
