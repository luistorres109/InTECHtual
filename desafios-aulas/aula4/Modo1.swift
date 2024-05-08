//
//  Modo1.swift
//  Aula01
//
//  Created by Turma02-19 on 07/05/24.
//

import SwiftUI

struct Modo1: View {
    @State  var x: Song 
    var body: some View {
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
                AsyncImage(url: URL(string: x.capa)){
                    image in
                    image
                        .image?.resizable()
                        .frame(width: 200, height: 200)
                }
    
                Spacer()
                    .frame(height: 50)
                HStack(spacing: 30)
                {
                    Image(systemName: "shuffle")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:40, height:40)
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:40, height:40)
                    Image(systemName: "play.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:50, height:50)
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:40, height:40)
                    Image(systemName: "repeat")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:40, height:40)
                }//.padding()
               // .frame(width: 400, alignment: .center)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Modo1(x: Song(id: 1, name:"Fear of the Dark", artist:"Iron Maiden", capa:"https://whiplash.net/imagens_promo_22/ironmaiden_fearofthedark.jpg"))
}
