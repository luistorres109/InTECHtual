import SwiftUI

struct ResultsView: View {
    let correctAnswers: Int
    let numberOfQuestions: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Seu QI é:\n\(correctAnswers / numberOfQuestions)")
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

