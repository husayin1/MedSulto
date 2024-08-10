//
//  ViewAllText.swift
//  MedSulto
//
//  Created by husayn on 07/08/2024.
//

import SwiftUI

struct ViewAllText: View {
    var body: some View {
        Text("View all")
            .foregroundColor(.gray)
        Image(systemName: "chevron.right")
            .foregroundColor(.gray)
    }
}

struct ViewAllText_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllText()
    }
}
