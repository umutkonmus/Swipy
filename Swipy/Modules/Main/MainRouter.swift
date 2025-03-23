//
//  MainRouter.swift
//  Swipy
//
//  Created by Umut Konmuş on 22.03.2025.
//

import Foundation
import UIKit

protocol MainRouterInterface : RouterInterface {
    
}

final class MainRouter : MainRouterInterface {
    
    weak var navigationController: UINavigationController?
    
    weak var presenter: MainPresenter?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UINavigationController {
        
        let view = MainViewController.instantiate()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        
        let navigationController = UINavigationController(rootViewController: view)
        
        let router = MainRouter(navigationController: navigationController)
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        
        router.presenter = presenter
        interactor.output = presenter
        
        return navigationController
    }
}
