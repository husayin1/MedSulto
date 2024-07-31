//
//  ContinueLearningView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct ContinueLearningView: View {
    @State var txt:String = ""
    @State var isPresented: Bool = false
    @State var settingsDetents = PresentationDetent.large
    @ObservedObject var viewModel: CMEViewModel

    var body: some View {
        BackgroundView{ geometry in
            VStack(alignment: .leading){
                Spacer()
                HStack{
                    HStack(spacing: 15){
                        TextField("What are you looking for?", text: $txt)
                        
                        Button {
                            self.isPresented = true
                            print("open sheet")
                        } label: {
                            Image("filter")
                        }
                        .padding(.trailing,8)
                        .sheet(isPresented: $isPresented, content: {
                            FilterSheet()
                                .presentationDetents([.medium,.large], selection: $settingsDetents)
                        })
                    }
                    
                    .padding(.vertical,12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding([.leading,.top,.bottom],16)
                    .padding(.trailing,4)
                    
                    NavigationLink(destination: CertificatesView()) {
                        
                        Image("certified")
                            .padding(.all,8)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing,16)
                    
                }.padding(.horizontal,10)
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
                                .padding(.all,10)
                                VStack(alignment: .leading){
                                    ScrollView(.vertical,showsIndicators: false){
                                        VStack(spacing: 20){
                                            if let courses = viewModel.continueCourses {
                                                
                                                ForEach(courses, id: \.id) { course in
                                                    ContinueLearningCardView(course: course)
                                                }
                                            } else if let error = viewModel.error {
                                                Text("Error: \(error.localizedDescription)")
                                                    .foregroundColor(.red)
                                            } else {
                                                Spacer()
                                                ProgressView()
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

struct ContinueLearningView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueLearningView(viewModel: CMEViewModel())
    }
}
