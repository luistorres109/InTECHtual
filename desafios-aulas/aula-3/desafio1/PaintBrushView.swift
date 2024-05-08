import SwiftUI

struct PaintBrushView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue)
                .edgesIgnoringSafeArea(.top)
            Rectangle()
                .cornerRadius(360)
                .frame(width: 300, height: 300)
                .overlay(
                    Image(systemName: "paintbrush.pointed")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 200))
        }
    }
}
