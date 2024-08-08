//
//  CertificatesViewModel.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation
import Combine

class CertificatesViewModel: ObservableObject {
    @Published private(set) var state: CertificateViewState
    
    private let repository: CMEsRepositoryProtocol
    private var cancellables: Set<AnyCancellable>

    init(cancellables: Set<AnyCancellable>, state: CertificateViewState){
        self.repository = CMEsRepository()
        self.cancellables = cancellables
        self.state = state
    }
    
    
    func getAllUserCertificates() async {
        let result = await repository.getAllUserCertificates().publisher
        result.receive(on: DispatchQueue.main)
            .sink( receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("finished")
                    break
                case .failure(let error):
                    self?.state = .error(error.localizedDescription)
                    print(error)
                }
            }, receiveValue: {[weak self] response in
                self?.state = .loaded(response.data)
            })
            .store(in: &cancellables)
    }
    
}
