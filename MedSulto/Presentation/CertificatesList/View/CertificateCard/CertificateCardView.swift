//
//  CertificateCardView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct CertificateCardView: View {
    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing){
                Image("course")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 90)
                    .clipped()
                
                Text("100 EGP")
                    .font(.caption)
                    .padding(6.0)
                    .background(Color("PrimaryShades"))
                    .cornerRadius(20.0)
                    .padding(10.0)
            }
            
            VStack(alignment: .leading,spacing: 5.0){
                VStack(alignment: .leading, spacing: 5.0){
                    Text("12 Jan, 2022")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Cancer Survivorship: Optimizing Care and Outcomes")
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    Text("Hematology-Oncology")
                        .font(.subheadline)
                        .foregroundColor(Color("darkGray"))
                    
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom,8)
                HStack(alignment: .lastTextBaseline){
                    
                    Text("Certificate valid through February 03, 2024")
                        .foregroundColor(.black.opacity(0.7))
                        .font(.system(size: 10.0))
                    Spacer()
                }
                .padding()
                .background(Color("Natural"))
            }
            
        }
        .background(Color.white)
        .cornerRadius(15.0)
        .shadow(radius: 5)
    }
}

struct CertificateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateCardView()
    }
}
