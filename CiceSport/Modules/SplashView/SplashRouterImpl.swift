//
//  SplashRouterImpl.swift
//  CiceSport
//
//  Created by cice on 07/06/2021.
//

import Foundation
import UIKit

protocol SplashRouterProtocol {
  func showApp(dataMenu: [MenuResponse])
}


class SplashRouterImpl: BaseRouter<SplashPresenterProtocol> {
  
}

extension SplashRouterImpl: SplashRouterProtocol {
    internal func showApp(dataMenu: [MenuResponse]){
      let delegate = UIApplication.shared.delegate as? AppDelegate
      let assembly = AppAssembly()
      let vc = HomeTabBarAssembly.homeTabBarController()
        assembly.createSlidingMenu(window: (delegate?.window)!, vc: vc, menu: dataMenu)
    }
}
