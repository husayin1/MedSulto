//
//  ViewState.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import Foundation

enum CMEViewState {
    case loading
    case loaded(DataContainer)
    case error(String)
}
