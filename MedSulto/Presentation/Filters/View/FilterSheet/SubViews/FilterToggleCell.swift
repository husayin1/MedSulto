//
//  FilterToggleCell.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct FilterToggleCell: View {
    var textHeader: String
    var textBody: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Text(textHeader)
                    Spacer()
                    Toggle(isOn: $isOn){
                        
                    }
                }
                Text(textBody)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }.padding()
        
    }
}

struct FilterToggleCell_Previews: PreviewProvider {
    static var previews: some View {
        FilterToggleCell(textHeader: "Free courses only", textBody: "Some of the courses come with a price tag, and you need to pay in order to enroll and participate.", isOn: .constant(false))
    }
}
