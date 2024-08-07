//
//  CMEViewModel.swift
//  MedSulto
//
//  Created by husayn on 31/07/2024.
//

import Foundation
import Combine
import Stinsen

class CMEViewModel: ObservableObject {
    // MARK: - Router
    @RouterObject var router: NavigationRouter<CMECoordinator>?
    // MARK: - Publishers
    @Published private(set) var state: CMEViewState
    
    // MARK: - Properties
    private let repository: CMEsRepositoryProtocol
    private var cancellables: Set<AnyCancellable>
    
    init(cancellables: Set<AnyCancellable>, state: CMEViewState){
        self.repository = CMEsRepository()
        self.cancellables = cancellables
        self.state = state
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
                    print(err)
                    self?.state = .error(err.localizedDescription)
                }
            }, receiveValue: {[weak self] response in
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
                self?.state = .loaded(response.data)
            }
            .store(in: &cancellables)
    }
}
