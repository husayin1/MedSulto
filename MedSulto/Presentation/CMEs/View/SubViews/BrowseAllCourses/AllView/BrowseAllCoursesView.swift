//
//  BrowseAllCoursesView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct BrowseAllCoursesView: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        BackgroundView{ geometry in
            VStack(alignment: .leading){
                Spacer()
                SearchBar(viewModel: viewModel)
                VStack{
                    RoundedRectangle(cornerRadius: 30.0)
                        .frame(height: geometry.size.height * 0.80)
                        .foregroundColor(.white)
                        .overlay(
                            VStack{
                                HeaderText(headerTxt: "All Courses")
                                VStack(alignment: .leading){
                                    ScrollView(.vertical,showsIndicators: false){
                                        VStack(spacing: 20){
                                            switch viewModel.state {
                                            case .error(let message):
                                                ErrorText(errorText: message)
                                            case .loading:
                                                LoadingView()
                                            case .loaded(let courses):
                                                ForEach(courses.All, id: \.id) { course in
                                                    AllCourseCardView(course: course)
                                                }
                                            }
                                        }.padding(.top)
                                    }
                                }.padding()
                            }
                                .padding(10)
                        )
                }
                
            }
            .navigationBarBackButtonHidden(true)
            
            
        }
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct BrowseAllCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseAllCoursesView(viewModel: CMEViewModel())
    }
}
