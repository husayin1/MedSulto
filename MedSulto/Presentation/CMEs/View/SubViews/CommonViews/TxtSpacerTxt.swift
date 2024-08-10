//
//  TxtSpacerTxt.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct ModulesDetails: View {
    var courseCurrentModuleName: String
    var courseCurrentModule: String
    var body: some View {
        HStack{
            Text(courseCurrentModuleName)
                .font(.headline)
            Spacer()
            Text(courseCurrentModule)
                .font(.caption)
        }
    }
}

struct TxtSpacerTxt_Previews: PreviewProvider {
    static var previews: some View {
        ModulesDetails(courseCurrentModuleName: "4", courseCurrentModule: "7")
    }
}
