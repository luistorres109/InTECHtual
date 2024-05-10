import SwiftUI

struct Modo2: View {
    @State var nome: String
    @State var sobrenome: String
    var body: some View {
        NavigationStack{
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
                        .frame(width: 300, height: 200)
                        .cornerRadius(10)
                        .overlay(VStack{
                            Spacer()
                                .frame(height: 10)
                            Text("\(nome)")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 300)
                            Text("Bem vindo, \(nome)!")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 300)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Spacer()
                                .frame(height: 75)
                            
                            Rectangle()
                                .frame(width: 150, height: 40)
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .overlay(NavigationLink(destination: Modo3(nome: nome)){
                                    Text("Acessar Tela")
                                        .bold()
                                        .foregroundColor(.white)
                                })
                        })
                    Spacer()
                        .frame(height: 200)
                }
            }
        }
    }
}
