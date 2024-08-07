//
//  CourseDateText.swift
//  MedSulto
//
//  Created by husayn on 07/08/2024.
//

import SwiftUI

struct CourseDateText: View {
    var courseDate: String
    var body: some View {
        Text(courseDate)
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}

struct CourseDateText_Previews: PreviewProvider {
    static var previews: some View {
        CourseDateText(courseDate: "13 sep 2001")
    }
}
