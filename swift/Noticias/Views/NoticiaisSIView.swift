//
//  NoticiaisSIView.swift
//  InTECHtual
//
//  Created by Turma02-19 on 24/05/24.
//

import SwiftUI

struct NoticiaSiView: View {
    @State var infoHerdada: resultados
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: infoHerdada.image_url!)){ b  in
                    b.resizable()
                        .frame(width: 300, height: 245)
                        .scaledToFit()
                }placeholder: {
                    Rectangle()
                        .frame(width: 330, height: 245)
                        .foregroundColor(.gray)
                        .cornerRadius(11)
                        .overlay(Text("Image Unavailable")
                            .foregroundColor(.cinzaLetraPlaceholder))
                    
                }
                Text(infoHerdada.title!)
                    .font(.title2)
                    .padding(10)
                
                Rectangle()
                    .frame(width: 368, height: 0.4)
                    .foregroundColor(.cinzaDivisorio)
                    .cornerRadius(160)
                    
                
                Text(infoHerdada.description!)
                    .font(.headline)
                    .frame(width: 350)
                    .padding(10)
                    
                Text(infoHerdada.content!)
                    .foregroundColor(.textoNews)
            }.padding(.horizontal, 10)
        }
    }
}

//#Preview{
//    NoticiaSiView(infoHerdada: resultados())
//}
