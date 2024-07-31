//
//  CMEViewModel.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine

class CMEViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var popularCourses: [Course] = []
    @Published var continueCourses: [Course] = []
    @Published var savedCourses: [Course] = []
    @Published var allCourses: [Course] = []
    @Published var error: NetworkError?
    @Published var courses: CMELandingResponse?
    let repository: RepositoryProtocol = Repository(networkService: APIClient())
    
    func getAllCourses() {
          repository.getAllCourses()
              .sink(receiveCompletion: { completion in
                  switch completion {
                  case .finished:
                      print("finished")
                      break
                  case .failure(let error):
                      print(error)
                  }
              }, receiveValue: {[weak self] response in
                  self?.courses = response
                  self?.popularCourses = response.data.popularCourses
                  self?.continueCourses = response.data.continueCourses
                  self?.savedCourses = response.data.savedCourses
                  self?.allCourses = response.data.All
              })
              .store(in: &cancellables)
      }
}
