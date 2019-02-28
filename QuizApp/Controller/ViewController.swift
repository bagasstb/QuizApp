//
//  ViewController.swift
//  QuizApp
//
//  Created by bagasstb on 28/02/19.
//  Copyright © 2019 xProject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestion = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func truePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func falsePressed(_ sender: UIButton) {
        
    }
    
    func updateUI() {
        
    }
    
    func nextQuestion() {
        
    }
    
    func checkAnswer() {
        
    }
    
    func startOver() {
        
    }
}

