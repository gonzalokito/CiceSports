//
//  SplashRouterImpl.swift
//  CiceSport
//
//  Created by cice on 07/06/2021.
//

import Foundation

protocol SplashRouterProtocol {
  func gotoDetailVC()
}


class SplashRouterImpl: BaseRouter<SplashPresenterProtocol> {
  
}

extension SplashRouterImpl: SplashRouterProtocol {
    internal func gotoDetailVC(){
    }
}
