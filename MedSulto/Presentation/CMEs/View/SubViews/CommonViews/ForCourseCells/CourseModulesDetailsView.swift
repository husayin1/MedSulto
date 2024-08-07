//
//  ModulesDetails.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct CourseModulesDetailsView: View {
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

struct ModulesDetails_Previews: PreviewProvider {
    static var previews: some View {
        CourseModulesDetailsView(courseCurrentModuleName: "4", courseCurrentModule: "7")
    }
}
