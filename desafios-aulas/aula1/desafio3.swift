import SwiftUI

struct Desafio3: View {
    @State var showDetail: Bool = false
    @State private var givenName: String = ""
    @State private var displayAlerta: Bool = false
    
    var body: some View {
        ZStack {
            Image("flor")
                .resizable()
                .frame(width: 400, height: 500)
                .opacity(0.3)
            
            VStack{
                Text("Bem vindo, "+givenName)
                
                TextField("Seu nome", text: $givenName)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Button("Entrar"){
                    displayAlerta = true
                }
                .alert(isPresented: $displayAlerta){
                    Alert(title: Text("Atenção!"), message: Text("Você irá iniciar o desafio agora!"), dismissButton: .default(Text("OK"), action: {
                        self.showDetail = true
                    })
                    )
                }
            }
        }
        .padding()
    }
}
