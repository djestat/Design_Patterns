//
//  ViewController.swift
//  ViperMusicPlayer
//
//  Created by Igor on 24.11.2019.
//  Copyright © 2019 Igor Gapanovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewProtocol {    
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var interactor = Interactor()
    var presenter: Presenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter = Presenter(interactor: self.interactor, view: progressView)
        interactor.presenter = presenter
    }
    
    func play() {
        presenter?.play()
    }
    
    func pause() {
        presenter?.pause()
    }
    
    func stop() {
        presenter?.stop()
    }
    
    func previous() {
        
    }
    
    func next() {
        
    }
    
    @IBAction func playAction(_ sender: Any) {
        play()
    }
    
    @IBAction func pauseAction(_ sender: Any) {
        pause()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        stop()
    }
    
}

