//
//  Utils.swift
//  CiceSport
//
//  Created by cice on 07/06/2021.
//

import Foundation

enum ApiError: Error, LocalizedError{
    case unknow, apiError(reason: String)
    var errorDescription: String?{
        switch self {
        case .unknow:
            return "Unknown error"
        case .apiError(let error):
            return error
        }
    }
}

enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}

struct RequestDTO {
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethods
    var endpoint: String
    
    init(params: [String: Any],method: HTTPMethods, endpoint: String){
        self.params=params
        self.method=method
        self.endpoint=endpoint
    }
    init(arrayParams: [[String: Any]]?,method: HTTPMethods, endpoint: String){
        self.arrayParams=arrayParams
        self.method=method
        self.endpoint=endpoint
    }
}

struct URLEndPoint {
    
    static let baseURL = "https://app-cicesport-123.herokuapp.com/"
    
    static let endpointMenu = "iCoMenuResponse"
}

struct AuthHerokus{
    static let authHeroku = "Bearer 12345678"
}

