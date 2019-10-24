//
//  ViewController.swift
//  Lesson01
//
//  Created by Igor on 22.10.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gameButton(_ sender: Any) {
    }
    
    @IBAction func scoresButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.delegate = self
        default:
            break
        }
    }
    
}

extension ViewController: GameViewControllerDelegate {
    func didFinishGame(withScore score: GameSession) {
        print(score.rightAnswer)
        Game.shared.gameSession = score
        Game.shared.addResult()
        Game.shared.clearGameSession()
    }
}
