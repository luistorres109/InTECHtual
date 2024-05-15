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
                ForEach(x.heroes, id: \.self){ c in
                    HStack{
                        VStack{
                            Text(c.codnome!)
                                .frame(width: 275, alignment: .leading)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                            Text(c.id_civil!)
                                .frame(width: 275, alignment: .leading)
                                .bold()
                            
                            HStack{
                                Text("Identidade: ")
                                    .bold()
                                Spacer()
                                    .frame(width: 0)
                                Text("\(c.identidade!)")
                                Spacer()
                                    .frame(width: 15)
                                Text("Status: ")
                                    .bold()
                                Spacer()
                                    .frame(width: 0)
                                if c.status! == 1{
                                    Text("Vivo")
                                } else {
                                    Text("Morto")
                                }
                            }
                            .frame(width: 275, alignment: .leading)
                            
                            Spacer()
                                .frame(height: 150)
                        }
                    }
                    .frame(width: 375)
                }
            }
        }
        .onAppear(){
            x.fetch()
        }
    }
}
