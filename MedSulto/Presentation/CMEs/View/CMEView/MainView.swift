//
//  MainView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = CMEViewModel()
    var body: some View {
        NavigationView {
            BackgroundView{ geometry in
                VStack{
                    Spacer()
                    SearchBar(viewModel: viewModel)
                    VStack{
                        RoundedRectangle(cornerRadius: 30.0)
                            .frame(height: geometry.size.height * 0.80)
                            .foregroundColor(.white)
                            .overlay(
                                ScrollView(.vertical, showsIndicators: false){
                                    VStack(alignment: .leading){
                                        if let _ = viewModel.courses {
                                            PopularCoursesSection(viewModel: viewModel)
                                            ContinueLearningSection(viewModel: viewModel)
                                            SavedCoursesSection(viewModel: viewModel)
                                            AllCoursesSection(viewModel: viewModel)
                                        } else if let error = viewModel.error {
                                            ErrorText(errorText: error.localizedDescription)

                                        } else {
                                            LoadingView()
                                        }
                                    }
                                }
                                    .padding(10)
                            )
                    }
                    
                }
                
            }.onAppear{
                Task{
                    await viewModel.getAllCourses()
                }
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
