//
//  CMEsEntity.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation
/*
// MARK: - Main Response Model
struct CMELandingResponse: Codable {
    let data: DataContainer
    let message: String
    let errorList: [String]
}

// MARK: - Data Container
struct DataContainer: Codable {
    let popularCourses: [Course]
    let continueCourses: [Course]
    let savedCourses: [Course]
    let All: [Course]
    let pagination: Pagination
}

// MARK: - Course Model
struct Course: Codable {
    let id: Int
    let title: String
    let imageUrl: String
    let date: String
    let specialties: [String]
    let estimatedTime: Int
    let practiceLevel: String
    let license: Int
    let accreditation: Accreditation
    let hasMasterQuiz: Bool
    let currentModule: Int
    let currentModuleProgress: Int
    let currentModuleName: String?
    let totalModules: Int
    
    func formattedEstimatedTime(from seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        
        var timeString = ""
        
        if hours > 0 {
            timeString += "\(hours) Hour"
            if hours > 1 {
                timeString += "s"
            }
        }
        
        if minutes > 0 {
            if !timeString.isEmpty {
                timeString += " "
            }
            timeString += "\(minutes) Minute"
            if minutes > 1 {
                timeString += "s"
            }
        }
        
        return timeString.isEmpty ? "0 minutes" : timeString
    }
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

// MARK: - Accreditation Model
struct Accreditation: Codable {
    let body: String
    let images: [String]
}

// MARK: - Pagination Model
struct Pagination: Codable {
    let currentPage: Int
    let totalPages: Int
    let totalItems: Int
}
*/
