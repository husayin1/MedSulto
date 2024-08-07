//
//  SavedCoursesSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI
import Combine

struct SavedCoursesSection: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    CourseHeaderText(headerTxt: CoursesType.saved.rawValue)
                    Spacer()
                    ViewAllButton {
                        print("View All Saved Courses")
                    }
                }
                .padding(.top,30)
                .padding(.horizontal,10)
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 20){
                    switch viewModel.state {
                    case .loading:
                        LoadingView()
                    case .error(let message):
                        ErrorText(errorText: message)
                    case .loaded(let courses):
                        ForEach(courses.SavedCourses.prefix(3), id: \.id) { course in
                            SavedCourseCardView(course: course)
                        }
                    }
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}
