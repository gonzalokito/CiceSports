//
//  SplashProviderImpl.swift
//  CiceSport
//
//  Created by cice on 14/06/2021.
//

import Foundation
import Combine

protocol SplashProviderProtocol{
    func fetchMenu(completionHandler: @escaping (Result<ResponseMenuModel,ApiError>)-> ())
}

class SplashProviderImpl: SplashProviderProtocol {
    
    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMenu(completionHandler: @escaping (Result<ResponseMenuModel, ApiError>)-> ()){
        
        let request = RequestDTO (params: nil, method: .get, endpoint: URLEndPoint.baseURL + URLEndPoint.endpointMenu)
        
        self.provider.requestGeneric(requestDTO: request, entityClass: ResponseMenuModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            } receiveValue: { [weak self] responseMenuModel in
                guard self != nil else {return}
                completionHandler(.success(responseMenuModel))
            }.store(in: &cancellable)
        
    }
    
}
