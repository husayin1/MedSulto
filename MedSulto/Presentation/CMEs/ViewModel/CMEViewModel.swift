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
    @Published var popularCourses: [Course]?
    @Published var continueCourses: [Course]?
    @Published var savedCourses: [Course]?
    @Published var allCourses: [Course]?
    @Published var error: NetworkError?
    @Published var courses: CMELandingResponse?
    private let repository: CMEsRepositoryProtocol
    
    init(){
        self.repository = CMEsRepository()
        self.cancellables = Set<AnyCancellable>()
        
    }
    
    
    func getAllCourses() async {
        do {
            let result = try await repository.getAllCourses().publisher
            result.receive(on: DispatchQueue.main)
                .sink(receiveCompletion: {[weak self] completion in
                    switch completion {
                    case .finished:
                        print("finished")
                        break
                    case .failure(let err):
                        self?.error = err
                        print(self?.error)
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
        } catch {
            print("Error fetching all courses")
        }
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
        do {
            let result = try await repository.getSearchResult(name: inputText).publisher
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
        } catch {
            print("Error on searching for courses")
        }
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
