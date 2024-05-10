import SwiftUI

struct SheetView: View {
    @State var nome: String
    @State var sobrenome: String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.color)
                .frame(height: 1000)
            VStack{
                Text("Modo 3")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                Spacer()
                    .frame(height: 200)
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(width: 300, height: 125, alignment: .center)
                    .cornerRadius(10)
                    .overlay(Text("Nome: \(nome)\nSobrenome: \(sobrenome)")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 300)
                        .bold())
                Spacer()
                    .frame(height: 200)
            }
        }
    }
}
