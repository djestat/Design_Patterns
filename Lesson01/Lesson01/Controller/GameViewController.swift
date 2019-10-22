//
//  GameViewController.swift
//  Lesson01
//
//  Created by Igor on 22.10.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var QuestionOutlet: UITextView!
    
    @IBOutlet weak var ButtonAOutlet: UIButton!
    @IBOutlet weak var ButtonBOutlet: UIButton!
    @IBOutlet weak var ButtonCOutlet: UIButton!
    @IBOutlet weak var ButtonDOutlet: UIButton!
    
    @IBOutlet weak var Score: UILabel!
    
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
    @IBAction func ButtonAAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ButtonBAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func ButtonCAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func ButtonDAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
}
