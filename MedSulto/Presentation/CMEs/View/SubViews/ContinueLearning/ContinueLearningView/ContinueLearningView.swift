//
//  ContinueLearningView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI
import Combine
struct ContinueLearningView: View {
    @ObservedObject var viewModel: CMEViewModel
    
    var body: some View {
        BackgroundContent(viewModel: viewModel) {
            VStack{
                HStack{
                    CourseHeaderText(headerTxt: CoursesType.continueLearning.rawValue)
                    Spacer()
                }
                .padding(.horizontal)
                VStack(alignment: .leading){
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing: 20){
                            switch viewModel.state {
                            case .error(let message):
                                ErrorText(errorText: message)
                            case .loading:
                                LoadingView()
                            case .loaded(let courses):
                                ForEach(courses.continueCourses, id: \.id) { course in
                                    ContinueLearningCardView(course: course)
                                }
                            }
                        }
                    }
                }
            }
            .padding(10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

