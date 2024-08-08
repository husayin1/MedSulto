//
//  CertificatesModel.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation

// MARK: - CertificateResponse
struct CertificateResponse: Codable {
    let data: Certificates
    let message: String?
    let errorList: [String]?
}

// MARK: - Certificates
struct Certificates: Codable {
    let items: [CertificateItem]
    let pagination: Pagination
}

// MARK: - Item
struct CertificateItem: Codable {
    let id: Int
    let title: String
    let thumbnailImage: String
    let finishDate: String
    let specialties: [String]
    
    func formattedTimeStamp(date timestampString: String) -> String? {
        guard let timestamp = Int(timestampString) else {
            print("Invalid timestamp")
            return nil
        }
        
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
}
