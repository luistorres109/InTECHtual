import SwiftUI

struct Song: Identifiable{
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

var musicas = [
    Song(id: 1, name:"Fear of the Dark", artist:"Iron Maiden", capa:"https://whiplash.net/imagens_promo_22/ironmaiden_fearofthedark.jpg"),
    Song(id: 2, name:"The Day That Never Comes", artist:"Metallica", capa:"https://i.scdn.co/image/ab67616d0000b273cc3d90a213c4c577b37497ec"),
    Song(id: 3, name:"Metal is the Law", artist:"Massacration", capa:"https://akamai.sscdn.co/uploadfile/letras/albuns/7/9/b/6/11413.jpg"),
    
    Song(id: 4, name:"Chop Suey", artist:"System of a Down", capa:"https://i.ytimg.com/vi/CSvFpBOe8eY/maxresdefault.jpg"),
]

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [
                    Color(.blue),
                    Color(.black)
                ]),
                               startPoint: .topLeading,
                               endPoint: .bottom)
                .ignoresSafeArea()
                VStack{
                    Spacer()
                        .frame(height: 100)
                    AsyncImage(url: URL(string: "https://whiplash.net/imagens_promo_22/ironmaiden_fearofthedark.jpg")){
                        image in
                        image
                            .image?.resizable()
                            .frame(width: 200, height: 200)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Metal FM")
                        .frame(width: 350, alignment: .leading)
                        .foregroundColor(.white)
                        .font(.title)
                    
                    HStack{
                        AsyncImage(url: URL(string: "https://whiplash.net/imagens_promo_22/ironmaiden_fearofthedark.jpg")){
                            image in
                            image
                                .image?.resizable()
                                .frame(width: 20, height: 20, alignment: .leading)
                                .aspectRatio(contentMode: .fill)
                        }
                        
                        Text("Luis")
                            .frame(width: 350, alignment: .leading)
                            .foregroundColor(.white)
                    }
                    .frame(width: 400)
                    Spacer()
                    
                    ForEach(musicas){ m in
                        NavigationLink(destination: Modo1(x: m)){
                            HStack{
                                AsyncImage(url: URL(string: m.capa)) { image in
                                          image
                                              .resizable()
                                              .frame(width: 50, height: 60)
                                              .aspectRatio(contentMode: .fill)
                                      } placeholder: {
                                          Color.gray
                                      }
                                VStack{
                                    Text(m.name)
                                        .frame(width: 300, alignment: .leading)
                                        .foregroundColor(.white)
                                    Spacer()
                                        .frame(height: 10)
                                    Text(m.artist)
                                        .frame(width: 300, alignment: .leading)
                                        .foregroundColor(.white)
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
