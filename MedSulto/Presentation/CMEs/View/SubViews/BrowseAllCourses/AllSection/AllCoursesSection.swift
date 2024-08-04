//
//  AllCoursesSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct AllCoursesSection: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Browse All Courses")
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink(destination: BrowseAllCoursesView(viewModel: viewModel)){
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
                    if let courses = viewModel.allCourses {
                        ForEach(courses.prefix(3), id: \.id) { course in
                            AllCourseCardView(course: course)
                        }
                    } else if let error = viewModel.error {
                        Text("error in \(error.localizedDescription)")
                            .foregroundColor(.red)
                    } else {
                        Spacer()
                        ProgressView().foregroundColor(.blue)
                        Spacer()
                    }
                    
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}

struct AllCoursesSection_Previews: PreviewProvider {
    static var previews: some View {
        AllCoursesSection(viewModel: CMEViewModel())
    }
}
