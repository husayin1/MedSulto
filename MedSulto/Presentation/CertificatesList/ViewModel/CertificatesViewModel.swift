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
    @Published var userCertificates: [CertificateItem]?
    @Published var error: NetworkError?
    private let repository: CMEsRepositoryProtocol
    
    init(){
        self.repository = CMEsRepository()
        self.cancellables = Set<AnyCancellable>()
    }
    
    
    func getAllUserCertificates() async {
        do{
            let result = try await repository.getAllUserCertificates().publisher
            result.receive(on: DispatchQueue.main)
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
            
            
            /*
             switch result {
             case .success(let response):
             DispatchQueue.main.async { [weak self] in
             self?.userCertificates = response.data.items
             }
             case .failure(let err):
             DispatchQueue.main.async { [weak self] in
             self?.error = err
             }
             }*/
        } catch {
            print("Error fetching user certificates")
        }
        /*
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
         .store(in: &cancellables)*/
    }
    
}
