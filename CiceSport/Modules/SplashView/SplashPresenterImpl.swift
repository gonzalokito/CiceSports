//
//  SplashPresenterImpl.swift
//  CiceSport
//
//  Created by cice on 26/05/2021.
//

import Foundation

protocol SplashPresenterProtocol {
    func fetchDataFromHeroku()
    func showHomeTabBar()
}

	class SplashPresenterImpl: BasePresenter<SplashViewController, SplashRouterProtocol> {
    
    var interactor: SplashInteractorProtocol?
    var viewModel: [MenuResponse] = []

}

extension SplashPresenterImpl: SplashPresenterProtocol{
    internal func fetchDataFromHeroku() {
        self.interactor?.fetchDataFromHerokuBusiness(success: { [weak self]  resultArray in
            guard self != nil else { return }
            if let resultArraydDes = resultArray{
                self?.viewModel.removeAll()
                self?.viewModel = resultArraydDes
                self?.viewController?.fetchDataFromPresent(data: (self?.viewModel[0])!)
            }
        }, failure: { (error) in
            print(error?.localizedDescription ?? "Aqui Andres mete gamba")
        })
    }

    internal func showHomeTabBar() {
        /*self.router.showApp(dataMenu: self.viewModel)*/
    }
}
