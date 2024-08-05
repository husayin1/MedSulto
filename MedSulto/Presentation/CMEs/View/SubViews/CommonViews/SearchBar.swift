//
//  SearchBar.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject private var viewModel:CMEViewModel
    @State private var inputSearchText:String = ""
    @State private var isPresented: Bool = false
    @State private var settingsDetents = PresentationDetent.medium
    init(viewModel: CMEViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        HStack{
            HStack(spacing: 15){
                TextField("What are you looking for?", text: $inputSearchText)
                    .onSubmit {
                        print("search for \(inputSearchText)")
                        if inputSearchText.isEmpty {
                            Task{
                                await viewModel.getAllCourses()
                            }
                        } else {
                            Task{
                                await viewModel.searchForCourses(inputText: inputSearchText)
                            }
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
            .onAppear{
                inputSearchText = ""
            }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(viewModel: CMEViewModel())
    }
}
