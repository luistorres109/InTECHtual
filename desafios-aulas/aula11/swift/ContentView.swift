import SwiftUI

struct ContentView: View {
    @StateObject var x = ViewModel()
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .frame(height: 1000)
            
            ScrollView(showsIndicators: true){
                Spacer()
                    .frame(height: 150)
                ForEach(x.leitor, id: \.self){ c in
                    HStack{
                        Spacer()
                            .frame(width: 30)
                        VStack{
                            Text(c.horario!)
                                .frame(alignment: .leading)
                                .font(.headline)
                                .frame(height: 20)
                            HStack{
                                Text("Tensão: ")
                                    .bold()
                                    .frame(alignment: .leading)
                                Text(c.leitura!)
                                    .frame(alignment: .leading)
                                Spacer()
                                    .frame(width: 45)
                            }
                            Spacer()
                                .frame(height: 30)
                        }
                        Spacer()
                    }
                }
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            }
        }
        .onAppear(){
            x.fetch()
        }
    }
}
