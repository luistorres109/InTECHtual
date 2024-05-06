import SwiftUI

struct Desafio1: View {
    var body: some View {
        VStack {
            HStack{
                Image("flor")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(100)
                Spacer()
                VStack(spacing: 10) {
                    Text("Hackatruck")
                        .foregroundColor(.red)
                    Text("77 universidades")
                        .foregroundColor(.blue)
                    Text("5 regiões no Brasil")
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding()
    }
}

struct Desafio2: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
            Spacer()
            HStack{
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
            }
        }
        .padding()
    }
}

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
