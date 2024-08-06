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
            ReusableImage(courseImage: certificate.thumbnailImage, imageHeight: 90)
            VStack(alignment: .leading,spacing: 5.0){
                VStackCourseDetails(courseDate: certificate.formattedTimeStamp(date: certificate.finishDate) ?? "Not Finished yet", courseTitle: certificate.title, courseSpecialtie: certificate.specialties.first ?? "-")
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

