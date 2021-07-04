//
//  SplashInteractorImpl.swift
//  CiceSport
//
//  Created by cice on 04/07/2021.
//

import Foundation

protocol SplashInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping ([MenuResponse]?) -> (), failure:@escaping(ApiError?) -> ())
}

class SplashInteractorImpl: BaseInteractor<SplashPresenterProtocol>{
    
    var provider: SplashProviderProtocol = SplashProviderImpl()

}

extension SplashInteractorImpl: SplashInteractorProtocol {
    internal func fetchDataFromHerokuBusiness(success: @escaping ([MenuResponse]?) -> (), failure:@escaping(ApiError?) -> ()) { //Callback
        self.provider.fetchMenu{ [weak self] (result) in
        guard self != nil else { return }
        switch result{
            case.success(let response):
             success(responseMenuModel.menuResponse)
            case.failure(let error):
             failure(error)
        }
      }
    }

}