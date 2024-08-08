//
//  AppCoordinator.swift
//  MedSulto
//
//  Created by husayn on 07/08/2024.
//

import Foundation
import SwiftUI
import Stinsen

final class AppCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AppCoordinator.start)

    @Root var start = makeStart

    func makeStart() -> NavigationViewCoordinator<CMECoordinator> {
        NavigationViewCoordinator(CMECoordinator())
    }
}
