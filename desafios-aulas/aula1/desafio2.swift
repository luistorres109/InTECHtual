import SwiftUI

struct Desafio2: View {
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
