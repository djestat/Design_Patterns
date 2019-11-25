//
//  ViewController.swift
//  ViperMusicPlayer
//
//  Created by Igor on 24.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let curtvFrame = CGRect(x: 10, y: 100, width: 280, height: 310)
        let curtv = CurrentTrackView(frame: curtvFrame)
        
        let frame = CGRect(x: 10, y: 500, width: 280, height: 100)
        let ctv = ControlTrackView(frame: frame)
        
        self.view.addSubview(curtv)
        self.view.addSubview(ctv)
    }


}

