//
//  CertificatesViewModel.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation
import Combine

class CertificatesViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable>
    @Published private(set) var userCertificates: [CertificateItem]?
    private let repository: CMEsRepositoryProtocol
    @Published private(set) var state: CertificateViewState = .loading
    
    init(){
        self.repository = CMEsRepository()
        self.cancellables = Set<AnyCancellable>()
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
                self?.userCertificates = response.data.items
                self?.state = .loaded(response.data)
            })
            .store(in: &cancellables)
    }
    
}
