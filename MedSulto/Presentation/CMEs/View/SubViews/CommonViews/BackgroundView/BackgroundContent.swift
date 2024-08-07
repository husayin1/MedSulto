//
//  BackgroundContent.swift
//  MedSulto
//
//  Created by husayn on 07/08/2024.
//

import SwiftUI
import Combine
struct BackgroundContent<Content: View>: View {
    @ObservedObject var viewModel: CMEViewModel
    var content: () -> Content
    init(viewModel: CMEViewModel,content:@escaping () -> Content) {
        self.content = content
        self.viewModel = viewModel
    }
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
                                self.content()
                            }
                        )
                }
                
            }
            //.navigationBarBackButtonHidden(true)
        }
    }
}

