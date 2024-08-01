//
//  CertificatesView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct CertificatesView: View {
    @StateObject var viewModel = CertificatesViewModel()
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
                                VStack(alignment: .leading){
                                    ScrollView(.vertical,showsIndicators: false){
                                        CertificatesSection(viewModel: viewModel)
                                    }
                                }
                            }
                                .padding(10)
                        )
                }
                
            }                    .navigationBarBackButtonHidden(true)

            
        }
        .navigationBarItems(leading: CustomBackButton())
        .onAppear{
            viewModel.getAllUserCertificates()
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
