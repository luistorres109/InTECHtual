import SwiftUI

struct TestView: View {
    @State private var showAlert = false
    @State private var showQuizView = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Testes")
                        .font(Font.largeTitle.weight(.bold))
                        .padding(10)
                    Spacer()
                }
                HStack {
                    VStack {
                        Rectangle()
                            .frame(width: 125, height: 100)
                            .foregroundColor(.blue)
                            .cornerRadius(25)
                            .overlay(
                                NavigationLink(destination: QuizView(), isActive: $showQuizView) {
                                    Button("Q.I") {
                                        showQuizView = true
                                    }
                                }
                            )
                    }
                    Spacer()
                        .frame(width: 50)
                    Rectangle()
                        .frame(width: 125, height: 100)
                        .foregroundColor(.blue)
                        .cornerRadius(25)
                        .overlay(Button("Atenção") {
                            showAlert = true
                        })
                        .alert("AVISO:\n Ainda nao esta pronto", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        }
                }
                .foregroundColor(.black)
                Spacer()
                    .frame(height: 50)
                HStack {
                    VStack {
                        Rectangle()
                            .frame(width: 125, height: 100)
                            .foregroundColor(.blue)
                            .cornerRadius(25)
                            .overlay(Button("Arquetipos") {
                                showAlert = true
                            })
                            .alert("AVISO:\n Ainda nao esta pronto", isPresented: $showAlert) {
                                Button("OK", role: .cancel) { }
                            }
                    }
                    Spacer()
                        .frame(width: 50)
                    VStack {
                        Rectangle()
                            .frame(width: 125, height: 100)
                            .foregroundColor(.blue)
                            .cornerRadius(25)
                            .overlay(Button("Inteligencia") {
                                showAlert = true
                            })
                            .alert("AVISO:\n Ainda nao esta pronto", isPresented: $showAlert) {
                                Button("OK", role: .cancel) { }
                            }
                    }
                }
                .foregroundColor(.black)
                Spacer()
                    .frame(width: 2000)
            }
            .padding()
            .navigationTitle("Testes")
            .navigationBarHidden(true)
        }
    }
}

#Preview{
    TestView()
}
