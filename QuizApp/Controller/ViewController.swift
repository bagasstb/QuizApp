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
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func truePressed(_ sender: UIButton) {
        pickedAnswer = true
        checkAnswer()
        nextQuestion()
        
    }
    
    @IBAction func falsePressed(_ sender: UIButton) {
        pickedAnswer = false
        checkAnswer()
        nextQuestion()
    }
    
    func updateUI() {
        
    }
    
    func nextQuestion() {
        questionNumber+=1
        if questionNumber < 13 {
            questionLabel.text = allQuestion.list[questionNumber].questionText
        } else {
            showDialog(title: "Awesome", message: "You've finished all the question, do you want to start over?", positive: "Restart")
        }
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            print("YES!")
        } else {
            print("WRONG!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        questionLabel.text = allQuestion.list[0].questionText
    }
    
    func showDialog(title: String, message: String, positive: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: positive, style: .default) { (UIAlertAction) in
            self.startOver()
        }
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
}

