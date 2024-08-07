//
//  PopularCoursesSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI
import Combine
struct PopularCoursesSection: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    CourseHeaderText(headerTxt: CoursesType.popular.rawValue)
                    Spacer()
                    ViewAllButton{
                        viewModel.router?.coordinator.routeToPopularCourses(viewModel: viewModel)
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
                        ForEach(courses.popularCourses.prefix(4), id: \.id) { course in
                            PopularCourseCardView(course: course)
                        }
                    }
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}

