import Foundation

class ViewModel:ObservableObject {
    @Published var noti: [resultados] = []
    func fetch() {
        guard let url = URL(string:"https://newsdata.io/api/1/latest?apikey=pub_44656b7eac5f5fd4bc6970acccd7d677e750b&q=pegasus&language=en") else {
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
        
            do {
                let parsed = try JSONDecoder().decode(noticias.self, from:data)
                DispatchQueue.main.async {
                    self?.noti = parsed.results
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
