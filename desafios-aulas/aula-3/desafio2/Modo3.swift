import SwiftUI

struct Modo3: View {
    @State var nome: String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.color)
                .frame(height: 1000)
            VStack{
                Text("Modo 2")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Spacer()
                    .frame(height: 200)
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(width: 200, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .overlay(Text("Volte, \(nome)!")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 300)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold())
                Spacer()
                    .frame(height: 200)
            }
        }
    }
}
