import SwiftUI

struct ContentView: View {
    @State private var show: Bool = false
    @State var nome: String = "Luís"
    @State var sobrenome: String = "Torres"
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .foregroundColor(.color)
                    .frame(height: 1000)
                
                VStack{
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(width: 250, height: 75)
                        .overlay(
                            NavigationLink("Modo 1", destination: Modo1(nome: nome, sobrenome: sobrenome))
                                .foregroundColor(.white)
                        )
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(width: 250, height: 75)
                        .overlay(
                            NavigationLink("Modo 2", destination: Modo2(nome: nome, sobrenome: sobrenome))
                                .foregroundColor(.white)
                        )
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(width: 250, height: 75)
                        .overlay(
                            Button("Modo 3"){
                                show = true
                            }
                                .sheet(isPresented: $show){
                                    SheetView(nome: nome, sobrenome: sobrenome)
                                })
                                .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
