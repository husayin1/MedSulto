//
//  VStackCourseDetails.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct VStackCourseDetails: View {
    var courseDate: String
    var courseTitle: String
    var courseSpecialtie: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0){
            Text(courseDate)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(courseTitle)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(2)
            
            Text(courseSpecialtie)
                .font(.subheadline)
                .foregroundColor(Color("darkGray"))
            
        }
        
    }
}

struct VStackCourseDetails_Previews: PreviewProvider {
    static var previews: some View {
        VStackCourseDetails(courseDate: "8/8/2024", courseTitle: "EVA Pharma", courseSpecialtie: "Medical")
    }
}
