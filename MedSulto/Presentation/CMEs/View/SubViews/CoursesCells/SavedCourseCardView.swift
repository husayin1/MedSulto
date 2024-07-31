//
//  SavedCourseCardView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct SavedCourseCardView: View {
    var course: Course
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: course.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 64, height: 64)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 80)
                        .clipped()
                case .failure:
                    Image("course")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 80)
                        .clipped()
                @unknown default:
                    Image("course")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 80)
                        .clipped()
                }
            }
                
            VStack(alignment: .leading, spacing: 5.0){
                Text(course.title)
                    .font(.subheadline)
                    .lineLimit(3)
                Text(course.specialties.first ?? "-")
                    .font(.subheadline)
                    .foregroundColor(Color("darkGray"))
                
            }
            .padding(.all,8)
            
        }
        .frame(width: 220)
        .background(Color.white)
        .cornerRadius(15.0)
        .shadow(radius: 5)

    }
}

