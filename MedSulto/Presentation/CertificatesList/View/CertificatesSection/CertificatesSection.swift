//
//  CertificatesSection.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct CertificatesSection: View {
    var body: some View {
        VStack{
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 20){
                    CertificateCardView()
                    CertificateCardView()
                    CertificateCardView()
                    CertificateCardView()
                }
                .padding(.horizontal,10)
                .padding(.vertical,6)
            }
        }
    }
}

struct CertificatesSection_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesSection()
    }
}
