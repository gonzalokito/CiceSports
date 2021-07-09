//
//  RequestManager.swift
//  CiceSport
//
//  Created by cice on 07/06/2021.
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    func requestGeneric<T: Decodable>(requestDTO: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, ApiError>
}

class RequestManager: RequestManagerProtocol {
    
    internal func requestGeneric<T: Decodable>(requestDTO: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, ApiError>{
        
        let endpoint = requestDTO.endpoint
        var urlRequest = URLRequest(url: URL(string: endpoint)!)
        let headers = AppAssembly.defaultHTTPHeaders

        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)      
        }
    
        guard let urlDes = URL(string: endpoint) else {
            preconditionFailure("\(ApiError.unknow)")
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlDes)
            .receive(on: DispatchQueue.main)
            .mapError{ (error) -> ApiError in
                ApiError.unknow
            }
            .flatMap{ data, response -> AnyPublisher<T, ApiError> in
            guard let httpResponse = response as? HTTPURLResponse else {
                return Fail(error: ApiError.unknow).eraseToAnyPublisher()
            }
                if (200...299).contains(httpResponse.statusCode){
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error in
                            ApiError.unknow
                        }
                        .eraseToAnyPublisher()
                }else{
                    let error = ApiError.unknow
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher() //Liberar secuencia de llamada
    }
}
