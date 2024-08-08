//
//  AllCourseCardView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct AllCourseCardView: View {
    var course: Course
    var body: some View {
        VStack{
            HStack{
                CourseImageView(courseImage: course.imageUrl, iHeight: 68, iWidth: 85)
                CourseDetailsView(courseDate: course.formattedTimeStamp(date: course.date) ?? "12 Jan, 2022", courseTitle: course.title, courseSpecialtie: course.specialties.first ?? "-")
                    .padding([.leading, .trailing], 16)
            }
            .frame(minWidth: 0,maxWidth: 332)
            .padding([.leading,.top,.bottom],10)
            .padding(.leading,10)
            
            VStack(alignment: .leading,spacing: 5.0){
                
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
        .padding(.all,2)
    }
}
