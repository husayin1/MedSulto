//
//  BackgroundView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    var content: (GeometryProxy) -> Content
    init(content:@escaping (GeometryProxy) -> Content) {
        self.content = content
    }
    var body: some View {
        
            GeometryReader{ geomerty in
                ZStack{
                    Color("PrimaryVariant")
                    self.content(geomerty)

                }
            }
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView{ geometry in
            Text("Hello World")
                .foregroundColor(.white)
        }
    }
}
