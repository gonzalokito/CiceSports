//
//  SplashViewController.swift
//  CiceSport
//
//  Created by cice on 24/05/2021.
//

import UIKit

class SplashViewController: BaseViewController<SplashPresenterProtocol>,ReuseIdentifierInterfaceViewController /*UIViewController*/ {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromHeroku()

        // Do any additional setup after loading the view.
    }


}
