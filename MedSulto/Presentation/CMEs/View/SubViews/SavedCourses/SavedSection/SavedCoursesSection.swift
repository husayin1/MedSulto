//
//  SavedCoursesSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct SavedCoursesSection: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Saved Courses")
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        print("view all saved courses")
                    } label: {
                        Text("View all")
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.top,30)
                .padding(.horizontal,10)
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(viewModel.savedCourses.prefix(3), id: \.id) { course in
                        SavedCourseCardView(course: course)
                    }
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}

struct SavedCoursesSection_Previews: PreviewProvider {
    static var previews: some View {
        SavedCoursesSection(viewModel: CMEViewModel())
    }
}
