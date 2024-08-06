//
//  ImageWithHeightAndWidth.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct ImageWithHeightAndWidth: View {
    var courseImage: String
    var iWidth: CGFloat
    var iHeight: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: courseImage)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 64, height: 64)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: iWidth,height: iHeight)
                    .cornerRadius(7.0)
                    .clipped()
            case .failure:
                Image("course")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: iWidth,height: iHeight)
                    .cornerRadius(7.0)
                    .clipped()
            @unknown default:
                Image("course")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: iWidth,height: iHeight)
                    .cornerRadius(7.0)
                    .clipped()
                
            }
        }
    }
}
