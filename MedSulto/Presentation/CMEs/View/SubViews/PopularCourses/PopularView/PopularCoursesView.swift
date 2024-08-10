//
//  PopularCoursesView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI
import Combine

struct PopularCoursesView: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        BackgroundContent(viewModel: viewModel) {
            VStack{
                HStack{
                    CourseHeaderText(headerTxt: CoursesType.popular.rawValue)
                    Spacer()
                }.padding(.horizontal)
                VStack(alignment: .leading){
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing: 12){
                            switch viewModel.state {
                            case .loading:
                                LoadingView()
                            case .error(let message):
                                ErrorText(errorText: message)
                            case .loaded(let courses):
                                ForEach(courses.popularCourses, id: \.id) { course in
                                    PopularCourseCardView(course: course)
                                }.padding(.all,4)
                            }
                        }
                    }
                }
            }
            .padding(16)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

