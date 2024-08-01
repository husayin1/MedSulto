//
//  MainView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = CMEViewModel()
    @State private var inputSearchText:String = ""
    @State private var isPresented: Bool = false
    @State private var settingsDetents = PresentationDetent.medium
    
    var body: some View {
        NavigationView {
            BackgroundView{ geometry in
                VStack{
                    Spacer()
                    HStack{
                        HStack(spacing: 15){
                            TextField("What are you looking for?", text: $inputSearchText)
                                .onSubmit {
                                    print("search for \(inputSearchText)")
                                    if inputSearchText.isEmpty {
                                        viewModel.getAllCourses()
                                    } else {
                                        viewModel.searchForCourses(inputText: inputSearchText)
                                    }
                                }
                            
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
                                ScrollView(.vertical, showsIndicators: false){
                                    VStack(alignment: .leading){
                                        if let _ = viewModel.courses {
                                            PopularCoursesSection(viewModel: viewModel)
                                            ContinueLearningSection(viewModel: viewModel)
                                            SavedCoursesSection(viewModel: viewModel)
                                            AllCoursesSection(viewModel: viewModel)
                                        } else if let error = viewModel.error {
                                            Text("Error: \(error.localizedDescription)").foregroundColor(.red)
                                        } else {
                                            Spacer()
                                            ProgressView()
                                            Spacer()
                                        }
                                    }
                                }
                                    .padding(10)
                            )
                    }
                    
                }
                
            }.onAppear{
                viewModel.getAllCourses()
                inputSearchText = ""
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
