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
            ZStack(alignment: .topTrailing){
                AsyncImage(url: URL(string: course.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 64, height: 64)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 90)
                            .clipped()
                    case .failure:
                        Image("course")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 90)
                            .clipped()
                    @unknown default:
                        Image("course")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 90)
                            .clipped()
                    }
                }
                    
                
                /*Text("100 EGP")
                    .font(.caption)
                    .padding(6.0)
                    .background(Color("PrimaryShades"))
                    .cornerRadius(20.0)
                    .padding(10.0)*/
            }
            
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
                .padding([.leading, .trailing], 16)
                .padding(.bottom,8)
                HStack(alignment: .lastTextBaseline){
                    VStack(alignment: .leading) {
                        Text("Estimated time")
                            .font(.caption2)
                        Text(course.formattedEstimatedTime(from: course.estimatedTime))
                            .font(.system(size: 10.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Rectangle()
                        .frame(width: 0.5,height: 20.17)
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Level of practice")
                            .font(.caption2)
                        Text(course.practiceLevel)
                            .font(.system(size: 10.0))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 0.5,height: 20.17)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("License")
                            .font(.caption2)
                        Text("\(course.license)")
                            .font(.system(size: 10.0))
                            .fontWeight(.bold)
                    }
                    
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

