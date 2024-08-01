//
//  CertificateCardView.swift
//  MedSulto
//
//  Created by husayn on 30/07/2024.
//

import SwiftUI

struct CertificateCardView: View {
    var certificate: CertificateItem
    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing){
                AsyncImage(url: URL(string: certificate.thumbnailImage)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 64, height: 64)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 90)
                            .clipped()
                    case .failure:
                        Image("course")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 90)
                            .clipped()
                    @unknown default:
                    Image("course")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 90)
                        .clipped()
                    }
                }
                    
                /*
                Text("100 EGP")
                    .font(.caption)
                    .padding(6.0)
                    .background(Color("PrimaryShades"))
                    .cornerRadius(20.0)
                    .padding(10.0)*/
            }
            
            VStack(alignment: .leading,spacing: 5.0){
                VStack(alignment: .leading, spacing: 5.0){
                    Text(certificate.formattedTimeStamp(date: certificate.finishDate) ?? "Not Finished yet")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(certificate.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    Text(certificate.specialties.first ?? "-")
                        .font(.subheadline)
                        .foregroundColor(Color("darkGray"))
                    
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom,8)
                HStack(alignment: .lastTextBaseline){
                    
                    Text("Certificate valid through \(certificate.formattedTimeStamp(date: certificate.finishDate) ?? "Not Finished yet")")
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

