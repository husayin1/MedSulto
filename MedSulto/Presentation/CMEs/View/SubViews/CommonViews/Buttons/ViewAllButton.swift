//
//  ViewAllButton.swift
//  MedSulto
//
//  Created by husayn on 07/08/2024.
//

import SwiftUI

struct ViewAllButton: View {
    var callBack: ()->Void?
    var body: some View {
        Button {
            callBack()
        } label: {
            ViewAllText()
        }
    }
}

struct ViewAllButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllButton(callBack: {})
    }
}
