//
//  Question.swift
//  QuizApp
//
//  Created by bagasstb on 28/02/19.
//  Copyright © 2019 xProject. All rights reserved.
//

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
