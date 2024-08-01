//
//  CertificatesViewModel.swift
//  MedSulto
//
//  Created by husayn on 01/08/2024.
//

import Foundation
import Combine

class CertificatesViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var userCertificates: [CertificateItem]?
    @Published var error: NetworkError?
    private let repository: CMEsRepositoryProtocol
    
    init(){
        self.repository = CMEsRepository()
    }

    
    func getAllUserCertificates() {
          repository.getAllUserCertificates()
              .sink(receiveCompletion: { completion in
                  switch completion {
                  case .finished:
                      print("finished")
                      break
                  case .failure(let error):
                      print(error)
                  }
              }, receiveValue: {[weak self] response in
                  self?.userCertificates = response.data.items
                  
              })
              .store(in: &cancellables)
      }
    
}
