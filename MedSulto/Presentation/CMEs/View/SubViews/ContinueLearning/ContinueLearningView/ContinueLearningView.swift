//
//  ContinueLearningView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct ContinueLearningView: View {
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
                                HeaderText(headerTxt: "Continue Learning Courses")

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

struct ContinueLearningView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueLearningView(viewModel: CMEViewModel())
    }
}
