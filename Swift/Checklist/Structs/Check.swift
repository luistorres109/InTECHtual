import Foundation

struct batata: Codable, Hashable{
    let _id: String
    let _rev: String
    var isCompleted: Bool
    let dia: String
    let horarioInicio: String
    let horarioFim: String
    let atividade1: String
    let atividade2: String?
    let categoria: String?
}
