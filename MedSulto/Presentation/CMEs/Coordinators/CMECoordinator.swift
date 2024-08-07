//
//  MainCoordinator.swift
//  MedSulto
//
//  Created by husayn on 06/08/2024.
//

import Foundation
import Stinsen
import SwiftUI
import Combine
final class CMECoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \CMECoordinator.start)
    lazy var routerStorable: CMECoordinator = self
    
    @Root var start = makeCME
    @ViewBuilder private func makeCME() -> some View {
        MainView()
    }
    
    @Route(.push) var popularCourses = makePopularCourses
    @ViewBuilder private func makePopularCourses(viewMdeol: CMEViewModel) -> some View {
        PopularCoursesView(viewModel: viewMdeol)
    }
    func routeToPopularCourses(viewModel: CMEViewModel){
        self.route(to: \.popularCourses,viewModel)
    }
    
    @Route(.push) var continueLearning = makeContinueLearning
    @ViewBuilder private func makeContinueLearning(viewModel: CMEViewModel) -> some View {
        ContinueLearningView(viewModel: viewModel)
    }
    func routeToContinueLearningCourses(viewModel: CMEViewModel){
        self.route(to: \.continueLearning,viewModel)
    }
    
    @Route(.push) var allCourses = makeAllCourses
    @ViewBuilder private func makeAllCourses(viewModel: CMEViewModel) -> some View {
        BrowseAllCoursesView(viewModel: viewModel)
    }
    func routeToAllCourses(viewModel: CMEViewModel){
        self.route(to: \.allCourses, viewModel)
    }
    
    @Route(.push) var certificates = makeCertificates
    @ViewBuilder private func makeCertificates() -> some View {
        CertificatesView()
    }
    func routeToCertificates(){
        self.route(to: \.certificates)
    }
}
