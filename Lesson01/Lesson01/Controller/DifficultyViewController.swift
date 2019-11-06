//
//  DifficultyViewController.swift
//  Lesson01
//
//  Created by Igor on 06.11.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import UIKit

class DifficultyViewController: UIViewController {

    @IBOutlet weak var difficultySwitcher: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        checkDifficulty()
    }
    
    func checkDifficulty() {
        if Game.shared.difficulty == .inseries {
            difficultySwitcher.setOn(false, animated: true)
        } else if Game.shared.difficulty == .random {
            difficultySwitcher.setOn(true, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func strategySwitcher(_ sender: UISwitch) {
        
        if difficultySwitcher.isOn {
            print("!!!!- Случайно -!!!")
            Game.shared.difficulty = .random
            print("\(Game.shared.difficulty)")
        } else if !difficultySwitcher.isOn {
            print("!!!!- Последовательно -!!!")
            Game.shared.difficulty = .inseries
            print("\(Game.shared.difficulty)")
        }
    }
    
}
