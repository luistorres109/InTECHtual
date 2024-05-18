import SwiftUI

struct InkView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .edgesIgnoringSafeArea(.top)
            Rectangle()
                .cornerRadius(360)
                .frame(width: 300, height: 300)
                .overlay(
                    Image(systemName: "paintpalette")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 200))
        } 
    }
}
