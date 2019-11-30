//
//  Router.swift
//  ViperMusicPlayer
//
//  Created by Igor on 26.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

class Wireframe {
    
    static func build() -> UIViewController {
        let router = Router()
        let interactor = Interactor()
        let presenter = Presenter()
        
        let viewController = PlayerViewController()
        
        presenter.view = viewController
        presenter.interactor = interactor
        router.viewController = viewController
        
        print("Wireframe")
        return viewController
    }
    
}


class Router: PlayerRouterInput {
    
    weak var viewController: PlayerViewController?
    
    func openPlayer() {
        self.viewController? = PlayerViewController()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        self.viewController = storyboard.instantiateViewController(withIdentifier: "PlayerViewController")
        print("Router")
    }
    
}

