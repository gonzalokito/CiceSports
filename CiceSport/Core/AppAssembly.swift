//
//  AppAssembly.swift
//  CiceSport
//
//  Created by cice on 24/05/2021.
//

//Controlador de vista
import Foundation
import UIKit

protocol AppAssemblyProtocol {
    func setPrincipalViewController(in window: UIWindow)
}

class AppAssembly: AppAssemblyProtocol {
    
    var actualViewController: UIViewController!
    
    internal func setPrincipalViewController(in window: UIWindow){
        
        actualViewController = SplashAssembly.splashNavigationController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
}
