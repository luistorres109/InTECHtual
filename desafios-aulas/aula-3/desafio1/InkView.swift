//
//  InkView.swift
//  Aula01
//
//  Created by Turma02-19 on 06/05/24.
//

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

#Preview {
    InkView()
}
