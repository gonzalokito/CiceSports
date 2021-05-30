//
//  BaseVIPER.swift
//  CiceSport
//
//  Created by cice on 24/05/2021.
//

import Foundation
import UIKit

class BaseViewController<P>:UIViewController {
    var presenter: P?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super .viewDidDisappear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

class BasePresenter<V, R/*, I*/>{
    
    internal var viewController: V?
    internal var router: R?
    
    convenience init(viewController: V? = nil, router: R? = nil){
        self.init()
        self.viewController = viewController
        self.router = router
    }
}

class BaseInteractor<P>{
    
    internal var presenter: P?
    
    convenience init(presenter: P){
        self.init()
        self.presenter = presenter
    }
    
}

class BaseRouter</*V,*/ P>{
    
    internal var presenter: P?
    
    internal var viewController: UIViewController?
    
    
    convenience init(presenter: P? = nil, view:UIViewController? = nil){
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    internal func showVC (_ vc: UIViewController){
        if let navigationController = viewController?.navigationController{
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    internal func presentVC (_ vcToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil){
        if let navigationController = viewController?.navigationController{
            navigationController.present(vcToPresent, animated: flag, completion: completion)
            return
        }
        viewController?.present(vcToPresent, animated: flag, completion: completion)
    }
    
}

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
