//
//  CMEViewModel.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine

class CMEViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable>
    @Published private(set) var popularCourses: [Course]?
    @Published private(set) var continueCourses: [Course]?
    @Published private(set) var savedCourses: [Course]?
    @Published private(set) var allCourses: [Course]?
    @Published private(set) var error: NetworkError?
    @Published private(set) var courses: CMELandingResponse?
    private let repository: CMEsRepositoryProtocol
    
    init(){
        self.repository = CMEsRepository()
        self.cancellables = Set<AnyCancellable>()
        
    }
    
    
    func getAllCourses() async {
            let result = await repository.getAllCourses().publisher
            result.receive(on: DispatchQueue.main)
                .sink(receiveCompletion: {[weak self] completion in
                    switch completion {
                    case .finished:
                        print("finished")
                        break
                    case .failure(let err):
                        self?.error = err
                    }
                }, receiveValue: {[weak self] response in
                    self?.courses = response
                    self?.popularCourses = response.data.popularCourses
                    self?.continueCourses = response.data.continueCourses
                    self?.savedCourses = response.data.savedCourses
                    self?.allCourses = response.data.All
                })
                .store(in: &cancellables)
            
            /* switch result {
             case .success(let response):
             
             //                DispatchQueue.main.async { [weak self] in
             self?.courses = response
             self?.popularCourses = response.data.popularCourses
             self?.continueCourses = response.data.continueCourses
             self?.savedCourses = response.data.savedCourses
             self?.allCourses = response.data.All
             //                }
             case .failure(let err):
             DispatchQueue.main.async { [weak self] in
             self?.error = err
             }
             
             }*/
        /*
         repository.getAllCourses()
         .sink(receiveCompletion: {[weak self] completion in
         switch completion {
         case .finished:
         print("finished")
         break
         case .failure(let err):
         self?.error = err
         print(error)
         }
         }, receiveValue: {[weak self] response in
         self?.courses = response
         self?.popularCourses = response.data.popularCourses
         self?.continueCourses = response.data.continueCourses
         self?.savedCourses = response.data.savedCourses
         self?.allCourses = response.data.All
         })
         .store(in: &cancellables)*/
    }
    
    func searchForCourses(inputText: String) async {
            let result = await repository.getSearchResult(name: inputText).publisher
            result
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("result is here")
                    case .failure(let err):
                        self?.error = err
                        print(err, "on search")
                    }
                } receiveValue: { [weak self] response in
                    self?.courses = response
                    self?.popularCourses = response.data.popularCourses
                    self?.continueCourses = response.data.continueCourses
                    self?.savedCourses = response.data.savedCourses
                    self?.allCourses = response.data.All
                }
                .store(in: &cancellables)
            /*
             switch result {
             case .success(let response):
             DispatchQueue.main.async { [weak self] in
             self?.courses = response
             self?.popularCourses = response.data.popularCourses
             self?.continueCourses = response.data.continueCourses
             self?.savedCourses = response.data.savedCourses
             self?.allCourses = response.data.All
             }
             case .failure(let err):
             DispatchQueue.main.async { [weak self] in
             self?.error = err
             }
             
             }*/
        /*
         repository.getSearchResult(name: inputText)
         .sink { [weak self] completion in
         switch completion {
         case .finished:
         print("result is here")
         case .failure(let err):
         self?.error = err
         print(err, "on search")
         }
         } receiveValue: { [weak self] response in
         self?.courses = response
         self?.popularCourses = response.data.popularCourses
         self?.continueCourses = response.data.continueCourses
         self?.savedCourses = response.data.savedCourses
         self?.allCourses = response.data.All
         }
         .store(in: &cancellables)*/
        
    }
}
