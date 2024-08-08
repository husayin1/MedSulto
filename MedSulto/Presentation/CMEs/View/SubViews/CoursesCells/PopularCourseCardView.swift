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
            CourseImageView(courseImage: course.imageUrl,iHeight: 90)
            VStack(alignment: .leading,spacing: 5.0){
                CourseDetailsView(courseDate: course.formattedTimeStamp(date: course.date) ?? "12 Jan, 2022", courseTitle: course.title, courseSpecialtie: course.specialties.first ?? "-")
                    .padding(.all, 10)
                HStack(alignment: .lastTextBaseline){
                    CourseSubDetailsView(headerText: CourseSubDetailType.estimatedTime.rawValue, bodyText: course.formattedEstimatedTime(from: course.estimatedTime))
                    DividerRectangle()
                    CourseSubDetailsView(headerText: CourseSubDetailType.levelOfPractice.rawValue, bodyText: course.practiceLevel)
                    DividerRectangle()
                    CourseSubDetailsView(headerText: CourseSubDetailType.license.rawValue, bodyText: "\(course.license)")
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

