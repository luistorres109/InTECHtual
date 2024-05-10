import SwiftUI

struct ContentView: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var situacao: String = ""
    @State private var peso2: Double = 0
    @State private var altura2: Double = 0
    @State private var imc: Double = 0
    @State private var cor: Color = .green
    var body: some View {
        ZStack{
            cor
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    Text("Calculadora de IMC")
                        .font(.title)
                        .padding()
                    
                    TextField("Peso", text: $peso)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .frame(width: 350)
                        .border(Color .gray)
                    
                    Spacer()
                        .frame(height: 25)
                    
                    TextField("Altura", text: $altura)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .frame(width: 350)
                        .border(Color .gray)
                    
                    Spacer()
                        .frame(height: 25)
                    
                    Button("Calcular"){
                        peso2 = Double(peso) ?? 0
                        altura2 = Double(altura) ?? 0
                        
                        imc = peso2/(altura2 * altura2)
                        
                        if imc <= 18.5{
                            situacao = "Baixo peso"
                            cor = Color("Baixo peso")
                        } else if imc <= 24.9{
                            situacao = "Peso normal"
                            cor = Color("Normal")
                        } else if imc <= 29.9{
                            situacao = "Sobrepeso"
                            cor = Color("Sobrepeso")
                        } else if imc >= 30.0{
                            situacao = "Obeso"
                            cor = Color("Obesidade")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
                Spacer()
                Text(situacao)
                    .font(.title)
                    .padding()
                Spacer()
                Image("tabela-IMC")
                    .resizable()
                    .frame(width: 400, height: 250)
            }
        }
    }
}
