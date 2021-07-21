//
//  SplashViewController.swift
//  CiceSport
//
//  Created by cice on 24/05/2021.
//

import UIKit

protocol SplashViewControllerProtocol {
    func fetchDataFromPresent(data: MenuResponse)
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>,ReuseIdentifierInterfaceViewController /*UIViewController*/ {
    
    // MARK: - Variables
    var viewAnimator: UIViewPropertyAnimator!
    var unblockedGesture = Timer()
    
    // MARK: - IBOutlets
    @IBOutlet weak var myImageSplash: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromHeroku()

        // Do any additional setup after loading the view.
    }

    @objc
    func automaticHandler() {
        viewAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            self.myImageSplash.transform = CGAffineTransform(scaleX: 50, y: 50)
            self.myImageSplash.alpha = 0
        }
        viewAnimator.startAnimation()
        viewAnimator.addCompletion { _ in
            self.presenter?.showHomeTabBar()
        }
    }
    
	
    

}

extension SplashViewController: SplashViewControllerProtocol {
    func fetchDataFromPresent(data: MenuResponse){
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            self.myImageSplash.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.unblockedGesture = Timer.scheduledTimer(timeInterval: 1.5,
            target: self,
            selector: #selector(self.automaticHandler),
            userInfo: nil,
            repeats: false)
        }
        viewAnimator.startAnimation()
    }
    
}
