//
//  DividerRectangle.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct DividerRectangle: View {
    var body: some View {
        Spacer()
        Rectangle()
            .frame(width: 0.5,height: 20.17)
        Spacer()
    }
}

struct DividerRectangle_Previews: PreviewProvider {
    static var previews: some View {
        DividerRectangle()
    }
}
