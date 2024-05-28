//
//  Question.swift
//  InTECHtual
//
//  Created by Turma02-19 on 24/05/24.
//

import Foundation

struct Question: Identifiable {
    let id: Int
    let text: String
    let options: [String]
    let correctAnswerIndex: Int
    let scores: [Int]
}
