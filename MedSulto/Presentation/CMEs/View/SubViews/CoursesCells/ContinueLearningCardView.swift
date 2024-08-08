//
//  ContinueLearningCardView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct ContinueLearningCardView: View {
    var course: Course
    var body: some View {
        VStack{
            VStack(alignment: .leading,spacing: 5.0){
                CourseDetailsView(
                    courseDate: course.formattedTimeStamp(date: course.date) ?? "12 Jan, 2022",
                    courseTitle: course.title,
                    courseSpecialtie: course.specialties.first ?? "-"
                )
                .padding(.all, 10)
                HStack(alignment: .lastTextBaseline){
                    VStack{
                        CourseModulesDetailsView(courseCurrentModuleName: course.currentModuleName ?? "Mod1", courseCurrentModule: "\(course.currentModule)/\(course.totalModules)")
                        HStack{
                            ForEach(0..<course.totalModules, id: \.self) { index in
                                ProgressLine(percent: index < course.currentModule ? 100 : 0)
                            }
                        }
                    }
                }
                .padding()
                .background(Color("Natural").opacity(0.4))
                .cornerRadius(15.0)
                HStack{
                    CourseSubDetailsView(
                        headerText: CourseSubDetailType.estimatedTime.rawValue,
                        bodyText:"\(course.formattedEstimatedTime(from: course.estimatedTime))"
                    )
                    Spacer()
                    Button {
                        print("Continue Learning")
                    } label: {
                        Text("Continue Learning")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                            .bold()
                            .padding()
                            .background(Color("PrimaryShades"))
                            .cornerRadius(25.0)
                    }
                    
                }.padding([.top,.bottom], 10)
                    .padding(.horizontal,4)
            }
        }
        .frame(width: 300)
        .background(Color.white)
        
    }
}

