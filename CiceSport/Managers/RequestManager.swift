//
//  RequestManager.swift
//  CiceSport
//
//  Created by cice on 07/06/2021.
//

import Foundation        //****9+ºb
import Combine

class RequestManager {
    
    internal func requestGeneric<T: Decodable>(requestDTO: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, ApiError>{
        
        let baseURL = ""
    
    }
}
