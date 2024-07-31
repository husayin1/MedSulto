//
//  ProgressLine.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct ProgressLine: View {
    var width: CGFloat = 32.0
    var height: CGFloat = 4.0
    var percent: CGFloat = 69.0
    var body: some View {
        ZStack(alignment: .leading){
            let multiplier = width / 100
            RoundedRectangle(cornerRadius: 20,style:  .continuous)
                .frame(width: width,height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 20,style:  .continuous)
                .frame(width: percent * multiplier,height: height)
                .background(
                    Color("Primary")
                        .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
                ).foregroundColor(.clear)
            
        }
    }
}

struct ProgressLine_Previews: PreviewProvider {
    static var previews: some View {
        ProgressLine()
    }
}
