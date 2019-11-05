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
            print("!!!!-IS ON-!!!")
            Game.shared.difficulty = .random
        } else if !difficultySwitcher.isOn {
            print("!!!!-IS OFF-!!!")
            Game.shared.difficulty = .inseries
        }
    }
    
}
