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
                VStack(alignment: .leading, spacing: 5.0){
                    Text(course.formattedTimeStamp(date: course.date) ?? "12 Jan, 2022")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(course.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    Text(course.specialties.first ?? "-")
                        .font(.subheadline)
                        .foregroundColor(Color("darkGray"))
                    
                }
                .padding(.all, 10)
                
                HStack(alignment: .lastTextBaseline){
                    VStack{
                        HStack{
                            Text(course.currentModuleName ?? "Mod1")
                                .font(.headline)
                            Spacer()
                            Text("\(course.currentModule)/\(course.totalModules)")
                                .font(.caption)
                        }
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(0..<course.totalModules, id: \.self) { index in
                                    ProgressLine(percent: index < course.currentModule ? 100 : 0)
                                }
                            }
                        }
                    }
                    
                }
                .padding()
                .background(Color("Natural").opacity(0.4))
                .cornerRadius(15.0)
                HStack{
                    VStack(alignment: .leading){
                        Text("Estimated Time")
                            .font(.system(size: 10.0))
                        Text("\(course.formattedEstimatedTime(from: course.estimatedTime))")
                            .font(.system(size: 10.0))
                            .bold()
                    }
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

