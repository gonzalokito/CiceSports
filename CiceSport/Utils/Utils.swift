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

struct Request {
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

class Utils{
    
    
}
