import SwiftUI

struct BrushView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.pink)
                .edgesIgnoringSafeArea(.top)
            
            Rectangle()
                .cornerRadius(360)
                .frame(width: 300, height: 300)
                .overlay(
                    Image(systemName: "paintbrush")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 200, height: 200))
        }
    }
}
