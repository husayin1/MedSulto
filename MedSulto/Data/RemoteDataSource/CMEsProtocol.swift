//
//  CMEsAPIProtocol.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation

protocol CMEsAPIProtocol: APIClientTypeProtocol {
    func fetchAllCourses() async -> Result<CMELandingResponse, NetworkError>
    func searchForCoursesBy(name: String) async -> Result<CMELandingResponse, NetworkError>
    func fetchAllUserCertificates() async -> Result<CertificateResponse, NetworkError>
}
