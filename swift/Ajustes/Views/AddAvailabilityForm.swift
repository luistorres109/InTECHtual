import SwiftUI

struct AddAvailabilityForm: View {
    @Binding var availabilities: [Availability]
    @State private var selectedDay: DayOfWeek = .monday
    @State var from: String = ""
    @State var to: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Environment(\.presentationMode) var presentationMode

    var initialAvailability: Availability?

    init(availabilities: Binding<[Availability]>, initialAvailability: Availability? = nil) {
        self._availabilities = availabilities
        if let initialAvailability = initialAvailability {
            self._selectedDay = State(initialValue: initialAvailability.dayOfWeek)
            self._from = State(initialValue: initialAvailability.from)
            self._to = State(initialValue: initialAvailability.to)
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Picker("Dia da Semana", selection: $selectedDay) {
                    ForEach(DayOfWeek.allCases, id: \.self) { day in
                        Text(day.rawValue).tag(day)
                    }
                }
                
                HStack {
                    TextField("De", text: $from)
                        .textContentType(.none)
                        .keyboardType(.numberPad)
                        .onChange(of: from) { newValue in
                            from = formatTimeInput(newValue)
                        }
                    TextField("Às", text: $to)
                        .textContentType(.none)
                        .keyboardType(.numberPad)
                        .onChange(of: to) { newValue in
                            to = formatTimeInput(newValue)
                        }
                }
                
                Button("Adicionar") {
                    if from.isEmpty || to.isEmpty {
                        alertMessage = "Os campos de horário não podem estar vazios."
                        showAlert = true
                    } else if !isValidTimeRange(from: from, to: to) {
                        alertMessage = "A hora de 'Às' deve ser maior que a hora de 'De'."
                        showAlert = true
                    } else {
                        let newAvailability = Availability(dayOfWeek: selectedDay, from: from, to: to)
                        if let index = availabilities.firstIndex(where: { $0.id == newAvailability.id }) {
                            availabilities[index] = newAvailability
                        } else {
                            availabilities.append(newAvailability)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Erro"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .navigationBarTitle("Adicionar Disponibilidade", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            })
        }
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
