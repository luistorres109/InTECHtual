import SwiftUI

struct Desafio1: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
            Spacer()
            HStack{
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
            }
        }
        .padding()
    }
}
