//
//  SplashPresenterImpl.swift
//  CiceSport
//
//  Created by cice on 26/05/2021.
//

import Foundation

protocol SplashPresenterProtocol {
    func fetchDataFromItunes()
}

class SplashPresenterImpl: BasePresenter<SplashViewController, SplashRouterProtocol> {
    
}

extension SplashPresenterImpl: SplashPresenterProtocol{
    func fetchDataFromItunes() {
        self.router?.goToDetialVC()
    }
    
    
}
