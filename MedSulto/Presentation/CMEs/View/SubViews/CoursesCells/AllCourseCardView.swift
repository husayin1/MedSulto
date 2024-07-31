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
                AsyncImage(url: URL(string: course.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 64, height: 64)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 85,height: 68)
                            .cornerRadius(7.0)
                            .clipped()
                    case .failure:
                        Image("course")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 85,height: 68)
                            .cornerRadius(7.0)
                            .clipped()
                    @unknown default:
                        Image("course")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 85,height: 68)
                            .cornerRadius(7.0)
                            .clipped()
                        
                    }
                }
                
                VStack(alignment: .leading, spacing: 8.0){
                    HStack{
                        Text(course.formattedTimeStamp(date: course.date) ?? "12 Jan, 2022")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                        /*Text("100 EGP")
                         .font(.caption)
                         .padding(6.0)
                         .background(Color("PrimaryShades"))
                         .cornerRadius(20.0)
                         .padding(10.0)*/
                    }.padding([.bottom,.trailing],-10)
                    
                    Text(course.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    Text(course.specialties.first ?? "-")
                        .font(.subheadline)
                        .foregroundColor(Color("darkGray"))
                    
                }
                .padding([.leading, .trailing], 16)
                
                
            }
            .frame(minWidth: 0,maxWidth: 332)
            .padding([.leading,.top,.bottom],10)
            .padding(.leading,10)
            
            VStack(alignment: .leading,spacing: 5.0){
                
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
        .padding(.all,2)
    }
}
