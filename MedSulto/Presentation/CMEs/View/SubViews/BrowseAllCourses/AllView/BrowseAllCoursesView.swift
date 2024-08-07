//
//  BrowseAllCoursesView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI
import Combine
struct BrowseAllCoursesView: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        BackgroundContent(viewModel: viewModel){
            VStack{
                HStack{
                    CourseHeaderText(headerTxt: CoursesType.all.rawValue)
                    Spacer()
                }.padding(.horizontal)
                VStack(alignment: .leading){
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing: 20){
                            switch viewModel.state {
                            case .error(let message):
                                ErrorText(errorText: message)
                            case .loading:
                                LoadingView()
                            case .loaded(let courses):
                                ForEach(courses.all, id: \.id) { course in
                                    AllCourseCardView(course: course)
                                }
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
