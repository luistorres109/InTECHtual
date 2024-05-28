import Foundation

struct noticias: Decodable, Hashable {
    let status: String?
    let totalResults: Int?
    let results: [resultados]
    let nextPage: String
}

struct resultados: Decodable, Hashable {
    let title: String?
    let link: String?
    let keywords: [String]?
    let creator: [String]?
    let video_url: String?
    let description: String?
    let content: String?
    let pubDate: String?
    let full_description: String?
    let image_url: String?
    let source_id: String?
    let country: [String]?
    let category: [String]?
    let language: String?
}
