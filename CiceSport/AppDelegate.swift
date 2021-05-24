//
//  AppDelegate.swift
//  CiceSport
//
//  Created by cice on 24/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appAssembly:AppAssemblyProtocol = AppAssembly()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        //Variable temporal para comprobar que window no es nulo
        if let windowDes = window {
            appAssembly.setPrincipalViewController(in: windowDes)
        }
        return true
    }


}

