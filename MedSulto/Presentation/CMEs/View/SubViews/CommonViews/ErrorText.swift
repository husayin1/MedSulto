//
//  ErrorText.swift
//  MedSulto
//
//  Created by husayn on 05/08/2024.
//

import SwiftUI

struct ErrorText: View {
    @State var errorText:String
    var body: some View {
        VStack{
            Spacer()
            Text("Error \(errorText)")
                .foregroundColor(.red)
            Spacer()
        }
    }
}

struct ErrorText_Previews: PreviewProvider {
    static var previews: some View {
        ErrorText(errorText: "Cant find data")
    }
}
