import Foundation

struct Question: Identifiable {
    let id: Int
    let text: String
    let options: [String]
    let correctAnswerIndex: Int
    let scores: [Int]
}
