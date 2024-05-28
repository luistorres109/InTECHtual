import SwiftUI

struct NoticiasView: View {
    @StateObject var viewmodel = ViewModel()
    var body: some View {
        NavigationStack{
            HStack{
                Text("News")
                    .font(.title)
                Spacer()
            }
            Rectangle()
                .frame(height: 0.4)
                .foregroundColor(.cinzaDivisorio)
                .cornerRadius(168)
            
            VStack{
                ScrollView{
                    ForEach(viewmodel.noti, id:\.self){ a in
                        if(a.image_url != nil) {
                            NavigationLink(destination:NoticiaSiView(infoHerdada: a)){
                                HStack{
                                    AsyncImage(url: URL(string: a.image_url!)){ a  in
                                        a.resizable()
                                            .frame(width: 120, height: 100)
                                            .cornerRadius(11)
                                    }placeholder: {
                                        Rectangle()
                                            .frame(width: 120, height: 100)
                                            .foregroundColor(.gray)
                                            .cornerRadius(11)
                                            .overlay(Text("Image Unavailable")
                                                .foregroundColor(.cinzaLetraPlaceholder))
                                    }
                                    Text(a.title!)
                                        .font(Font.callout.weight(.heavy))
                                        .foregroundColor(.pretoTitulo)
                                    Spacer()
                                }.padding()
                            }
                            Rectangle()
                                .frame(width: 368,height: 0.4)
                                .foregroundColor(.cinzaDivisorio)
                                .ignoresSafeArea()
                                .cornerRadius(160)
                        }
                    }
                }
            }
        }.onAppear(){
            viewmodel.fetch()
        }
        .padding()
    }
}


