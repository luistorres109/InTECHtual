import Foundation

struct Availability: Identifiable {
    let id = UUID()
    var dayOfWeek: DayOfWeek
    var from: String
    var to: String
}

enum DayOfWeek: String, CaseIterable {
    case sunday = "Domingo"
    case monday = "Segunda-feira"
    case tuesday = "Terça-feira"
    case wednesday = "Quarta-feira"
    case thursday = "Quinta-feira"
    case friday = "Sexta-feira"
    case saturday = "Sábado"
}
