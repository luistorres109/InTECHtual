import SwiftUI

struct AjustesView: View {
    @State private var motivos = [
        Option(id: 1, text: "Academico", isChecked: false),
        Option(id: 2, text: "Pessoal", isChecked: false),
    ]
    @State private var areas = [
        Option(id: 1, text: "Tecnologia", isChecked: false),
        Option(id: 2, text: "Filosofia", isChecked: false),
        Option(id: 3, text: "Ciência", isChecked: false)
    ]
    @State private var dificuldades = [
        Option(id: 1, text: "Falta de tempo", isChecked: false),
        Option(id: 2, text: "Falta de atenção", isChecked: false),
        Option(id: 3, text: "Não consigo assimilar o conteúdo", isChecked: false)
    ]
    @State private var availabilities: [Availability] = []
    @State private var showingAddAvailabilityForm: Bool = false
    @State private var showAlert = false
    @State private var alertMessage = "Os horários estão incompativeis"
    @State private var selectedAvailability: Availability?

    var body: some View {
        ScrollView(showsIndicators: true) {
            Text("Ajustes")
                .font(.title)
            
            Spacer()
                .frame(height: 10)
            
            Text("Motivo")
            List {
                ForEach($motivos) { $motivo in
                    HStack {
                        Image(systemName: motivo.isChecked ? "checkmark.square" : "square")
                            .onTapGesture {
                                motivo.isChecked.toggle()
                            }
                        Text(motivo.text)
                    }
                }
            }
            .frame(height: 150)
            
            Spacer()
                .frame(height: 10)
            
            Text("Áreas de estudos")
            List {
                ForEach($areas) { $area in
                    HStack {
                        Image(systemName: area.isChecked ? "checkmark.square" : "square")
                            .onTapGesture {
                                area.isChecked.toggle()
                            }
                        Text(area.text)
                    }
                }
            }
            .frame(height: 200)
            
            Spacer()
                .frame(height: 10)
            
            Text("Dificuldades")
            List {
                ForEach($dificuldades) { $dificuldade in
                    HStack {
                        Image(systemName: dificuldade.isChecked ? "checkmark.square" : "square")
                            .onTapGesture {
                                dificuldade.isChecked.toggle()
                            }
                        Text(dificuldade.text)
                    }
                }
            }
            .frame(height: 200)
            
            Spacer()
                .frame(height: 10)
            
            Text("Rotina")
            if !availabilities.isEmpty {
                List {
                    ForEach($availabilities) { $availability in
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Picker("Dia da Semana", selection: $availability.dayOfWeek) {
                                        ForEach(DayOfWeek.allCases, id: \.self) { day in
                                            Text(day.rawValue).tag(day)
                                        }
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                    HStack {
                                        Text(availability.from)
                                        Spacer()
                                        Text(availability.to)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                                Spacer()
                                VStack {
                                    Image(systemName: "square.and.pencil.circle.fill")
                                        .onTapGesture {
                                            selectedAvailability = availability
                                            showingAddAvailabilityForm = true
                                        }
                                    Image(systemName: "trash")
                                        .onTapGesture {
                                            if let index = availabilities.firstIndex(where: { $0.id == availability.id }) {
                                                availabilities.remove(at: index)
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                .frame(height: 150)
            }
            
            Button(action: {
                selectedAvailability = nil
                showingAddAvailabilityForm.toggle()
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("Adicionar Disponibilidade")
                }
                .padding()
            }
            .sheet(isPresented: $showingAddAvailabilityForm) {
                AddAvailabilityForm(availabilities: $availabilities, initialAvailability: selectedAvailability)
            }
        }
    }

    private func deleteAvailability(at offsets: IndexSet) {
        availabilities.remove(atOffsets: offsets)
    }

    private func formatTimeInput(_ input: String) -> String {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")

        let numericString = input.components(separatedBy: allowedCharacterSet.inverted).joined()

        let limitedString = String(numericString.prefix(4))

        let formattedString: String
        if limitedString.count > 2 {
            let index = limitedString.index(limitedString.startIndex, offsetBy: 2)
            let hour = limitedString[..<index]
            let minute = limitedString[index...]
            formattedString = "\(hour):\(minute)"
        } else {
            formattedString = limitedString
        }

        return formattedString
    }

    private func isValidTimeRange(from: String, to: String) -> Bool {
        let fromTime = Int(from.replacingOccurrences(of: ":", with: "")) ?? 0
        let toTime = Int(to.replacingOccurrences(of: ":", with: "")) ?? 0

        return toTime > fromTime
    }
}
