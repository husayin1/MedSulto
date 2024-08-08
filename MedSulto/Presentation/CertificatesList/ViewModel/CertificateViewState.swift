//
//  CertificateViewState.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import Foundation
enum CertificateViewState {
    case loading
    case loaded(Certificates)
    case error(String)
}
