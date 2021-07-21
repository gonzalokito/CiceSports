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
    public typealias HTTPHeaders = [String: String]
    
    internal func setPrincipalViewController(in window: UIWindow){
        self.customUI()
        actualViewController = SplashAssembly.splashViewController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
    
    internal func createSlidingMenu(window: UIWindow, vc: UIViewController, menu: [MenuResponse]){
        self.customUI()
        let frontViewController = vc
        let rearViewController = MenuViewController()
        rearViewController.aux = menu
        let swrevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swrevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swrevealVC?.toggleAnimationDuration = 0.30
        window.rootViewController = swrevealVC
        window.makeKeyAndVisible()

    }

    fileprivate func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        //let toolBar= UIToolbar.appearence()

        navBar.barTintColor = #colorLiteral(red: 0.2328504622, green: 0.2328960001, blue: 0.2328444719, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.2328504622, green: 0.2328960001, blue: 0.2328444719, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navBar.barStyle = .black
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ]
    }

    public static let defaultHTTPHeaders: HTTPHeaders = {
        let BearerAuthentication = AuthHerokus.authHeroku
        return [
            "Authorization": BearerAuthentication
        ]
    }()
}
