//
//  CertificatesSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct CertificatesSection: View {
    @ObservedObject var viewModel: CertificatesViewModel
    var body: some View {
        VStack{
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 20){
                    if let certificates = viewModel.userCertificates {
                        ForEach(certificates, id: \.id) { certificate in
                            CertificateCardView(certificate: certificate)
                        }.padding(.all,4)
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

struct CertificatesSection_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesSection(viewModel: CertificatesViewModel())
    }
}
