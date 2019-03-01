//
//  ViewController.swift
//  QuizApp
//
//  Created by bagasstb on 28/02/19.
//  Copyright © 2019 xProject. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    let allQuestion = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateUI()
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
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / \(allQuestion.list.count) Question"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    
    func nextQuestion() {
        questionNumber = questionNumber + 1
        if questionNumber < 13 {
            questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
        } else {
            showDialog(title: "Awesome", message: "You've finished all the question, do you want to start over?", positive: "Restart")
        }
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            score = score + 1
            updateUI()
            SVProgressHUD.showSuccess(withStatus: "Correct")
        } else {
            updateUI()
            SVProgressHUD.showError(withStatus: "Wrong!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        questionLabel.text = allQuestion.list[0].questionText
        updateUI()
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

