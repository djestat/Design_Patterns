//
//  ViewController.swift
//  ViperMusicPlayer
//
//  Created by Igor on 24.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        presentPlayer()
    }
  
    func presentPlayer() {
//        let pvc = Wireframe.build()
        router.openPlayer()
        guard let pvc = router.viewController else { return }

        self.present(pvc, animated: true, completion: nil)
    }
    
  
}

