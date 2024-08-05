//
//  ContinueLearningSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct ContinueLearningSection: View {
    @ObservedObject var viewModel: CMEViewModel
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Continue Learning")
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink {
                        ContinueLearningView(viewModel: viewModel)
                    } label: {
                        Text("View all")
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.top,30)
                .padding(.horizontal,10)
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 20){
                    
                    if let courses = viewModel.continueCourses {
                        ForEach(courses, id: \.id) { course in
                            ContinueLearningCardView(course: course)
                        }
                    } else if let error = viewModel.error {
                        ErrorText(errorText: error.localizedDescription)
                    } else {
                        LoadingView()
                    }
                    
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}

struct ContinueLearningSection_Previews: PreviewProvider {
    static var previews: some View {
        ContinueLearningSection(viewModel: CMEViewModel())
    }
}
