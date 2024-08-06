//
//  PopularCourseCardView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct PopularCourseCardView: View {
    var course: Course
    var body: some View {
        VStack{
            ReusableImage(courseImage: course.imageUrl,imageHeight: 90)
            VStack(alignment: .leading,spacing: 5.0){
                VStackCourseDetails(courseDate: course.formattedTimeStamp(date: course.date) ?? "12 Jan, 2022", courseTitle: course.title, courseSpecialtie: course.specialties.first ?? "-")
                .padding(.all, 10)
                HStack(alignment: .lastTextBaseline){
                    SubCell(headerText: "Estimated time", bodyText: course.formattedEstimatedTime(from: course.estimatedTime))
                    DividerRectangle()
                    SubCell(headerText: "Level of practice", bodyText: course.practiceLevel)
                    DividerRectangle()
                    SubCell(headerText: "License", bodyText: "\(course.license)")
                }
                .padding()
                .background(Color("Natural"))
            }
            
        }
        .background(Color.white)
        .cornerRadius(15.0)
        .shadow(radius: 5)
        
    }
}

