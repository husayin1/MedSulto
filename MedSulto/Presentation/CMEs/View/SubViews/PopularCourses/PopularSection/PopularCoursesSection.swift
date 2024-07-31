//
//  PopularCoursesSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct PopularCoursesSection: View {
    @ObservedObject var viewModel: CMEViewModel

    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Popular Courses")
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink(destination: PopularCoursesView(viewModel: viewModel)) {
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
                    ForEach(viewModel.popularCourses.prefix(4), id: \.id) { course in
                        PopularCourseCardView(course: course)
                    }
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}

struct PopularCoursesSection_Previews: PreviewProvider {
    static var previews: some View {
        PopularCoursesSection(viewModel: CMEViewModel())
    }
}
