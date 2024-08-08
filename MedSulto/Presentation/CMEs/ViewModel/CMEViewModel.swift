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
    @RouterObject private var router: NavigationRouter<CMECoordinator>?
    // MARK: - Publishers
    @Published private(set) var state: CMEViewState
    
    // MARK: - Properties
    private let repository: CMEsRepositoryProtocol
    private var cancellables: Set<AnyCancellable>
    let didTapOn = PassthroughSubject<Routes,Never>()
    
    enum Routes {
        case viewAllCourses
        case viewPopularCourses
        case viewContinueLearningCourses
        case viewCertificates
    }

    
    init(cancellables: Set<AnyCancellable>, state: CMEViewState){
        self.repository = CMEsRepository()
        self.cancellables = cancellables
        self.state = state
        self.setupObserver()
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
    
    func setupObserver(){
        didTapOn.sink { [weak self] route in
            guard let self = self else { return }
            switch route{
            case .viewCertificates:
                self.router?.coordinator.routeToCertificates()
            case .viewPopularCourses:
                self.router?.coordinator.routeToPopularCourses(viewModel: self)
            case .viewContinueLearningCourses:
                self.router?.coordinator.routeToContinueLearningCourses(viewModel: self)
            case .viewAllCourses:
                self.router?.coordinator.routeToAllCourses(viewModel: self)
            }
        }
        .store(in: &cancellables)
        
    }
    
}
