//
//  ContentView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AppCoordinator().view()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
