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
    @Published private(set) var courses: CMELandingResponse?
    private let repository: CMEsRepositoryProtocol
    @Published private(set) var state: ViewState = .loading
    
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
                    self?.state = .error(err.localizedDescription)
                }
            }, receiveValue: {[weak self] response in
                self?.courses = response
                self?.state = .loaded(response.data)
            })
            .store(in: &cancellables)
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
                    self?.state = .error(err.localizedDescription)
                }
            } receiveValue: { [weak self] response in
                self?.courses = response
                self?.state = .loaded(response.data)
            }
            .store(in: &cancellables)
    }
}
