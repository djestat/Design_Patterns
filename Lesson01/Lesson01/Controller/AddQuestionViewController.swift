//
//  AddQuestionViewController.swift
//  Lesson01
//
//  Created by Igor on 06.11.2019.
//  Copyright © 2019 IgorLab. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var questionTextFiel: UITextField!
    @IBOutlet weak var ansverATextFiel: UITextField!
    @IBOutlet weak var ansverBTextFiel: UITextField!
    @IBOutlet weak var ansverCTextFiel: UITextField!
    @IBOutlet weak var ansverDTextFiel: UITextField!
    
    @IBOutlet weak var ansverSegmentControl: UISegmentedControl!
    
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
    @IBAction func addQuestionButton(_ sender: Any) {
        if !questionTextFiel.text!.isEmpty && !ansverATextFiel.text!.isEmpty && !ansverBTextFiel.text!.isEmpty && !ansverCTextFiel.text!.isEmpty && !ansverDTextFiel.text!.isEmpty {
            print("Not nul")
            
            let data = QuestionsCaretaker()
            var questions = data.retriveQuestions()
            let newQuestion = Question.init(question: questionTextFiel.text!, answersVariants: [ansverATextFiel.text!, ansverBTextFiel.text!, ansverCTextFiel.text!, ansverDTextFiel.text!], answer: ansverSegmentControl.selectedSegmentIndex + 1, winMoney: 0)
            questions.append(newQuestion)
            data.save(questions)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
