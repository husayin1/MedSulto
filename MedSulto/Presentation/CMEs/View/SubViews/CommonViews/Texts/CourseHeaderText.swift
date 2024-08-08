//
//  HeaderText.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct CourseHeaderText: View {
    var headerTxt: String
    var body: some View {
        Text(headerTxt)
            .fontWeight(.semibold)
    }
}
