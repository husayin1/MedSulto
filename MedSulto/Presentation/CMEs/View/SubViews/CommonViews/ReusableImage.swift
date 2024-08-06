//
//  ReusableImage.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import SwiftUI

struct ReusableImage: View {
    var courseImage: String
    var imageHeight: CGFloat
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
                    .frame(height: imageHeight)
                    .clipped()
            case .failure:
                Image("course")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: imageHeight)
                    .clipped()
            @unknown default:
                Image("course")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: imageHeight)
                    .clipped()
            }
        }
    }
}

