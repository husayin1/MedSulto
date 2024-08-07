//
//  LoadingView.swift
//  MedSulto
//
//  Created by husayn on 05/08/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            
            Spacer()
            ProgressView().foregroundColor(.blue)
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
