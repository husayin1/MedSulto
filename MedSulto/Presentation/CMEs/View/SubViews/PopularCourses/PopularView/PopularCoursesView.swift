//
//  PopularCoursesView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct PopularCoursesView: View {
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
                                HStack{
                                    Text("Popular Courses")
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                VStack(alignment: .leading){
                                    ScrollView(.vertical,showsIndicators: false){
                                        VStack(spacing: 20){
                                            if let courses = viewModel.popularCourses {
                                                ForEach(courses, id: \.id) { course in
                                                PopularCourseCardView(course: course)
                                                }.padding(.all,4)
                                            } else if let error = viewModel.error {
                                                Text("Error \(error.localizedDescription)")
                                                    .foregroundColor(.red)
                                            } else {
                                                Spacer()
                                                ProgressView().foregroundColor(.blue)
                                                Spacer()
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

struct PopularCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCoursesView(viewModel: CMEViewModel())
    }
}
