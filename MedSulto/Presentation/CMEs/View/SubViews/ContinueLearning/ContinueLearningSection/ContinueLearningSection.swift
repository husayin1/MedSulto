//
//  ContinueLearningSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI
import Combine

struct ContinueLearningSection: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    CourseHeaderText(headerTxt: CoursesType.continueLearning.rawValue)
                    Spacer()
                    ViewAllButton {
                        viewModel.router?.coordinator.routeToContinueLearningCourses(viewModel: viewModel)
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
                        ForEach(courses.continueCourses, id: \.id) { course in
                            ContinueLearningCardView(course: course)
                        }
                    }
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}
