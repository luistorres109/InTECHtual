import SwiftUI

struct QuizView: View {
    @State private var questions: [Question] = [
        Question(
            id: 1,
            text: "Série numérica: 2, 4, 8, 16, ...?",
            options: ["20", "24", "32", "64"],
            correctAnswerIndex: 2,
            scores: [40, 80, 160, 120]
        ),
        Question(
            id: 2,
            text: "Série numérica: 1, 1, 2, 3, 5, 8, ...?",
            options: ["10", "11", "13", "15"],
            correctAnswerIndex: 2,
            scores: [40, 80, 160, 120]
        ),
        Question(
            id: 3,
            text: "Série numérica: 3, 6, 9, 12, ...?",
            options: ["14", "15", "16", "18"],
            correctAnswerIndex: 3,
            scores: [40, 120, 80, 160]
        ),
        Question(
            id: 4,
            text: "Série numérica: 10, 7, 4, 1, ...?",
            options: ["-1", "0", "-2", "-3"],
            correctAnswerIndex: 2,
            scores: [80, 40, 160, 120]
        ),
        Question(
            id: 5,
            text: "Série numérica: 5, 10, 20, 40, ...?",
            options: ["60", "70", "80", "100"],
            correctAnswerIndex: 2,
            scores: [120, 40, 160, 80]
        )
    ]
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswerIndex: Int?
    @State private var totalScore = 0
    @State private var showResults = false
        
    var body: some View {
        VStack {
            if showResults {
                ResultsView(correctAnswers: totalScore, numberOfQuestions: questions.count)
            } else {
                Text("Questão \(currentQuestionIndex + 1) of \(questions.count)")
                    .padding()
                Text(questions[currentQuestionIndex].text)
                    .padding()
                
                ForEach(0..<questions[currentQuestionIndex].options.count, id: \.self) { index in
                    Button(action: {
                        self.selectedAnswerIndex = index
                        self.totalScore += self.questions[self.currentQuestionIndex].scores[index]
                    }) {
                        Text(self.questions[self.currentQuestionIndex].options[index])
                            .padding()
                            .background(self.selectedAnswerIndex == index ? Color.blue : Color.clear)
                            .foregroundColor(self.selectedAnswerIndex == index ? Color.white : Color.black)
                            .cornerRadius(10)
                    }
                    .disabled(self.selectedAnswerIndex != nil)
                }
                
                Button("Next Question") {
                    if self.currentQuestionIndex + 1 < self.questions.count {
                        self.currentQuestionIndex += 1
                        self.selectedAnswerIndex = nil
                    } else {
                        self.showResults = true
                    }
                }
                .padding()
                .disabled(self.selectedAnswerIndex == nil)
            }
        }
        .padding()
    }
}
