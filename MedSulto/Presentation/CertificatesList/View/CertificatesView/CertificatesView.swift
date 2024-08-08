//
//  CertificatesView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI
import Combine
struct CertificatesView: View {
    @StateObject var viewModel = CertificatesViewModel(cancellables: Set<AnyCancellable>(), state: .loading)
    var body: some View {
        BackgroundView{ geometry in
            VStack(alignment: .leading){
                Spacer()
                Text("Certificates")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                VStack{
                    RoundedRectangle(cornerRadius: 30.0)
                        .frame(height: geometry.size.height * 0.80)
                        .foregroundColor(.white)
                        .overlay(
                            ScrollView(.vertical, showsIndicators: false){
                                switch viewModel.state {
                                case .error(let message):
                                    ErrorText(errorText: message)
                                case .loading:
                                    LoadingView()
                                case .loaded(_):
                                    VStack(alignment: .leading){
                                        ScrollView(.vertical,showsIndicators: false){
                                            CertificatesSection(viewModel: viewModel)
                                        }
                                    }
                                }
                            }
                            .padding(10)
                        )
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarItems(leading: CustomBackButton())
        .onAppear{
            Task{
                await viewModel.getAllUserCertificates()
                
            }
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
