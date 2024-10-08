//
//  VStackCourseDetails.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct CourseDetailsView: View {
    var courseDate: String
    var courseTitle: String
    var courseSpecialtie: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0){
            CourseDateText(courseDate: courseDate)
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
        CourseDetailsView(courseDate: "8/8/2024", courseTitle: "EVA Pharma", courseSpecialtie: "Medical")
    }
}
