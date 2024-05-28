import SwiftUI

struct ChecklistView: View {
    
    @StateObject var tempoLivre = CronosViewModel()
    
    @State var showingAlert = false
    @State var msgAlert = false
    
    @State var teste : batata?
    var body: some View {
        VStack {
            HStack{
                Text("Checklist")
                    .font(Font.largeTitle.weight(.bold))
                    .padding(.leading)
                Spacer()
                    .frame(width: 10)
                Image(systemName: "checkmark.square")
                    .resizable()
                    .frame(width: 30, height: 30)
                Spacer()
            }
            HStack {
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 5){
                        Spacer()
                            .frame(height: 20)
                        VStack(alignment: .leading){
                            ForEach(Array(tempoLivre.cronos.enumerated()), id: \.offset) { index, a in
                                HStack{
                                    Image(systemName: a.isCompleted ? "checkmark.square.fill" : "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .transition(.scale)
                                        .animation(.easeInOut(duration: 0.2), value: a.isCompleted)
                                        .onTapGesture {
                                            teste = a
                                            withAnimation{
                                                
                                                var batataAtualiaza : batata = batata(_id: a._id, _rev: a._rev, isCompleted:  !a.isCompleted, dia: a.dia, horarioInicio: a.horarioInicio, horarioFim: a.horarioFim, atividade1: a.atividade1, atividade2: a.atividade2, categoria: a.categoria)
                                                
                                                tempoLivre.post(batataAtualiaza)
                                                
                                                
                                                
                                                msgAlert = tempoLivre.cronos[index].isCompleted
                                                
                                                showingAlert.toggle()
                                                tempoLivre.fetch()
                                            }
                                        }
                                    
                                    
                                    Text(a.horarioInicio)
                                        .font(.title)
                                    Text("-")
                                        .font(.title)
                                    Text(a.horarioFim)
                                        .font(.title)
                                }
                                HStack{
                                    Image(systemName: "diamond.fill")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text(a.atividade1)
                                    
                                }
                                if (a.atividade2 != ""){
                                    HStack{
                                        Image(systemName: "diamond.fill")
                                            .resizable()
                                            .frame(width: 8, height: 8)
                                        Text(a.atividade2!)
                                    }
                                } else {
                                    Text("")
                                }
                            }
                        }
                    } .alert(isPresented: $showingAlert) {
                        if (!teste!.isCompleted == true){
                            Alert(title: Text(" \(teste!.atividade1) "), message: Text("Concluído"), dismissButton: .cancel())
                        }else{
                            Alert(title: Text(" \(teste!.atividade1) "), message: Text("A Concluir"), dismissButton: .cancel())
                        }
                    }
                }
                Spacer()
            }.padding(.leading, 20)
            
        }.onAppear(){
            tempoLivre.fetch()
        }
    }
}
