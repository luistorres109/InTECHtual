import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var x = ViewModel()
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.red)
                .frame(height: 1000)
            
            ScrollView(){
                ForEach(x.chars){ c in
                    HStack{
                        AsyncImage(url: URL(string: c.image!)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        
                        VStack{
                            Text(c.name!)
                                .frame(width: 275, alignment: .leading)
                            Text(c.house!)
                                .frame(width: 275, alignment: .leading)
                                .bold()
                        }
                    }
                    
                    
                    Spacer()
                        .frame(height: 25)
                    VStack{
                        Spacer()
                    }
                }
            }
        }
        .onAppear(){
            x.fetch()
        }
    }
}
